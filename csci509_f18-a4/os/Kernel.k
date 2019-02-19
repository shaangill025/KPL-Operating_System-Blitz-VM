-- -*-Fundamental-*-
-- The above line for emacs if you use it

code Kernel

  -- <PUT YOUR NAME HERE>

-----------------------------  InitializeScheduler  ---------------------------------

  function InitializeScheduler ()
    --
    -- This routine assumes that we are in System mode.  It sets up the
    -- thread scheduler and turns the executing program into "main-thread".
    -- After exit, we can execute "Yield", "Fork", etc.  Upon return, the
    -- main-thread will be executing with interrupts enabled.
    --
      Cleari ()
      print ("Initializing Thread Scheduler...\n")
      readyList = new List [Thread]
      threadsToBeDestroyed = new List [Thread]
      mainThread = new Thread
      mainThread.Init ("main-thread")
      mainThread.status = RUNNING
      idleThread = new Thread
      idleThread.Init ("idle-thread")
      idleThread.Fork (IdleFunction, 0)
      currentThread = & mainThread
      FatalError = FatalError_ThreadVersion       -- Use a routine which prints threadname
      currentInterruptStatus = ENABLED
      Seti ()
    endFunction

-----------------------------  IdleFunction  ---------------------------------

  function IdleFunction (arg: int)
    --
    -- This is the "idle thread", a kernel thread which ensures that the ready
    -- list is never empty.  The idle thread constantly yields to other threads
    -- in an infinite loop.  However, before yielding, it first checks to see if
    -- there are other threads.  If there are no other threads, the idle thread
    -- will execute the "wait" instruction.  The "wait" instruction will enable
    -- interrupts and halt CPU execution until the next interrupt arrives.
    --
      var junk: int
      while true
        junk = SetInterruptsTo (DISABLED)
        if readyList.IsEmpty ()
          Wait ()
        else
          currentThread.Yield ()
        endIf
      endWhile
    endFunction

-----------------------------  Run  ---------------------------------

  function Run (nextThread: ptr to Thread)
    --
    -- Begin executing the thread "nextThread", which has already
    -- been removed from the readyList.  The current thread will
    -- be suspended; we assume that its status has already been
    -- changed to READY or BLOCKED.  We assume that interrupts are
    -- DISABLED when called.
    --
    -- This routine is called only from "Thread.Yield" and "Thread.Sleep".
    --
    -- It is allowable for nextThread to be currentThread.
    --
      var prevThread, th: ptr to Thread
      prevThread = currentThread
      prevThread.CheckOverflow ()
      -- If the previous thread was using the USER registers, save them.
      if prevThread.isUserThread
        SaveUserRegs (&prevThread.userRegs[0])
      endIf
      currentThread = nextThread
      nextThread.status = RUNNING
      --print ("SWITCHING from ")
      --print (prevThread.name)
      --print (" to ")
      --print (nextThread.name)
      --print ("\n")
      Switch (prevThread, nextThread)
      --print ("After SWITCH, back in thread ")
      --print (currentThread.name)
      --print ("\n")
      while ! threadsToBeDestroyed.IsEmpty ()
        th = threadsToBeDestroyed.Remove()
        threadManager.FreeThread (th)
      endWhile
      -- If the new thread uses the USER registers, restore them.
      if currentThread.isUserThread
        RestoreUserRegs (&currentThread.userRegs[0])
        currentThread.myProcess.addrSpace.SetToThisPageTable ()
      endIf
    endFunction

-----------------------------  PrintReadyList  ---------------------------------

  function PrintReadyList ()
    --
    -- This routine prints the readyList.  It disables interrupts during the
    -- printing to guarantee that the readyList won't change while it is
    -- being printed, which could cause disaster in this routine!
    --
    var oldStatus: int
      oldStatus = SetInterruptsTo (DISABLED)
      print ("Here is the ready list:\n")
      readyList.ApplyToEach (ThreadPrintShort)
      oldStatus = SetInterruptsTo (oldStatus)
    endFunction

-----------------------------  ThreadStartMain  ---------------------------------

  function ThreadStartMain ()
    --
    -- This function is called from the assembly language routine "ThreadStart".
    -- It is the first KPL code each thread will execute, and it will
    -- invoke the thread's "main" function, with interrupts enabled.  If the "main"
    -- function ever returns, this function will terminate this thread.  This
    -- function will never return.
    --
      var
        junk: int
        mainFun: ptr to function (int)
      -- print ("ThreadStartMain...\n")
      junk = SetInterruptsTo (ENABLED)
      mainFun = currentThread.initialFunction
      mainFun (currentThread.initialArgument)
      ThreadFinish ()
      FatalError ("ThreadFinish should never return")
    endFunction

-----------------------------  ThreadFinish  ---------------------------------

  function ThreadFinish ()
    --
    -- As the last thing to do in this thread, we want to clean up
    -- and reclaim the Thread object.  This method is called as the
    -- last thing the thread does; this is the normal way for a thread
    -- to die.  However, since the thread is still running in this,
    -- we can't actually do the clean up.  So we just make a note
    -- that it is pending.  After the next thread starts (in method "Run")
    -- we'll finish the job.
    --
      var junk: int
      junk = SetInterruptsTo (DISABLED)
      -- print ("Finishing ")
      -- print (currentThread.name)
      -- print ("\n")
      threadsToBeDestroyed.AddToEnd (currentThread)
      currentThread.Sleep ()
      -- Execution will never reach the next instruction
      FatalError ("This thread will never run again")
    endFunction

-----------------------------  FatalError_ThreadVersion  -----------------------

  function FatalError_ThreadVersion (errorMessage: ptr to array of char)
    --
    -- This function will print out the name of the current thread and
    -- the given error message.  Then it will call "RuntimeExit" to
    -- shutdown the system.
    --
      var
        junk: int
      junk = SetInterruptsTo (DISABLED)
      print ("\nFATAL ERROR")
      if currentThread    -- In case errors occur before thread initialization
        print (" in ")
        print (currentThread.name)
      endIf
      print (": \"")
      print (errorMessage)
      print ("\" -- TERMINATING!\n\n")
      print ("(To find out where execution was when the problem arose, type 'st' at the emulator prompt.)\n")
      RuntimeExit ()
    endFunction

-----------------------------  SetInterruptsTo  ---------------------------------

  function SetInterruptsTo (newStatus: int) returns int
    --
    -- This routine is passed a status (DISABLED or ENABLED).  It
    -- returns the previous interrupt status and sets the interrupt
    -- status to "newStatus".
    --
    -- Since this routine reads and modifies a shared variable
    -- (currentInterruptStatus), there is a danger of this routine
    -- being re-entered.  Therefore, it momentarily will disable
    -- interrupts, to ensure a valid update to this variable.
    --
      var
        oldStat: int
      Cleari ()
      oldStat = currentInterruptStatus
      if newStatus == ENABLED
        currentInterruptStatus = ENABLED
        Seti ()
      else
        currentInterruptStatus = DISABLED
        Cleari ()
      endIf
      return oldStat
    endFunction

-----------------------------  Semaphore  ---------------------------------

  behavior Semaphore
    -- This class provides the following methods:
    --    Up()  ...also known as "V" or "Signal"...
    --         Increment the semaphore count.  Wake up a thread if
    --         there are any waiting.  This operation always executes
    --         quickly and will not suspend the thread.
    --    Down()   ...also known as "P" or "Wait"...
    --         Decrement the semaphore count.  If the count would go
    --         negative, wait for some other thread to do an Up()
    --         first.  Conceptually, the count will never go negative.
    --    Init(initialCount)
    --         Each semaphore must be initialized.  Normally, you should
    --         invoke this method, providing an 'initialCount' of zero.
    --         If the semaphore is initialized with 0, then a Down()
    --         operation before any Up() will wait for the first
    --         Up().  If initialized with i, then it is as if i Up()
    --         operations have been performed already.
    --
    -- NOTE: The user should never look at a semaphore's count since the value
    -- retrieved may be out-of-date, due to other threads performing Up() or
    -- Down() operations since the retrieval of the count.

      ----------  Semaphore . Init  ----------

      method Init (initialCount: int)
          if initialCount < 0
            FatalError ("Semaphore created with initialCount < 0")
          endIf
          count = initialCount
          waitingThreads = new List [Thread]
        endMethod

      ----------  Semaphore . Up  ----------

      method Up ()
          var
            oldIntStat: int
            t: ptr to Thread
          oldIntStat = SetInterruptsTo (DISABLED)
          if count == 0x7fffffff
            FatalError ("Semaphore count overflowed during 'Up' operation")
          endIf
          count = count + 1
          if count <= 0
            t = waitingThreads.Remove ()
            t.status = READY
            readyList.AddToEnd (t)
          endIf
          oldIntStat = SetInterruptsTo (oldIntStat)
        endMethod

      ----------  Semaphore . Down  ----------

      method Down ()
          var
            oldIntStat: int
          oldIntStat = SetInterruptsTo (DISABLED)
          if count == 0x80000000
            FatalError ("Semaphore count underflowed during 'Down' operation")
          endIf
          count = count - 1
          if count < 0
            waitingThreads.AddToEnd (currentThread)
            currentThread.Sleep ()
          endIf
          oldIntStat = SetInterruptsTo (oldIntStat)
        endMethod

  endBehavior

-----------------------------  Mutex  ---------------------------------

  behavior Mutex
    -- This class provides the following methods:
    --    Lock()
    --         Acquire the mutex if free, otherwise wait until the mutex is
    --         free and then get it.
    --    Unlock()
    --         Release the mutex.  If other threads are waiting, then
    --         wake up the oldest one and give it the lock.
    --    Init()
    --         Each mutex must be initialized.
    --    IsHeldByCurrentThread()
    --         Return TRUE iff the current (invoking) thread holds a lock
    --         on the mutex.

       -----------  Mutex . Init  -----------

       method Init ()
           waitingThreads = new List [Thread]
         endMethod

       -----------  Mutex . Lock  -----------

       method Lock ()
           var
             oldIntStat: int
           if heldBy == currentThread
             FatalError ("Attempt to lock a mutex by a thread already holding it")
           endIf
           oldIntStat = SetInterruptsTo (DISABLED)
           if !heldBy
             heldBy = currentThread
           else
             waitingThreads.AddToEnd (currentThread)
             currentThread.Sleep ()
           endIf
           oldIntStat = SetInterruptsTo (oldIntStat)
         endMethod

       -----------  Mutex . Unlock  -----------

       method Unlock ()
           var
             oldIntStat: int
             t: ptr to Thread
           if heldBy != currentThread
             FatalError ("Attempt to unlock a mutex by a thread not holding it")
           endIf
           oldIntStat = SetInterruptsTo (DISABLED)
           t = waitingThreads.Remove ()
           if t
             t.status = READY
             readyList.AddToEnd (t)
             heldBy = t
           else
             heldBy = null
           endIf
           oldIntStat = SetInterruptsTo (oldIntStat)
         endMethod

       -----------  Mutex . IsHeldByCurrentThread  -----------

       method IsHeldByCurrentThread () returns bool
           return heldBy == currentThread
         endMethod

  endBehavior

-----------------------------  Condition  ---------------------------------

  behavior Condition
    -- This class is used to implement monitors.  Each monitor will have a
    -- mutex lock and one or more condition variables.  The lock ensures that
    -- only one process at a time may execute code in the monitor.  Within the
    -- monitor code, a thread can execute Wait() and Signal() operations
    -- on the condition variables to make sure certain condions are met.
    --
    -- The condition variables here implement "Mesa-style" semantics, which
    -- means that in the time between a Signal() operation and the awakening
    -- and execution of the corrsponding waiting thread, other threads may
    -- have snuck in and run.  The waiting thread should always re-check the
    -- data to ensure that the condition which was signalled is still true.
    --
    -- This class provides the following methods:
    --    Wait(mutex)
    --         This method assumes the mutex has alreasy been locked.
    --         It unlocks it, and goes to sleep waiting for a signal on
    --         this condition.  When the signal is received, this method
    --         re-awakens, re-locks the mutex, and returns.
    --    Signal(mutex)
    --         If there are any threads waiting on this condition, this
    --         method will wake up the oldest and schedule it to run.
    --         However, since this thread holds the mutex and never unlocks
    --         it, the newly awakened thread will be forced to wait before
    --         it can re-acquire the mutex and resume execution.
    --    Broadcast(mutex)
    --         This method is like Signal() except that it wakes up all
    --         threads waiting on this condition, not just the next one.
    --    Init()
    --         Each condition must be initialized.

      ----------  Condition . Init  ----------

      method Init ()
          waitingThreads = new List [Thread]
        endMethod

      ----------  Condition . Wait  ----------

      method Wait (mutex: ptr to Mutex)
          var
            oldIntStat: int
          if ! mutex.IsHeldByCurrentThread ()
            FatalError ("Attempt to wait on condition when mutex is not held")
          endIf
          oldIntStat = SetInterruptsTo (DISABLED)
          mutex.Unlock ()
          waitingThreads.AddToEnd (currentThread)
          currentThread.Sleep ()
          mutex.Lock ()
          oldIntStat = SetInterruptsTo (oldIntStat)
        endMethod

      ----------  Condition . Signal  ----------

      method Signal (mutex: ptr to Mutex)
          var
            oldIntStat: int
            t: ptr to Thread
          if ! mutex.IsHeldByCurrentThread ()
            FatalError ("Attempt to signal a condition when mutex is not held")
          endIf
          oldIntStat = SetInterruptsTo (DISABLED)
          t = waitingThreads.Remove ()
          if t
            t.status = READY
            readyList.AddToEnd (t)
          endIf
          oldIntStat = SetInterruptsTo (oldIntStat)
        endMethod

      ----------  Condition . Broadcast  ----------

      method Broadcast (mutex: ptr to Mutex)
          var
            oldIntStat: int
            t: ptr to Thread
          if ! mutex.IsHeldByCurrentThread ()
            FatalError ("Attempt to broadcast a condition when lock is not held")
          endIf
          oldIntStat = SetInterruptsTo (DISABLED)
          while true
            t = waitingThreads.Remove ()
            if t == null
              break
            endIf
            t.status = READY
            readyList.AddToEnd (t)
          endWhile
          oldIntStat = SetInterruptsTo (oldIntStat)
        endMethod

  endBehavior

-----------------------------  Thread  ---------------------------------

  behavior Thread

      ----------  Thread . Init  ----------

      method Init (n: String)
        --
        -- Initialize this Thread object, but do not schedule it for
        -- execution yet.
        --
          name = n
          status = JUST_CREATED
          -- The next line initializes the systemStack array, without filling it in.
          *((& systemStack) asPtrTo int) = SYSTEM_STACK_SIZE
          systemStack [0] = STACK_SENTINEL
          systemStack [SYSTEM_STACK_SIZE-1] = STACK_SENTINEL
          stackTop = & (systemStack[SYSTEM_STACK_SIZE-1])
          regs = new array of int { 13 of 0 }
          isUserThread = false
          userRegs = new array of int { 15 of 0 }
        endMethod

      ----------  Thread . Fork  ----------

      method Fork (fun: ptr to function (int), arg: int)
        --
        -- This method will schedule this thread for execution; in other words
        -- it will make it ready to run by adding it to the "ready queue."  This
        -- method is passed a function and a single integer argument.  When the
        -- thread runs, the thread will execute this function on that argument
        -- and then termiante.  This method will return after scheduling this
        -- thread.
        --
          var
            oldIntStat, junk: int
          oldIntStat = SetInterruptsTo (DISABLED)
          -- print ("Forking thread...\n")
          initialFunction = fun
          initialArgument = arg
          stackTop = stackTop - 4
          *(stackTop asPtrTo int) = ThreadStartUp asInteger
          status = READY
          readyList.AddToEnd (self)
          junk = SetInterruptsTo (oldIntStat)
        endMethod

      ----------  Thread . Yield  ----------

      method Yield ()
        --
        -- This method should only be invoked on the current thread.  The
        -- current thread may yield the processor to other threads by
        -- executing:
        --       currentThread.Yield ()
        -- This method may be invoked with or without interrupts enabled.
        -- Upon return, the interrupts will be in the same state; however
        -- since other threads are given a chance to run and they may allow
        -- interrupts, interrupts handlers may have been invoked before
        -- this method returns.
        --
          var
            nextTh: ptr to Thread
            oldIntStat, junk: int
          -- ASSERT:
              if self != currentThread
                FatalError ("In Yield, self != currentThread")
              endIf
          oldIntStat = SetInterruptsTo (DISABLED)
          -- print ("Yielding ")
          -- print (name)
          -- print ("\n")
          nextTh = readyList.Remove ()
          if nextTh
            -- print ("About to run ")
            -- print (nextTh.name)
            -- print ("\n")
            if status == BLOCKED
              FatalError ("Status of current thread should be READY or RUNNING")
            endIf
            status = READY
            readyList.AddToEnd (self)
            Run (nextTh)
          endIf
          junk = SetInterruptsTo (oldIntStat)
        endMethod

      ----------  Thread . Sleep  ----------

      method Sleep ()
        --
        -- This method should only be invoked on the current thread.  It
        -- will set the status of the current thread to BLCOKED and will
        -- will switch to executing another thread.  It is assumed that
        --     (1) Interrupts are disabled before calling this routine, and
        --     (2) The current thread has been placed on some other wait
        --         list (e.g., for a Semaphore) or else the thread will
        --         never get scheduled again.
        --
          var nextTh: ptr to Thread
          -- ASSERT:
              if currentInterruptStatus != DISABLED
                FatalError ("In Sleep, currentInterruptStatus != DISABLED")
              endIf
          -- ASSERT:
              if self != currentThread
                FatalError ("In Sleep, self != currentThread")
              endIf
          -- print ("Sleeping ")
          -- print (name)
          -- print ("\n")
          status = BLOCKED
          nextTh = readyList.Remove ()
          if nextTh == null
            FatalError ("Ready list should always contain the idle thread")
          endIf
          Run (nextTh)
        endMethod

      ----------  Thread . CheckOverflow  ----------

      method CheckOverflow ()
        --
        -- This method checks to see if this thread has overflowed its
        -- pre-alloted stack space.  WARNING: the approach taken here is only
        -- guaranteed to work "with high probability".
        --
          if systemStack[0] != STACK_SENTINEL
            FatalError ("System stack overflow detected!")
          elseIf systemStack[SYSTEM_STACK_SIZE-1] != STACK_SENTINEL
            FatalError ("System stack underflow detected!")
          endIf
        endMethod

      ----------  Thread . Print  ----------

      method Print ()
        --
        -- Print this object.
        --
          var i: int
              oldStatus: int
          oldStatus = SetInterruptsTo (DISABLED)
          print ("  Thread \"")
          print (name)
          print ("\"    (addr of Thread object: ")
          printHex (self asInteger)
          print (")\n")
          print ("    machine state:\n")
          for i = 0 to 12
            print ("      r")
            printInt (i+2)
            print (": ")
            printHex (regs[i])
            print ("   ")
            printInt (regs[i])
            print ("\n")
          endFor
          printHexVar ("    stackTop", stackTop asInteger)
          printHexVar ("    stack starting addr", (& systemStack[0]) asInteger)
          switch status
            case JUST_CREATED:
              print ("    status = JUST_CREATED\n")
              break
            case READY:
              print ("    status = READY\n")
              break
            case RUNNING:
              print ("    status = RUNNING\n")
              break
            case BLOCKED:
              print ("    status = BLOCKED\n")
              break
            case UNUSED:
              print ("    status = UNUSED\n")
              break
            default:
              FatalError ("Bad status in Thread")
          endSwitch
          print ("    is user thread: ")
          printBool (isUserThread)
          nl ()
          print ("    user registers:\n")
          for i = 0 to 14
            print ("      r")
            printInt (i+1)
            print (": ")
            printHex (userRegs[i])
            print ("   ")
            printInt (userRegs[i])
            print ("\n")
          endFor
          oldStatus = SetInterruptsTo (oldStatus)
        endMethod

  endBehavior

-----------------------------  ThreadPrintShort  ---------------------------------

  function ThreadPrintShort (t: ptr to Thread)
    --
    -- This function prints a single line giving the name of thread "t",
    -- its status, and the address of the Thread object itself (which may be
    -- helpful in distinguishing Threads when the name is not helpful).
    --
      var
        oldStatus: int = SetInterruptsTo (DISABLED)
      if !t
        print ("NULL\n")
        return
      endIf
      print ("  Thread \"")
      print (t.name)
      print ("\"    status=")
      switch t.status
        case JUST_CREATED:
          print ("JUST_CREATED")
          break
        case READY:
          print ("READY")
          break
        case RUNNING:
          print ("RUNNING")
          break
        case BLOCKED:
          print ("BLOCKED")
          break
        case UNUSED:
          print ("UNUSED")
          break
        default:
          FatalError ("Bad status in Thread")
      endSwitch
      print ("    (addr of Thread object: ")
      printHex (t asInteger)
      print (")")
      nl ()
      -- t.Print ()
      oldStatus = SetInterruptsTo (oldStatus)
    endFunction

-----------------------------  ThreadManager  ---------------------------------
  behavior ThreadManager

      ----------  ThreadManager . Init  ----------

      method Init ()
        --
        -- This method is called once at kernel startup time to initialize
        -- the one and only "ThreadManager" object.
        --
        var 
          index: int

        print ("Initializing Thread Manager...\n")
        freeList = new List[Thread]
        threadTable = new array of Thread {MAX_NUMBER_OF_PROCESSES of new Thread}

        -- Allocating a fixed number of threads to re-use
        threadTable[0].Init("thread_0")
        threadTable[1].Init("thread_1")
        threadTable[2].Init("thread_2")
        threadTable[3].Init("thread_3")
        threadTable[4].Init("thread_4")
        threadTable[5].Init("thread_5")
        threadTable[6].Init("thread_6")
        threadTable[7].Init("thread_7")
        threadTable[8].Init("thread_8")
        threadTable[9].Init("thread_9")

        -- We need to set the status for each thread
        -- to UNUSED, then add it to the freeList
        for index = 0 to MAX_NUMBER_OF_PROCESSES-1
            threadTable[index].status = UNUSED
            freeList.AddToEnd( & threadTable[index])
          endFor

        -- Initialize the ThreadManager Lock and
        -- condition variables
        threadManagerLock = new Mutex
        threadManagerLock.Init()
        aThreadBecameFree = new Condition
        aThreadBecameFree.Init()
        leadThread = new Condition
        leadThread.Init()
        endMethod

      ----------  ThreadManager . Print  ----------

      method Print ()
        -- 
        -- Print each thread.  Since we look at the freeList, this
        -- routine disables interrupts so the printout will be a
        -- consistent snapshot of things.
        -- 
        var i, oldStatus: int
          oldStatus = SetInterruptsTo (DISABLED)
          print ("Here is the thread table...\n")
          for i = 0 to MAX_NUMBER_OF_PROCESSES-1
            print ("  ")
            printInt (i)
            print (":")
            ThreadPrintShort (&threadTable[i])
          endFor
          print ("Here is the FREE list of Threads:\n   ")
          freeList.ApplyToEach (PrintObjectAddr)
          nl ()
          oldStatus = SetInterruptsTo (oldStatus)
        endMethod

      ----------  ThreadManager . GetANewThread  ----------

      method GetANewThread () returns ptr to Thread
        -- 
        -- This method returns a new Thread; it will wait
        -- until one is available.
        -- If the freeList is empty
        -- wait on condition of a thread becoming available
        -- 
        var
          threadToReturn: ptr to Thread
        
        threadManagerLock.Lock()
        while freeList.IsEmpty()
            leadThread.Wait(&threadManagerLock)
        endWhile

        threadToReturn = freeList.Remove()
        threadToReturn.status = JUST_CREATED
        aThreadBecameFree.Signal(&threadManagerLock)
        threadManagerLock.Unlock()
        return threadToReturn        
      endMethod

      ----------  ThreadManager . FreeThread  ----------

      method FreeThread (th: ptr to Thread)
        -- 
        -- This method is passed a ptr to a Thread;  It moves it
        -- to the FREE list.
        -- Add a Thread back to the freelist
        -- Signal anyone waiting on the condition
        threadManagerLock.Lock()
        if th
            th.status = UNUSED
            freeList.AddToEnd(th)
            leadThread.Signal(&threadManagerLock)
        else
            FatalError("Cannot Free an Invalid Thread")
        endIf
        threadManagerLock.Unlock()
      endMethod

    endBehavior

--------------------------  ProcessControlBlock  ------------------------------

  behavior ProcessControlBlock

      ----------  ProcessControlBlock . Init  ----------
      --
      -- This method is called once for every PCB at startup time.
      --
      method Init ()
          pid = -1
          status = FREE
          addrSpace = new AddrSpace
          addrSpace.Init ()
-- Uncomment this code later...
/*
          fileDescriptor = new array of ptr to OpenFile
                      { MAX_FILES_PER_PROCESS of null }
*/
        endMethod

      ----------  ProcessControlBlock . Print  ----------

      method Print ()
        --
        -- Print this ProcessControlBlock using several lines.
        --
        -- var i: int
          self.PrintShort ()
          addrSpace.Print ()
          print ("    myThread = ")
          ThreadPrintShort (myThread)
-- Uncomment this code later...
/*
          print ("    File Descriptors:\n")
          for i = 0 to MAX_FILES_PER_PROCESS-1
            if fileDescriptor[i]
              fileDescriptor[i].Print ()
            else
              print ("null\n")
            endIf
          endFor
          print (" Working Dir: ") workingDir.Print()
*/
        endMethod

      ----------  ProcessControlBlock . PrintShort  ----------

      method PrintShort ()
        --
        -- Print this ProcessControlBlock on one line.
        --
          print ("  ProcessControlBlock   (addr=")
          printHex (self asInteger)
          print (")   pid=")
          printInt (pid)
          print (", status=")
          if status == ACTIVE
            print ("ACTIVE")
          elseIf status == ZOMBIE
            print ("ZOMBIE")
          elseIf status == FREE
            print ("FREE")
          else
            FatalError ("Bad status in ProcessControlBlock")
          endIf
          print (", parentsPid=")
          printInt (parentsPid)
          print (", exitStatus=")
          printInt (exitStatus)
          nl ()
        endMethod

    endBehavior

-----------------------------  ProcessManager  ---------------------------------

  behavior ProcessManager

      ----------  ProcessManager . Init  ----------

      method Init ()
        --
        -- This method is called once at kernel startup time to initialize
        -- the one and only "processManager" object.  
        --
        -- initialize processTable array
        -- initialize the ProcessControlBlocks in that array
        -- initialize the processManagerLock
        -- initialize the aProcessBecameFree and aProcessDied 
        -- initialize the freeList
        var 
            index: int

        freeList = new List[ProcessControlBlock]
        -- processTable 
        processTable = new array of ProcessControlBlock {MAX_NUMBER_OF_PROCESSES of new ProcessControlBlock}
        for index = 0 to MAX_NUMBER_OF_PROCESSES-1
            processTable[index].Init()
            freeList.AddToEnd(& processTable[index])
        endFor
        -- processManagerLock, aProcessBecameFree and aProcessDied
        processManagerLock = new Mutex
        processManagerLock.Init()
        aProcessBecameFree = new Condition
        aProcessBecameFree.Init()
        aProcessDied = new Condition
        aProcessDied.Init()
      endMethod

      ----------  ProcessManager . Print  ----------

      method Print ()
        -- 
        -- Print all processes.  Since we look at the freeList, this
        -- routine disables interrupts so the printout will be a
        -- consistent snapshot of things.
        -- 
        var i, oldStatus: int
          oldStatus = SetInterruptsTo (DISABLED)
          print ("Here is the process table...\n")
          for i = 0 to MAX_NUMBER_OF_PROCESSES-1
            print ("  ")
            printInt (i)
            print (":")
            processTable[i].Print ()
          endFor
          print ("Here is the FREE list of ProcessControlBlocks:\n   ")
          freeList.ApplyToEach (PrintObjectAddr)
          nl ()
          oldStatus = SetInterruptsTo (oldStatus)
        endMethod

      ----------  ProcessManager . PrintShort  ----------

      method PrintShort ()
        -- 
        -- Print all processes.  Since we look at the freeList, this
        -- routine disables interrupts so the printout will be a
        -- consistent snapshot of things.
        -- 
        var i, oldStatus: int
          oldStatus = SetInterruptsTo (DISABLED)
          print ("Here is the process table...\n")
          for i = 0 to MAX_NUMBER_OF_PROCESSES-1
            print ("  ")
            printInt (i)
            processTable[i].PrintShort ()
          endFor
          print ("Here is the FREE list of ProcessControlBlocks:\n   ")
          freeList.ApplyToEach (PrintObjectAddr)
          nl ()
          oldStatus = SetInterruptsTo (oldStatus)
        endMethod

      ----------  ProcessManager . GetANewProcess  ----------

      method GetANewProcess () returns ptr to ProcessControlBlock
        --
        -- This method returns a new ProcessControlBlock; it will wait
        -- until one is available.
        --
        -- Similar to ThreadManager GetANewThread Implementation
        --
        var 
          processToReturn: ptr to ProcessControlBlock
        
        processManagerLock.Lock()
        while freeList.IsEmpty()
            aProcessBecameFree.Wait(&processManagerLock)
        endWhile
        processToReturn = freeList.Remove()
        processToReturn.status = ACTIVE
        processManagerLock.Unlock()
        return processToReturn
      endMethod

      ----------  ProcessManager . FreeProcess  ----------

      method FreeProcess (p: ptr to ProcessControlBlock)
        --
        -- This method is passed a ptr to a Process;  It moves it
        -- to the FREE list.
        -- FreeProcess method needs to change the process status to FREE
        -- and then add it to the free list
        --
        processManagerLock.Lock()
        p.status = FREE
        freeList.AddToEnd(p)
        aProcessBecameFree.Signal(&processManagerLock)
        processManagerLock.Unlock()
      endMethod
    endBehavior

-----------------------------  PrintObjectAddr  ---------------------------------

  function PrintObjectAddr (p: ptr to Object)
    --
    -- Print the address of the given object.
    --
      printHex (p asInteger)
      printChar (' ')
    endFunction

-----------------------------  ProcessFinish  --------------------------

  function ProcessFinish (exitStatus: int)
    --
    -- This routine is called when a process is to be terminated.  It will
    -- free the resources held by this process and will terminate the
    -- current thread.
    --
      var
        proc: ptr to ProcessControlBlock
        ignore: int
        i: int
        open: ptr to OpenFile

      -- Save exitStatus
      currentThread.myProcess.exitStatus = exitStatus

      -- Disable Interrupts
      ignore = SetInterruptsTo(DISABLED)

      -- Disconnect the PCB from the Thread
      proc = currentThread.myProcess
      currentThread.myProcess = null
      proc.myThread = null
      currentThread.isUserThread = false

      -- Close any open files
      for i = 0 to MAX_FILES_PER_PROCESS-1
          open = proc.fileDescriptor[i]
          if open != null
              fileManager.Close(open)
            endIf
        endFor

      --Re-enable interrupts
      ignore = SetInterruptsTo(ENABLED)
    
      -- Return all frames to the Free Pool and turn process into ZOMBIE
      frameManager.ReturnAllFrames( &proc.addrSpace)
      processManager.TurnIntoZombie(proc)
    
      --Terminate thread (Parent will deal with the Zombie)
      ThreadFinish()
    endFunction

-----------------------------  InitFirstProcess --------------------------------

  function InitFirstProcess ()
    --
    -- Initialize the first process ... just get a thread and fork it to use StartUserProcess
    --
      var 
        th: ptr to Thread

      th = threadManager.GetANewThread()
      th.Init("MyProgramRunner")
      th.Fork(StartFirstProcess, 0)
    endFunction

--------------------------  StartFirstProcess  -------------------------------
--
-- new thread should execute the StartUserProcess function, which will do the remainder
-- of the work in starting up a user-level process. InitFirstProcess can supply a zero as an argument
-- to StartUserProcess and can return after forking the new thread.
-- The first thing you’ll need to do in StartUserProcess is allocate a new PCB (with GetANewProcess)
--
-- and connect it with the thread. So initialize the myThread field in the PCB and the
-- myProcess field in the current thread. Next, you’ll need to open the executable file

function StartFirstProcess(arg: int)
  var
      ptrOpenFile: ptr to OpenFile
      ptrToPCB: ptr to ProcessControlBlock
      ptrInitSystemStackTop: ptr to int
      initPC: int
      initUserStackTop: int
      previousStatus: int

  --Allocate a new PCB and connect it with the current thread
  ptrToPCB = processManager.GetANewProcess()
  ptrToPCB.myThread = currentThread
  currentThread.myProcess = ptrToPCB

  -- Open the executable (hard coded)
  ptrOpenFile = fileManager.Open("TestProgram1")

  if ptrOpenFile == null
        FatalError("ERROR: Cannot open 'TestProgram1'.")
    endIf

    -- create the LogicalAddress space using 'LoadExecutable'
    -- And make sure to close the executable (otherwise a syste
    -- recourse will become permanently locked up)
    initPC = ptrOpenFile.LoadExecutable(& ptrToPCB.addrSpace)
    fileManager.Close(ptrOpenFile)

    -- Compute the initial value(# of pages * Page size) and then jump into the
    -- user-level program
    initUserStackTop = (ptrToPCB.addrSpace.numberOfPages * PAGE_SIZE)
    ptrInitSystemStackTop = &currentThread.systemStack[SYSTEM_STACK_SIZE-1]
    previousStatus = SetInterruptsTo(DISABLED)
    ptrToPCB.addrSpace.SetToThisPageTable()
    currentThread.isUserThread = true
    BecomeUserThread(initUserStackTop, initPC, ptrInitSystemStackTop asInteger, arg)
endFunction

-----------------------------  FrameManager  ---------------------------------

  behavior FrameManager

      ----------  FrameManager . Init  ----------

      method Init ()
        --
        -- This method is called once at kernel startup time to initialize
        -- the one and only "frameManager" object.  
        --
        var i: int
          print ("Initializing Frame Manager...\n")
          framesInUse = new BitMap
          framesInUse.Init (NUMBER_OF_PHYSICAL_PAGE_FRAMES)
          numberFreeFrames = NUMBER_OF_PHYSICAL_PAGE_FRAMES
          frameManagerLock = new Mutex
          frameManagerLock.Init ()
          newFramesAvailable = new Condition
          newFramesAvailable.Init ()
          -- Check that the area to be used for paging contains zeros.
          -- The BLITZ emulator will initialize physical memory to zero, so
          -- if by chance the size of the kernel has gotten so large that
          -- it runs into the area reserved for pages, we will detect it.
          -- Note: this test is not 100%, but is included nonetheless.
          for i = PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME
                   to PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME+300
                   by 4
            if 0 != *(i asPtrTo int)
              FatalError ("Kernel code size appears to have grown too large and is overflowing into the frame region")
            endIf
          endFor
        endMethod

      ----------  FrameManager . Print  ----------

      method Print ()
        --
        -- Print which frames are allocated and how many are free.
        --
          frameManagerLock.Lock ()
          print ("FRAME MANAGER:\n")
          printIntVar ("  numberFreeFrames", numberFreeFrames)
          print ("  Here are the frames in use: \n    ")
          framesInUse.Print ()
          frameManagerLock.Unlock ()
        endMethod

      ----------  FrameManager . GetAFrame  ----------

      method GetAFrame () returns int
        --
        -- Allocate a single frame and return its physical address.  If no frames
        -- are currently available, wait until the request can be completed.
        --
          var f, frameAddr: int

          -- Acquire exclusive access to the frameManager data structure...
          frameManagerLock.Lock ()

          -- Wait until we have enough free frames to entirely satisfy the request...
          while numberFreeFrames < 1
            newFramesAvailable.Wait (&frameManagerLock)
          endWhile

          -- Find a free frame and allocate it...
          f = framesInUse.FindZeroAndSet ()
          numberFreeFrames = numberFreeFrames - 1

          -- Unlock...
          frameManagerLock.Unlock ()

          -- Compute and return the physical address of the frame...
          frameAddr = PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME + (f * PAGE_SIZE)
          -- printHexVar ("GetAFrame returning frameAddr", frameAddr)
          return frameAddr
        endMethod

     ----------  FrameManager . PutAFrame  ----------

      /*method PutAFrame ( frameAddr: int )
      -- PutAFrame is similar to ReturnAllFrames, except this is used where the Kernel
      -- needs a frame that is not part of a user page table. These frames are returned 
      -- one at a time and will also need to “notify” any waiting threads that one more 
      -- frame has become available.
          var 
              bit : int
              flag: bool
          bit = (frameAddr - PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME) / PAGE_SIZE

          -- Aquire the lock
          frameManagerLock.Lock()
          flag = framesInUse.IsBitSet(bit)
          while flag
            newFramesAvailable.Wait(&frameManagerLock)
            flag = framesInUse.IsBitSet(bit)
          endWhile
          
          numberFreeFrames = numberFreeFrames - 1
          -- Broadcast
          newFramesAvailable.Broadcast(&frameManagerLock)          
          
          -- Release the lock
          frameManagerLock.Unlock()
      endMethod*/

    method PutAFrame ( frameAddr: int )
          var
             bit: int

          -- Aquire the lock
          frameManagerLock.Lock()
          bit = (frameAddr - PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME) / PAGE_SIZE
          framesInUse.ClearBit(bit)
          numberFreeFrames = numberFreeFrames+1

          -- Broadcast
          newFramesAvailable.Broadcast(&frameManagerLock)

          -- Release the lock
          frameManagerLock.Unlock()
    endMethod


      ----------  FrameManager . GetNewFrames  ----------

      method GetNewFrames (aPageTable: ptr to AddrSpace, numFramesNeeded: int)
          var
            index, addr, frame: int

          -- Aquire frame manager lock
          frameManagerLock.Lock()

          -- Waits on newFramesAvailable until there are enough frames
          while numberFreeFrames < numFramesNeeded
              newFramesAvailable.Wait(& frameManagerLock)
          endWhile

          -- Determine which frames are free, utilize the address 
          -- of the free frames and execute a setFrameAddr 
          -- to store the address of the frame 
          for index = 0 to numFramesNeeded-1
              frame = framesInUse.FindZeroAndSet()
              -- figuring out the address of the free frame
              addr = PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME + (frame * PAGE_SIZE)
              --  store address of the frame which has been allocated
              aPageTable.SetFrameAddr(index, addr)
          endFor

          -- Adjust the number of free frames
          numberFreeFrames = numberFreeFrames - numFramesNeeded

          -- Sets aPageTable.numberOfPages to the number of frames that were allocated
          aPageTable.numberOfPages = aPageTable.numberOfPages + numFramesNeeded

          -- Unlock
          frameManagerLock.Unlock()
        endMethod

      ----------  FrameManager . ReturnAllFrames  ----------

      method ReturnAllFrames (aPageTable: ptr to AddrSpace)
          -- First frame lock is aquired, then get the number of frames to return, and
          -- perform a loop over the frames to clear each bit. Following looping we do a 
          -- broadcast, update the aPageTable.numberOfPages and release the lock
          var
            index, holdFrames, addr, bit: int

          -- Aquire the lock
          frameManagerLock.Lock()
          aPageTable.SetToThisPageTable()

          -- get the number of frames to return
          holdFrames = aPageTable.numberOfPages
          
          -- Loop
          for index = 0 to holdFrames-1
              addr = aPageTable.ExtractFrameAddr(index)
              bit = (addr - PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME) / PAGE_SIZE
              framesInUse.ClearBit(bit)
              numberFreeFrames = numberFreeFrames+1
          endFor

          -- Broadcast
          newFramesAvailable.Broadcast(&frameManagerLock)

          -- Update the aPageTable.numberOfPages
          aPageTable.numberOfPages = aPageTable.numberOfPages - holdFrames

          -- Release the lock
          frameManagerLock.Unlock()
        endMethod

    endBehavior

-----------------------------  AddrSpace  ---------------------------------

  behavior AddrSpace

      ----------  AddrSpace . Init  ----------

      method Init ()
        --
        -- Initialize this object.
        --
          numberOfPages = 0
          pageTable = new array of int { MAX_PAGES_PER_VIRT_SPACE of 0x00000003 }
        endMethod

      ----------  AddrSpace . Print  ----------

      method Print ()
        --
        -- Print this object.
        --
          var i: int
          print ("        addr        entry          Logical    Physical   Undefined Bits  Dirty  Referenced  Writeable  Valid\n")
          print ("     ==========   ==========     ==========  ==========  ==============  =====  ==========  =========  =====\n")
          for i = 0 to numberOfPages-1
            print ("     ")
            printHex ((&pageTable[i]) asInteger)
            print (":  ")
            printHex (pageTable[i])
            print ("     ")
            printHex (i * PAGE_SIZE)   -- Logical address
            print ("  ")
            printHex (self.ExtractFrameAddr (i))       -- Physical address
            print ("    ")
            if self.ExtractUndefinedBits (i) != 0
              printHex (self.ExtractUndefinedBits (i))
            else
              print ("          ")
            endIf
            print ("     ")
            if self.IsDirty (i)
              print ("YES")
            else
              print ("   ")
            endIf
            print ("      ")
            if self.IsReferenced (i)
              print ("YES")
            else
              print ("   ")
            endIf
            print ("         ")
            if self.IsWritable (i)
              print ("YES")
            else
              print ("   ")
            endIf
            print ("      ")
            if self.IsValid (i)
              print ("YES")
            else
              print ("   ")
            endIf
            nl ()
          endFor
        endMethod

      ----------  AddrSpace . ExtractFrameAddr  ----------

      method ExtractFrameAddr (entry: int) returns int
        --
        -- Return the physical address of the frame in the selected page
        -- table entry.
        --
          return (pageTable[entry] & 0xffffe000) 
        endMethod

      ----------  AddrSpace . ExtractUndefinedBits  ----------

      method ExtractUndefinedBits (entry: int) returns int
        --
        -- Return the undefined bits in the selected page table entry.
        --
          return (pageTable[entry] & 0x00001ff0) 
        endMethod

      ----------  AddrSpace . SetFrameAddr  ----------

      method SetFrameAddr (entry: int, frameAddr: int)
        --
        -- Set the physical address of the frame in the selected page
        -- table entry to the value of the argument "frameAddr".
        --
          pageTable[entry] = (pageTable[entry] & 0x00001fff) | frameAddr
        endMethod

      ----------  AddrSpace . IsDirty  ----------

      method IsDirty (entry: int) returns bool
        --
        -- Return true if the selected page table entry is marked "dirty".
        --
          return (pageTable[entry] & 0x00000008) != 0
        endMethod

      ----------  AddrSpace . IsReferenced  ----------

      method IsReferenced (entry: int) returns bool
        --
        -- Return true if the selected page table entry is marked "referenced".
        --
          return (pageTable[entry] & 0x00000004) != 0
        endMethod

      ----------  AddrSpace . IsWritable  ----------

      method IsWritable (entry: int) returns bool
        --
        -- Return true if the selected page table entry is marked "writable".
        --
          return (pageTable[entry] & 0x00000002) != 0
        endMethod

      ----------  AddrSpace . IsValid  ----------

      method IsValid (entry: int) returns bool
        --
        -- Return true if the selected page table entry is marked "valid".
        --
          return (pageTable[entry] & 0x00000001) != 0
        endMethod

      ----------  AddrSpace . SetDirty  ----------

      method SetDirty (entry: int)
        --
        -- Set the selected page table entry's "dirty" bit to 1.
        --
          pageTable[entry] = pageTable[entry] | 0x00000008
        endMethod

      ----------  AddrSpace . SetReferenced  ----------

      method SetReferenced (entry: int)
        --
        -- Set the selected page table entry's "referenced" bit to 1.
        --
          pageTable[entry] = pageTable[entry] | 0x00000004
        endMethod

      ----------  AddrSpace . SetWritable  ----------

      method SetWritable (entry: int)
        --
        -- Set the selected page table entry's "writable" bit to 1.
        --
          pageTable[entry] = pageTable[entry] | 0x00000002
        endMethod

      ----------  AddrSpace . SetValid  ----------

      method SetValid (entry: int)
        --
        -- Set the selected page table entry's "valid" bit to 1.
        --
          pageTable[entry] = pageTable[entry] | 0x00000001
        endMethod

      ----------  AddrSpace . ClearDirty  ----------

      method ClearDirty (entry: int)
        --
        -- Clear the selected page table entry's "dirty" bit.
        --
          pageTable[entry] = pageTable[entry] & ! 0x00000008
        endMethod

      ----------  AddrSpace . ClearReferenced  ----------

      method ClearReferenced (entry: int)
        --
        -- Clear the selected page table entry's "referenced" bit.
        --
          pageTable[entry] = pageTable[entry] & ! 0x00000004
        endMethod

      ----------  AddrSpace . ClearWritable  ----------

      method ClearWritable (entry: int)
        --
        -- Clear the selected page table entry's "writable" bit.
        --
          pageTable[entry] = pageTable[entry] & ! 0x00000002
        endMethod

      ----------  AddrSpace . ClearValid  ----------

      method ClearValid (entry: int)
        --
        -- Clear the selected page table entry's "valid" bit.
        --
          pageTable[entry] = pageTable[entry] & ! 0x00000001
        endMethod

      ----------  AddrSpace . SetToThisPageTable  ----------

      method SetToThisPageTable ()
        --
        -- This method sets the page table registers in the CPU to
        -- point to this page table.  Later, when paging is enabled,
        -- this will become the active virtual address space.
        --
          LoadPageTableRegs ((& pageTable[0]) asInteger, numberOfPages*4)
        endMethod

      ----------  AddrSpace . CopyBytesFromVirtual  ----------

      method CopyBytesFromVirtual (kernelAddr, virtAddr, numBytes: int)
                    returns int
        --
        -- This method copies data from a user's virtual address space
        -- to somewhere in the kernel space.  We assume that the
        -- pages of the virtual address space are resident in
        -- physical page frames.  This routine returns the number of bytes
        -- that were copied; if there was any problem with the virtual
        -- addressed data, it returns -1.
        --
          var copiedSoFar, virtPage, offset, fromAddr: int
          -- print ("CopyBytesFromVirtual called...\n")
          -- printHexVar ("  kernelAddr", kernelAddr)
          -- printHexVar ("  virtAddr", virtAddr)
          -- printIntVar ("  numBytes", numBytes)
          if numBytes == 0
            return 0
          elseIf numBytes < 0
            return -1
          endIf
          virtPage = virtAddr / PAGE_SIZE
          offset = virtAddr % PAGE_SIZE
          -- printHexVar ("  virtPage", virtPage)
          -- printHexVar ("  offset", offset)
          while true
            if virtPage >= numberOfPages
              print ("  Virtual page number is too large!!!\n")
              return -1
            endIf
            if ! self.IsValid (virtPage)
              print ("  Virtual page is not marked VALID!!!\n")
              return -1
            endIf
            fromAddr = self.ExtractFrameAddr (virtPage) + offset
            -- printHexVar ("  Copying bytes from physcial addr", fromAddr)
            while offset < PAGE_SIZE
              -- printHexVar ("  Copying a byte to physcial addr", kernelAddr)
              -- printChar (* (fromAddr asPtrTo char))
              * (kernelAddr asPtrTo char) = * (fromAddr asPtrTo char)
              offset = offset + 1
              kernelAddr = kernelAddr + 1
              fromAddr = fromAddr + 1
              copiedSoFar = copiedSoFar + 1
              if copiedSoFar == numBytes
                return copiedSoFar
              endIf
            endWhile
            virtPage = virtPage + 1
            offset = 0
          endWhile
        endMethod

      ----------  AddrSpace . CopyBytesToVirtual  ----------

      method CopyBytesToVirtual (virtAddr, kernelAddr, numBytes: int)
                    returns int
        --
        -- This method copies data from the kernel's address space to
        -- somewhere in the virtual address space.  We assume that the
        -- pages of the virtual address space are resident in physical
        -- page frames.  This routine returns the number of bytes
        -- that were copied; if there was any problem with the virtual
        -- addressed data, it returns -1.
        --
          var copiedSoFar, virtPage, offset, destAddr: int
          if numBytes == 0
            return 0
          elseIf numBytes < 0
            return -1
          endIf
          virtPage = virtAddr / PAGE_SIZE
          offset = virtAddr % PAGE_SIZE
          while true
            if (virtPage >= numberOfPages) ||
               (! self.IsValid (virtPage)) ||
               (! self.IsWritable (virtPage))
              return -1
            endIf
            destAddr = self.ExtractFrameAddr (virtPage) + offset
            while offset < PAGE_SIZE
              * (destAddr asPtrTo char) = * (kernelAddr asPtrTo char)
              offset = offset + 1
              kernelAddr = kernelAddr + 1
              destAddr = destAddr + 1
              copiedSoFar = copiedSoFar + 1
              if copiedSoFar == numBytes
                return copiedSoFar
              endIf
            endWhile
            virtPage = virtPage + 1
            offset = 0
          endWhile
        endMethod

      ----------  AddrSpace . GetStringFromVirtual  ----------

      method GetStringFromVirtual (kernelAddr: String, virtAddr, maxSize: int) returns int
        --
        -- This method is used to copy a String from virtual space into
        -- a given physical address in the kernel.  The "kernelAddr" should be
        -- a pointer to an "array of char" in the kernel's code.  This method
        -- copies up to "maxSize" characters from approriate page frame to this
        -- to the target array in the kernel.
        --
        -- Note: This method resets the "arraySize" word in the target.  It is
        -- assumed that the target array has enough space; no checking is done.
        -- The caller should supply a "maxSize" telling how many characters may
        -- be safely copied.
        --
        -- If there are problems, then -1 is returned.  Possible problems:
        --       The source array has more than "maxSize" elements
        --       The source page is invalid or out of range
        -- If all okay, then the number of characters copied is returned.
        --
          var sourceSize: int
          -- print ("GetStringFromVirtual called...\n")
          -- printHexVar ("  kernelAddr", kernelAddr asInteger)
          -- printHexVar ("  virtAddr", virtAddr)
          -- printIntVar ("  maxSize", maxSize)
          -- Begin by fetching the source size
          if self.CopyBytesFromVirtual ((&sourceSize) asInteger,
                                        virtAddr,
                                        4) < 4
            return -1
          endIf
          -- printIntVar ("  sourceSize", sourceSize)
          -- Make sure the source size is okay
          if sourceSize > maxSize
            return -1
          endIf
          -- Change the size of the destination array
          * (kernelAddr asPtrTo int) = sourceSize
          -- Next, get the characters
          return self.CopyBytesFromVirtual (kernelAddr asInteger + 4,
                                            virtAddr + 4,
                                            sourceSize)
        endMethod

    endBehavior

-----------------------------  TimerInterruptHandler  ---------------------------------

  function TimerInterruptHandler ()
    --
    -- This routine is called when a timer interrupt occurs.  Upon entry,
    -- interrupts are DISABLED.  Upon return, execution will return to
    -- the interrupted process, which necessarily had interrupts ENABLED.
    --
    -- (If you wish to turn time-slicing off, simply disable the call
    -- to "Yield" in the code below.  Threads will then execute until they
    -- call "Yield" explicitly, or until they call "Sleep".)
    --
      currentInterruptStatus = DISABLED
      -- printChar ('_')
      currentThread.Yield ()
      currentInterruptStatus = ENABLED
    endFunction

-----------------------------  DiskInterruptHandler  --------------------------

  function DiskInterruptHandler ()
    --
    -- This routine is called when a disk interrupt occurs.  It will
    -- signal the "semToSignalOnCompletion" Semaphore and return to
    -- the interrupted thread.
    --
    -- This is an interrupt handler.  As such, interrupts will be DISABLED
    -- for the duration of its execution.
    --
      --FatalError ("DISK INTERRUPTS NOT EXPECTED IN PROJECT 3")

      currentInterruptStatus = DISABLED
      -- print ("DiskInterruptHandler invoked!\n")
      if diskDriver.semToSignalOnCompletion
        diskDriver.semToSignalOnCompletion.Up()
      endIf

    endFunction

-----------------------------  SerialInterruptHandler  --------------------------

  function SerialInterruptHandler ()
    --
    -- This routine is called when a serial interrupt occurs.  It will
    -- signal the "semToSignalOnCompletion" Semaphore and return to
    -- the interrupted thread.
    --
    -- This is an interrupt handler.  As such, interrupts will be DISABLED
    -- for the duration of its execution.
    --
      currentInterruptStatus = DISABLED
      -- NOT IMPLEMENTED
    endFunction
-----------------------------  IllegalInstructionHandler  --------------------------

  function IllegalInstructionHandler ()
    --
    -- This routine is called when an IllegalInstruction exception occurs.  Upon entry,
    -- interrupts are DISABLED.  We should not return to the code that had
    -- the exception.
    --
      currentInterruptStatus = DISABLED
      ErrorInUserProcess ("An IllegalInstruction exception has occured while in user mode")
    endFunction

-----------------------------  ArithmeticExceptionHandler  --------------------------

  function ArithmeticExceptionHandler ()
    --
    -- This routine is called when an ArithmeticException occurs.  Upon entry,
    -- interrupts are DISABLED.  We should not return to the code that had
    -- the exception.
    --
      currentInterruptStatus = DISABLED
      ErrorInUserProcess ("An ArithmeticException exception has occured while in user mode")
    endFunction

-----------------------------  AddressExceptionHandler  --------------------------

  function AddressExceptionHandler ()
    --
    -- This routine is called when an AddressException occurs.  Upon entry,
    -- interrupts are DISABLED.  We should not return to the code that had
    -- the exception.
    --
      currentInterruptStatus = DISABLED
      ErrorInUserProcess ("An AddressException exception has occured while in user mode")
    endFunction

-----------------------------  PageInvalidExceptionHandler  --------------------------

  function PageInvalidExceptionHandler ()
    --
    -- This routine is called when a PageInvalidException occurs.  Upon entry,
    -- interrupts are DISABLED.  For now, we simply print a message and abort
    -- the thread.
    --
      currentInterruptStatus = DISABLED
      ErrorInUserProcess ("A PageInvalidException exception has occured while in user mode")
    endFunction

-----------------------------  PageReadonlyExceptionHandler  --------------------------

  function PageReadonlyExceptionHandler ()
    --
    -- This routine is called when a PageReadonlyException occurs.  Upon entry,
    -- interrupts are DISABLED.  For now, we simply print a message and abort
    -- the thread.
    --
      currentInterruptStatus = DISABLED
      ErrorInUserProcess ("A PageReadonlyException exception has occured while in user mode")
    endFunction

-----------------------------  PrivilegedInstructionHandler  --------------------------

  function PrivilegedInstructionHandler ()
    --
    -- This routine is called when a PrivilegedInstruction exception occurs.  Upon entry,
    -- interrupts are DISABLED.  We should not return to the code that had
    -- the exception.
    --
      currentInterruptStatus = DISABLED
      ErrorInUserProcess ("A PrivilegedInstruction exception has occured while in user mode")
    endFunction

-----------------------------  AlignmentExceptionHandler  --------------------------

  function AlignmentExceptionHandler ()
    --
    -- This routine is called when an AlignmentException occurs.  Upon entry,
    -- interrupts are DISABLED.  We should not return to the code that had
    -- the exception.
    --
      currentInterruptStatus = DISABLED
      ErrorInUserProcess ("An AlignmentException exception has occured while in user mode")
    endFunction

-----------------------------  ErrorInUserProcess  --------------------------

  function ErrorInUserProcess (errorMessage: String)
    --
    -- This routine is called when an error has occurred in a user-level
    -- process.  It prints the error message and terminates the process.
    --
      print ("\n**********  ")
      print (errorMessage)
      print ("  **********\n\n")

      -- Print some information about the offending process...
      if currentThread.myProcess
        currentThread.myProcess.Print ()
      else
        print ("  ERROR: currentThread.myProcess is null\n\n")
      endIf
      currentThread.Print ()

      -- Uncomment the following for even more information...
      -- threadManager.Print ()
      -- processManager.Print ()

      ProcessFinish (-1)
    endFunction

-----------------------------  SyscallTrapHandler  --------------------------

  function SyscallTrapHandler (syscallCodeNum, arg1, arg2, arg3, arg4: int) returns int
    --
    -- This routine is called when a syscall trap occurs.  Upon entry, interrupts
    -- will be DISABLED, paging is disabled, and we will be running in System mode.
    -- Upon return, execution will return to the user mode portion of this
    -- thread, which will have had interrupts ENABLED.
    --
      currentInterruptStatus = DISABLED
      /*****
      print ("Within SyscallTrapHandler: syscallCodeNum=")
      printInt (syscallCodeNum)
      print (", arg1=")
      printInt (arg1)
      print (", arg2=")
      printInt (arg2)
      print (", arg3=")
      printInt (arg3)
      print (", arg4=")
      printInt (arg4)
      nl ()
      *****/
      switch syscallCodeNum
        case SYSCALL_FORK:
          return Handle_Sys_Fork ()
        case SYSCALL_YIELD:
          Handle_Sys_Yield ()
          return 0
        case SYSCALL_EXEC:
         return Handle_Sys_Exec (arg1 asPtrTo array of char,
                                  arg2 asPtrTo array of ptr to array of char )
        case SYSCALL_JOIN:
          return Handle_Sys_Join (arg1)
        case SYSCALL_EXIT:
          Handle_Sys_Exit (arg1)
          return 0
        case SYSCALL_OPEN:
          return Handle_Sys_Open (arg1 asPtrTo array of char, arg2, arg3)
        case SYSCALL_READ:
          return Handle_Sys_Read (arg1, arg2 asPtrTo char, arg3)
        case SYSCALL_WRITE:
          return Handle_Sys_Write (arg1, arg2 asPtrTo char, arg3)
        case SYSCALL_SEEK:
          return Handle_Sys_Seek (arg1, arg2)
        case SYSCALL_CLOSE:
          Handle_Sys_Close (arg1)
          return 0
        case SYSCALL_SHUTDOWN:
          Handle_Sys_Shutdown ()
          return 0
        default:
          print ("Syscall code = ")
          printInt (syscallCodeNum)
          nl ()
          FatalError ("Unknown syscall code from user thread")
      endSwitch
      return 0
    endFunction

-----------------------------  Handle_Sys_Exit  ---------------------------------

  function Handle_Sys_Exit (returnStatus: int)
      print ("Handle_Sys_Exit invoked! \n")
      print("returnStatus = ")
      printInt(returnStatus)
    endFunction

-----------------------------  Handle_Sys_Shutdown  ---------------------------------

  function Handle_Sys_Shutdown ()
      print ("Handle_Sys_Shutdown invoked! \n")
      FatalError("Syscall 'Shutdown' was invoked by a user thread")
    endFunction

-----------------------------  Handle_Sys_Yield  ---------------------------------

  function Handle_Sys_Yield ()
      print ("Handle_Sys_Yield invoked! \n")
    endFunction

-----------------------------  Handle_Sys_Fork  ---------------------------------

  function Handle_Sys_Fork () returns int
      print ("Handle_Sys_Fork invoked! \n")
      return 1000
    endFunction

-----------------------------  Handle_Sys_Join  ---------------------------------

  function Handle_Sys_Join (processID: int) returns int
      print ("Handle_Sys_Join invoked! \n")
      print("processId = ")
      printInt(processID)
      nl()
      return 2000
    endFunction

-----------------------------  Handle_Sys_Exec  ---------------------------------

 function Handle_Sys_Exec (filename: ptr to array of char,
                            args: ptr to array of ptr to array of char) returns int
    var
      open : ptr to OpenFile
      initPC : int
      initUserStackTop: int
      initSystemStackTop: ptr to int
      oldStatus: int
      i: int
      buffer: array [MAX_STRING_SIZE] of char
      newAddrSpace: AddrSpace = new AddrSpace

    -- get the file name from virtual address 
    i = currentThread.myProcess.addrSpace.GetStringFromVirtual(&buffer, filename asInteger, MAX_STRING_SIZE)
    if i < 0
      return -1
    endIf

    newAddrSpace.Init()

    -- open the executable file
    open = fileManager.Open(filename, buffer, O_MAYCREATE, 16)
    if open == null
      --FatalError("File doesnot exist, re-check the file name")
      return -1
    endIf

    -- create the logical address space 
    initPC = open.LoadExecutable(&newAddrSpace)

    -- replace old frame with new one
    frameManager.ReturnAllFrames(&currentThread.myProcess.addrSpace)

    -- be able to copy address space into ProcessControlBlock
    currentThread.myProcess.addrSpace = newAddrSpace 

    -- close executable file 
    fileManager.Close (open)

    -- compute the initial value for user level stack 
    -- set it to the logical address
    initUserStackTop = currentThread.myProcess.addrSpace.numberOfPages * PAGE_SIZE

    -- reset the system stack pointer, clear the system stack
    -- jump into user level program, execution will never return 
    initSystemStackTop = &currentThread.systemStack[SYSTEM_STACK_SIZE-1]

    -- disable interrupts
    oldStatus = SetInterruptsTo (DISABLED)
  
    currentThread.isUserThread = true 

    -- BecomeUserThread jumps to user level main routine and never return
    BecomeUserThread (initUserStackTop, initPC, initSystemStackTop asInteger)
    return 3000
  endFunction


-----------------------------  Handle_Sys_Open  ---------------------------------

  function Handle_Sys_Open (filename: ptr to array of char, flags, mode: int) returns int
      var 
        file: array [MAX_STRING_SIZE] of char
        err: int
      err = currentThread.myProcess.addrSpace.GetStringFromVirtual(&file, filename asInteger, MAX_STRING_SIZE)

      if err < 0
        return -1 
      endIf

      print("System Open was invoked by a User thread")
      nl()

      print("File name: ")
      print(&file)
      nl()

      print("Virtual address: ")
      printHex(filename asInteger)
      nl()

      return 5000
    endFunction

-----------------------------  Handle_Sys_Read  ---------------------------------

  function Handle_Sys_Read (fileDesc: int, buffer: ptr to char, sizeInBytes: int) returns int
      print ("System Read was invoked")
      nl()
      print ("fileDesc: ")
      printInt (fileDesc)
      nl()
      print ("Buffer virtual address: ")
      printHex (buffer asInteger)
      nl()
      print ("sizeInBytes: ")
      printInt (sizeInBytes)
      nl()
      return 6000
    endFunction

-----------------------------  Handle_Sys_Write  ---------------------------------

  function Handle_Sys_Write (fileDesc: int, buffer: ptr to char, sizeInBytes: int) returns int
      print ("System Write was invoked")
      nl()
      print ("File description: ")
      printInt (fileDesc)
      nl()
      print ("Buffer virtual address: ")
      printHex (buffer asInteger)
      nl()
      print ("sizeInBytes: ")
      printInt (sizeInBytes)
      nl()
      return 7000
    endFunction

-----------------------------  Handle_Sys_Seek  ---------------------------------

  function Handle_Sys_Seek (fileDesc: int, newCurrentPos: int) returns int
      print ("System Seek was invoked")
      nl()
      print ("File description: ")
      printInt (fileDesc)
      nl()
      print ("newCurrentPos: ")
      printInt (newCurrentPos)
      nl()
      return 8000
    endFunction

-----------------------------  Handle_Sys_Close  ---------------------------------

  function Handle_Sys_Close (fileDesc: int)
      print("System Close was invoked by a user thread")
      nl()
      print("File description:")
      printInt(fileDesc)
      nl()
    endFunction

-----------------------------  DiskDriver  ---------------------------------

  const
    DISK_STATUS_BUSY                               = 0x00000000
    DISK_STATUS_OPERATION_COMPLETED_OK             = 0x00000001
    DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_1   = 0x00000002
    DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_2   = 0x00000003
    DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_3   = 0x00000004
    DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_4   = 0x00000005
    DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_5   = 0x00000006

    DISK_READ_COMMAND  = 0x00000001
    DISK_WRITE_COMMAND = 0x00000002

  behavior DiskDriver
    --
    -- There is only one instance of this class.  It provides "read" and "write"
    -- methods to transfer data from and to the disk.
    --
    -- In this implementation, all I/O is synchronous.  These methods perform
    -- busy-waiting until the disk operation has completed.

      ----------  DiskDriver . Init  ----------

      method Init ()
          print ("Initializing Disk Driver...\n")
          DISK_STATUS_WORD_ADDRESS = 0x00FFFF08 asPtrTo int
          DISK_COMMAND_WORD_ADDRESS = 0x00FFFF08 asPtrTo int
          DISK_MEMORY_ADDRESS_REGISTER = 0x00FFFF0C asPtrTo int
          DISK_SECTOR_NUMBER_REGISTER = 0x00FFFF10 asPtrTo int
          DISK_SECTOR_COUNT_REGISTER = 0x00FFFF14 asPtrTo int
          semToSignalOnCompletion = null
          semUsedInSynchMethods = new Semaphore
          semUsedInSynchMethods.Init (0)
          diskBusy = new Mutex
          diskBusy.Init ()
        endMethod

      ----------  DiskDriver . SynchReadSector  ----------

      method SynchReadSector  (sectorAddr, numberOfSectors, memoryAddr: int)
        --
        -- This method reads "numberOfSectors" sectors (of PAGE_SIZE bytes each)
        -- from the disk and places the data in memory, starting at "memoryAddr".
        -- It waits until the I/O is complete before returning.
        --
        -- If there is a (simulated) disk hardware failure, then this routine
        -- simply tries again in an infinite loop, until it succeeds.
        --
          -- print ("SynchReadSector called\n")
          -- printIntVar ("  sectorAddr", sectorAddr)
          -- printIntVar ("  numberOfSectors", numberOfSectors)
          -- printHexVar ("  memoryAddr", memoryAddr)
          diskBusy.Lock ()
          while true

            self.StartReadSector  (sectorAddr, numberOfSectors, memoryAddr,
                                   & semUsedInSynchMethods)
            semUsedInSynchMethods.Down ()

            -- Check the return status
            switch * DISK_STATUS_WORD_ADDRESS
              case DISK_STATUS_OPERATION_COMPLETED_OK:
                diskBusy.Unlock ()
                return
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_1:
                FatalError ("Disk I/O error in SynchReadSector: Memory addr is not page-aligned or sector count is not positive")
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_2:
                FatalError ("Disk I/O error in SynchReadSector: Attempt to access invalid memory address")
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_3:
                FatalError ("Disk I/O error in SynchReadSector: Bad sectorAddr or sectorCount specifies non-existant sector")
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_4:
                -- This case occurs when there is a hard or soft (simulated)
                -- hardware error while performing the disk operation.
                break
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_5:
                FatalError ("Disk I/O error in SynchReadSector: Bad command word")
              default:
                FatalError ("SynchReadSector: Unexpected status code")
            endSwitch
            -- print ("\n\nIn SynchReadSector: A simulated disk I/O error occurred...\n\n")
          endWhile

        endMethod

      ----------  DiskDriver . StartReadSector  ----------

      method StartReadSector  (sectorAddr, numberOfSectors, memoryAddr: int,
                               whoCares: ptr to Semaphore)
        --
        -- This method reads "numberOfSectors" sectors (of PAGE_SIZE bytes each)
        -- from the disk and places the data in memory, starting at "memoryAddr".
        -- The "whoCares" argument is a Semaphore that we will signal after the
        -- I/O operation is complete; if null no thread will be notified.
        --
          -- print ("StartReadSector called\n")
          -- printIntVar ("  sectorAddr", sectorAddr)
          -- printIntVar ("  numberOfSectors", numberOfSectors)
          -- printHexVar ("  memoryAddr", memoryAddr)
          -- printHexVar ("  whoCares", whoCares asInteger)

          -- Save the semaphore
          semToSignalOnCompletion = whoCares

          -- Move the parameters to the disk and start the I/O
          * DISK_MEMORY_ADDRESS_REGISTER = memoryAddr
          * DISK_SECTOR_NUMBER_REGISTER = sectorAddr
          * DISK_SECTOR_COUNT_REGISTER = numberOfSectors
          * DISK_COMMAND_WORD_ADDRESS = DISK_READ_COMMAND    -- Starts the I/O
        endMethod

      ----------  DiskDriver . SynchWriteSector  ----------

      method SynchWriteSector  (sectorAddr, numberOfSectors, memoryAddr: int)
        --
        -- This method writes "numberOfSectors" sectors (of PAGE_SIZE bytes each)
        -- to the disk.  It waits until the I/O is complete before returning.
        --
        -- If there is a (simulated) disk hardware failure, then this routine
        -- simply tries again in an infinite loop, until it succeeds.
        --
          -- print ("SynchWriteSector called\n")
          -- printIntVar ("  sectorAddr", sectorAddr)
          -- printIntVar ("  numberOfSectors", numberOfSectors)
          -- printHexVar ("  memoryAddr", memoryAddr)
          diskBusy.Lock ()
          while true
            self.StartWriteSector  (sectorAddr, numberOfSectors, memoryAddr,
                                    & semUsedInSynchMethods)
            semUsedInSynchMethods.Down ()

            -- Check the return status
            switch * DISK_STATUS_WORD_ADDRESS
              case DISK_STATUS_OPERATION_COMPLETED_OK:
                diskBusy.Unlock ()
                return
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_1:
                FatalError ("Disk I/O error in SynchWriteSector: Memory addr is not page-aligned or sector count is not positive")
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_2:
                FatalError ("Disk I/O error in SynchWriteSector: Attempt to access invalid memory address")
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_3:
                FatalError ("Disk I/O error in SynchWriteSector: Bad sectorAddr or sectorCount specifies non-existant sector")
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_4:
                -- This case occurs when there is a hard or soft (simulated)
                -- hardware error while performing the disk operation.
                break
              case DISK_STATUS_OPERATION_COMPLETED_WITH_ERROR_5:
                FatalError ("Disk I/O error in SynchWriteSector: Bad command word")
              default:
                FatalError ("SynchWriteSector: Unexpected status code")
            endSwitch
            -- print ("\n\nIn SynchWriteSector: A simulated disk I/O error occurred...\n\n")
          endWhile

        endMethod

      ----------  DiskDriver . StartWriteSector  ----------

      method StartWriteSector  (sectorAddr, numberOfSectors, memoryAddr: int,
                                whoCares: ptr to Semaphore)
        --
        -- This method writes "numberOfSectors" sectors (of PAGE_SIZE bytes each)
        -- to the disk.  It returns immediately after starting the I/O.
        --
        -- The "whoCares" argument is a Semaphore that we will signal after the
        -- I/O operation is complete; if null no thread will be notified.
        --
          -- print ("SynchWriteSector called\n")
          -- printIntVar ("  sectorAddr", sectorAddr)
          -- printIntVar ("  numberOfSectors", numberOfSectors)
          -- printHexVar ("  memoryAddr", memoryAddr)

          -- Save the semaphore
          semToSignalOnCompletion = whoCares

          * DISK_MEMORY_ADDRESS_REGISTER = memoryAddr
          * DISK_SECTOR_NUMBER_REGISTER = sectorAddr
          * DISK_SECTOR_COUNT_REGISTER = numberOfSectors
          * DISK_COMMAND_WORD_ADDRESS = DISK_WRITE_COMMAND    -- Starts the I/O
        endMethod

    endBehavior

-----------------------------  FileManager  ---------------------------------

  behavior FileManager

      ----------  FileManager . Init  ----------

      method Init ()
        --
        -- This method is called once at kernel startup time to initialize
        -- the one and only "FileManager" object.  It is passed a pointer
        -- to a frame of memory. 
        --
        var i: int

          print ("Initializing File Manager...\n")
          fileManagerLock = new Mutex
          fileManagerLock.Init ()

          -- Initialize the FileControlBlock stuff
          fcbFreeList = new List [FileControlBlock]
          anFCBBecameFree = new Condition
          anFCBBecameFree.Init ()
          fcbTable = new array of FileControlBlock
                { MAX_NUMBER_OF_FILE_CONTROL_BLOCKS of new FileControlBlock }
          for i = 0 to MAX_NUMBER_OF_FILE_CONTROL_BLOCKS-1
            fcbTable[i].Init()
      fcbTable[i].inode.Init()
            fcbFreeList.AddToEnd (&fcbTable[i])
          endFor

          -- Initialize the OpenFile stuff
          openFileFreeList = new List [OpenFile]
          anOpenFileBecameFree = new Condition
          anOpenFileBecameFree.Init ()
          openFileTable = new array of OpenFile
                { MAX_NUMBER_OF_OPEN_FILES of new OpenFile }
          for i = 0 to MAX_NUMBER_OF_OPEN_FILES-1
            openFileFreeList.AddToEnd (&openFileTable[i])
          endFor

          -- Create the special "stdin/stdout" open file
          serialTerminalFile = new OpenFile
          serialTerminalFile.kind = TERMINAL

         endMethod

      ----------  FileManager . Print  ----------

      method Print ()
        var i: int
          fileManagerLock.Lock ()           -- Need lock since we touch freeLists
          print ("Here is the FileControlBlock table...\n")
          for i = 0 to MAX_NUMBER_OF_FILE_CONTROL_BLOCKS-1
            print ("  ")
            printInt (i)
            print (":  ")
            fcbTable[i].Print()
          endFor
          print ("Here is the FREE list of FileControlBlocks:\n   ")
          fcbFreeList.ApplyToEach (printFCB)
          nl ()
          print ("Here is the OpenFile table...\n")
          for i = 0 to MAX_NUMBER_OF_OPEN_FILES-1
            print ("  ")
            printInt (i)
            print (":  0x")
            printHex ((& openFileTable[i]) asInteger)
            print (":  ")
            openFileTable[i].Print()
          endFor
          print ("Here is the FREE list of OpenFiles:\n")
          openFileFreeList.ApplyToEach (printOpen)
          fileManagerLock.Unlock ()
        endMethod

      ----------  FileManager . Open  ----------

      method Open (filename: String, dir: ptr to OpenFile, flags, mode: int)
             returns ptr to OpenFile
      --
      -- This method is called to open a file.  It returns pointer to
      -- a newly allocated OpenFile.  It will set its "numberOfUsers"
      -- count to 1.
      --
      -- The file must already exist on the disk.  If it cannot be found,
      -- this method returns null.
      --
      -- This method is reentrant, and may block the caller.
      --
          var open: ptr to OpenFile
              fcb: ptr to FileControlBlock
        iNum: int
        isRoot: bool

    isRoot = StrCmp(filename, "/") == 0 

    -- Quick check for sanity
    if fileSystem.rootDirectory == null && !isRoot
      return null
    endIf

    -- Get the inode number
    iNum = fileSystem.NameToInodeNum (filename, dir)
    if iNum < 0
       -- Should we create a file here?  (Unimplemented)
       return null
    endIf

    -- Is there an existing file when we must create?  (Unimplemented)

          -- First, get an FCB that points to the file.
          -- This will increment fcb.numberOfUsers.
          fcb = fileManager.GetFCB (iNum)
          if fcb == null 
            return null
          endIf

    -- Process Open flags (Unimplemented)

          -- Next, allocate an OpenFile, waiting if necessary.
    -- Might want to change this! (return an error if no openfile)
          open = self.GetAnOpenFile(true) 

          -- Connect it to this FCB and set its "numberOfUsers" count.
          fileManagerLock.Lock()
    if (fcb.inode.mode & TYPE_FILE) == TYPE_FILE
             open.Init (FILE, fcb, flags & 3)
    else
       open.Init (DIRECTORY, fcb, flags & 3)
    endIf

          -- Release FileManagerLock and return a pointer to the OpenFile object
          fileManagerLock.Unlock()

          -- printHexVar ("open.fcb", open.fcb asInteger)

          return open
        endMethod

      ----------  FileMangger . GetAnOpenFile --------
      method GetAnOpenFile (block: bool) returns ptr to OpenFile
        var open: ptr to OpenFile
          fileManagerLock.Lock()
          if openFileFreeList.IsEmpty() && !block
       fileManagerLock.Unlock()
       return null
    endIf
          while openFileFreeList.IsEmpty ()
            anOpenFileBecameFree.Wait (& fileManagerLock)
          endWhile
          open = openFileFreeList.Remove ()
    fileManagerLock.Unlock ()
    return open

        endMethod

      ----------  FileMangger . LookupFCB --------
      method LookupFCB (inodeNum: int) returns
              ptr to FileControlBlock

        var i: int
         for i = 0 to MAX_NUMBER_OF_FILE_CONTROL_BLOCKS-1
            if fcbTable[i].inode.number == inodeNum
              return &fcbTable[i]
            endIf
          endFor
    return null
        endMethod

      ----------  FileManager . GetFCB  ----------

      method GetFCB (inodeNum: int ) returns ptr to FileControlBlock
      --
      -- This method is called when opening a file.  It will search
      -- the fcbTable for an entry matching the file, that is the inode number.
      -- If none is found, a new FCB is returned
      --
      -- The file must already exist on the disk.  If it cannot be found,
      -- this method returns null. 
      --
      -- The numberOfUsers field in the FCB is set to one.
      --
      -- This method is reentrant, and may block the caller.
      --
          var
              fcb: ptr to FileControlBlock

          --printIntVar ("GetFCB: inodeNum", inodeNum)

          fileManagerLock.Lock()

          -- See if there is an FCB for this file; if so return it.
    fcb = self.LookupFCB (inodeNum)
    if fcb != null
             fcb.numberOfUsers = fcb.numberOfUsers + 1
             fileManagerLock.Unlock()
             return fcb
          endIf

          -- Get an unused FCB, waiting until one becomes available
          while fcbFreeList.IsEmpty ()
            anFCBBecameFree.Wait (& fileManagerLock)
          endWhile
          fcb = fcbFreeList.Remove ()

          fcb.numberOfUsers = 1

          -- Safe to unlock now, inode read will provide its own synch 
          fileManagerLock.Unlock()

          -- Check for correctness of new fcb returned 
          if fcb.relativeSectorInBuffer >= 0 || fcb.bufferIsDirty
            FatalError (
         "In FileManager.Open: a free FCB appears not to have been closed properly")
          endIf

          -- Read the inode ...
    fcb.inode.GetInode (inodeNum)

    -- Now return the fcb
          return fcb
        endMethod

      ----------  FileManager . Close  ----------
      --
      -- This method is called to close an OpenFile.  If there is a pending
      -- write (i.e., the buffer is dirty) then it is written out first.
      --
      -- The "numberOfUsers" for the OpenFile is decremented and, if zero,
      -- the OpenFile is freed.  If the OpenFile is freed, then the
      -- "numberOfUsers" for the FCB is decremented.  If it too is zero, the
      -- FCB is freed.
      --
      method Close (open: ptr to OpenFile)
          var fcb: ptr to FileControlBlock
          if open == & serialTerminalFile
            return
          endIf
          fileManagerLock.Lock()
          open.fcb.Flush()
          open.numberOfUsers = open.numberOfUsers - 1
          if open.numberOfUsers <= 0
            fcb = open.fcb
            openFileFreeList.AddToEnd (open)
            anOpenFileBecameFree.Signal (& fileManagerLock)
            fcb.Release(&fileManagerLock)
          endIf
          fileManagerLock.Unlock()
        endMethod

       ----------  FileManager . SynchRead  ----------

      method SynchRead (open: ptr to OpenFile, 
                        targetAddr, bytePos, numBytes: int) returns bool
          --
          -- This method reads "numBytes" from this file and stores
          -- them at the address pointed to by "targetAddr".  If everything
          -- was read okay, it returns TRUE; if problems it returns FALSE.
          --
          -- It reads a page at a time into an internal buffer
          -- by calling "diskDriver.SynchReadSector".
          --
          var sector, offset, posInBuffer, bytesToMove: int
     -- dataSector: int
              fcb: ptr to FileControlBlock
          --printHexVar ("SynchRead called  targetAddr", targetAddr)
          --printIntVar ("                  bytePos", bytePos)
          --printIntVar ("                  numBytes", numBytes)
          fileManagerLock.Lock()
          if ! open || ! open.fcb || open.fcb.inode.number < 0
            FatalError ("FileManager.SynchRead: file not properly opened")
          endIf
          fcb = open.fcb
          while numBytes > 0
            -- At this point targetAddr and numBytes tell what work is left to do.
            -- printHexVar ("NEXT MOVE:\n  targetAddr", targetAddr)
            -- printIntVar ("  numBytes", numBytes)
            -- printHexVar ("          ", numBytes)
            -- printIntVar ("  relativeSectorInBuffer", fcb.relativeSectorInBuffer)
            -- printIntVar ("  bytePos", bytePos)
            -- printHexVar ("         ", bytePos)
            sector = bytePos / PAGE_SIZE
            offset = bytePos % PAGE_SIZE
            -- printIntVar ("  sector", sector)
            -- printIntVar ("  offset", offset)
            -- printHexVar ("        ", offset)
            if fcb.relativeSectorInBuffer != sector
          if !open.fcb.ReadSector(sector,false) 
       return false
    endIf
            endIf
            posInBuffer = fcb.bufferPtr + offset
            bytesToMove = Min (numBytes, PAGE_SIZE - offset)
            -- printHexVar ("  MOVING - targetAddr", targetAddr)
            -- printHexVar ("         - source addr (posInBuffer)", posInBuffer)
            -- printIntVar ("         - bytesToMove", bytesToMove)
            MemoryCopy (targetAddr, posInBuffer, bytesToMove)
            targetAddr = targetAddr + bytesToMove
            bytePos = bytePos + bytesToMove
            numBytes = numBytes - bytesToMove
            -- printHexVar ("  NEW targetAddr", targetAddr)
            -- printIntVar ("  NEW bytePos", bytePos)
            -- printHexVar ("             ", bytePos)
            -- printIntVar ("  NEW numBytes", numBytes)
            -- printHexVar ("              ", numBytes)
          endWhile
          fileManagerLock.Unlock()
          return true
        endMethod

      ----------  FileManager . SynchWrite  ----------

      method SynchWrite (open: ptr to OpenFile, 
                         sourceAddr, bytePos, numBytes: int) returns bool
          --
          -- This method reads "numBytes" from the memory address "sourceAddr"
          -- and writes them to the file at "bytePos".  If everything
          -- was written okay, it returns TRUE; if problems it returns FALSE.
          --
          -- It operates on an internal buffer by calling
          -- "diskDriver.SynchReadSector" and "diskDriver.SynchWriteSector".
          --
          var sector, offset, posInBuffer, bytesToMove: int
              fcb: ptr to FileControlBlock

          -- print ("--------------------\n")
          -- printHexVar ("SynchWrite called  sourceAddr", sourceAddr)
          -- printIntVar ("                   bytePos", bytePos)
          -- printIntVar ("                   numBytes", numBytes)
    -- open.fcb.inode.Print()
          fileManagerLock.Lock()
          if ! open || ! open.fcb || open.fcb.inode.number < 0
              FatalError ("FileManager.SynchWrite: file not properly opened")
          endIf
          fcb = open.fcb
          while numBytes > 0
            -- At this point sourceAddr and numBytes tell what work is left to do.
            -- printHexVar ("NEXT MOVE:\n  sourceAddr", sourceAddr)
            -- printIntVar ("  numBytes", numBytes)
            -- printHexVar ("          ", numBytes)
            -- printIntVar ("  relativeSectorInBuffer", fcb.relativeSectorInBuffer)
            -- printIntVar ("  bytePos", bytePos)
            -- printHexVar ("         ", bytePos)
            sector = bytePos / PAGE_SIZE
            offset = bytePos % PAGE_SIZE
            -- printIntVar ("  sector", sector)
            -- printIntVar ("  offset", offset)
            bytesToMove = Min (numBytes, PAGE_SIZE - offset)
            if offset == 0 && bytesToMove == PAGE_SIZE 
         && bytePos < open.fcb.inode.fsize
              -- No need to read the sector first
              open.fcb.Flush()
            elseIf fcb.relativeSectorInBuffer != sector
        -- Read the sector before we do a partial write
        if !fcb.ReadSector (sector, true)
           fileManagerLock.Unlock()
           return false
        endIf
            endIf
            posInBuffer = fcb.bufferPtr + offset
            fcb.relativeSectorInBuffer = sector
            fcb.bufferIsDirty = true
            -- printHexVar ("  MOVING - sourceAddr", sourceAddr)
            -- printHexVar ("         - target (posInBuffer)", posInBuffer)
            -- printIntVar ("         - bytesToMove", bytesToMove)
            MemoryCopy (posInBuffer, sourceAddr, bytesToMove)
            sourceAddr = sourceAddr + bytesToMove
            bytePos = bytePos + bytesToMove
            numBytes = numBytes - bytesToMove
            -- printHexVar ("  NEW sourceAddr", sourceAddr)
            -- printIntVar ("  NEW bytePos", bytePos)
            -- printHexVar ("             ", bytePos)
            -- printIntVar ("  NEW numBytes", numBytes)
            -- printHexVar ("              ", numBytes)
          endWhile
          fileManagerLock.Unlock()
          -- print ("--------------------\n")
          return true
        endMethod

    endBehavior

  function copyUnalignedWord (destPtr, fromPtr: ptr to int)
      var from, dest: ptr to char
      from = fromPtr asPtrTo char
      dest = destPtr asPtrTo char
      *dest = *from
      *(dest+1) = *(from+1)
      *(dest+2) = *(from+2)
      *(dest+3) = *(from+3)
    endFunction

  function printFCB (fcb: ptr to FileControlBlock)
      printInt (fcb.inode.number)
      printChar (' ')
    endFunction

  function printOpen (open: ptr to OpenFile)
      print ("  0x")
      printHex (open asInteger)
      print (":  ")
      open.Print ()
    endFunction

-----------------------------  ToyFs         --------------------------------

  behavior ToyFs

      --------------- ToyFs . Init  ----------------

      method Init()
        var
            p: ptr to int

    -- Get a frame for inode manipulations and initialize the lock
    inodeBuffer = frameManager.GetAFrame ()
    inodeBuffSec = -1
    fsLock = new Mutex
    fsLock.Init ()

          -- Read in sector 0 from the disk.  This is the super bloc,
    superBlock = frameManager.GetAFrame ()
          diskDriver.SynchReadSector (0,    -- sector to read
                                      1,    -- number of sectors to read
                                      superBlock)
    p = superBlock asPtrTo int

          if *p != 0x54794673 -- "TyFs", the ToyFs magic number
            FatalError ("Magic number in sector 0 of ToyFs file system is bad")
          endIf

    -- Get file system parameters
    p = p+4
    fssize = *p
    p = p+4
          numInodes = *p

    --print ("super: fssize: ")  printInt (fssize)
          --print (" inodes: ") printInt (numInodes)
          --print ("\n")

    -- Skip over unused integer
    p = p+8
    i_bitmap = new BitMap
    i_bitmap.InitFromPtr(numInodes, p asPtrTo array of int)
    --print ("inode ") i_bitmap.Print()

    -- Move over i_bitmap
          p = p + *p*4 + 4
    d_bitmap = new BitMap
    d_bitmap.InitFromPtr(*p*32-1, p asPtrTo array of int)
    --print ("data ") d_bitmap.Print()

    -- offset for data sectors
    fileSystem.dataSecOffset =  numInodes / INODES_PER_SEC
    --printIntVar ("dataSecOffset: ", fileSystem.dataSecOffset)

    -- Create the Root Directory
    rootDirectory = null
    rootDirectory = fileManager.Open("/",null,O_READ,0)
    rootDirectory.kind = DIRECTORY

       endMethod

      --------------- ToyFs . SaveSuper  ----------------
    method SaveSuper ()
          diskDriver.SynchWriteSector (0,    -- sector to Write
                                       1,    -- number of sectors to read
                                       superBlock)
      endMethod


      --------------- ToyFs . OpenLastDir  ----------------

    method OpenLastDir (filename: String, startDir: ptr to OpenFile,
                  lastElIndex: ptr to int) returns ptr to OpenFile
        var
      elName: array [ MAX_STRING_SIZE ] of char
      ix : int
      sIx: int
      eIx: int
      sizeP: ptr to int
      entPtr: ptr to dirEntry
      elDir: ptr to OpenFile
      iNode: InodeData
      fcb: ptr to FileControlBlock

      elName = new array [ MAX_STRING_SIZE ] of char 
               { MAX_STRING_SIZE of '\0' }
      sizeP = (&elName) asPtrTo int
      iNode = new InodeData
      *lastElIndex = -1

      ix = StrChr (filename, '/', 0)
      if ix < 0
         *lastElIndex = 0
         return startDir.NewReference()
      endIf

      if ix == 0
         elDir = fileSystem.rootDirectory.NewReference()
         sIx = 1
         eIx = StrChr(filename, '/', 1)
      else
         elDir = startDir.NewReference()
         eIx = ix
         sIx = 0
      endIf

      -- Loop through
      while eIx > 0
        -- Copy File name
        if eIx - sIx > MAX_STRING_SIZE
           fileManager.Close(elDir)
     return null
        endIf
        for ix = 0 to eIx-sIx-1
           elName[ix] = filename[sIx+ix]
        endFor
        *sizeP = eIx-sIx

        -- Get the entry
        -- print("OpenLastDir: elName: ") print(&elName) nl()
        entPtr = elDir.Lookup(&elName)
        if entPtr == null
            fileManager.Close(elDir)
      return null
        endIf
        iNode.GetInode(entPtr.inodeNum)
        if (iNode.mode & TYPE_DIR) != TYPE_DIR
            fileManager.Close(elDir)
      return null
        endIf

        -- Get FCB / OpenFile ...
        fcb = fileManager.GetFCB(entPtr.inodeNum)
        fileManager.Close(elDir)
        if fcb == null
     return null
        endIf

        -- Get an OpenFile
        elDir = fileManager.GetAnOpenFile(false)
        if elDir == null
     return null
        endIf
        elDir.Init(DIRECTORY,fcb,O_READ)

        -- Update for next element
        sIx = eIx+1
        eIx = StrChr (filename, '/', sIx)
      endWhile
      
      *lastElIndex = sIx
      return elDir

      endMethod


      --------------- ToyFs . NameToInodeNum  ----------------

    method NameToInodeNum (filename: String, dir : ptr to OpenFile) returns int
        var 
      dirEnt: ptr to dirEntry
      curDir: ptr to OpenFile  -- for walking the tree
      retVal: int
      lastElStart: int
      lastElName: array [ MAX_STRING_SIZE ] of char
      ix: int

  --print ("NameToInodeNum: looking for ") print (filename) print (" (len is ")
        --printInt (filename arraySize) print (")\n")

  -- Quick check for root dir
        if StrCmp (filename, "/") == 0
     return 1
        endIf

  -- initialize the search
  if dir.kind != DIRECTORY 
     FatalError ("NameToInodeNum on non-Directory file.")
  endIf

  -- Start at
  curDir = self.OpenLastDir (filename, dir, &lastElStart)
  if (curDir == null)
      return -1
        endIf

  if (filename arraySize - lastElStart > MAX_STRING_SIZE) 
      fileManager.Close(curDir)
      return -1
  endIf   

  -- Do the lookup(s) ....
  *((&lastElName) asPtrTo int) = filename arraySize - lastElStart
  for ix = 0 to filename arraySize - lastElStart -1
     lastElName[ix] = filename[lastElStart+ix]
  endFor
  --print ("NameToInodeNum: last element is: ") print (&lastElName) nl()
  dirEnt = curDir.Lookup(&lastElName)
  fileManager.Close(curDir)

  if dirEnt == null
     return -1
  endIf

  retVal = dirEnt.inodeNum
  return retVal
      endMethod

      --------------- ToyFs . AllocInode  ----------------
    method AllocInode () returns int
      var retVal: int
          idata: InodeData
        fsLock.Lock()
        retVal = i_bitmap.FindZeroAndSet()
  if retVal >= 0 
    self.SaveSuper()
    fsLock.Unlock()
    idata = new InodeData
    idata.number = retVal
    idata.nlinks = 0
    idata.mode = 0
    idata.fsize = 0
    idata.balloc = 0
    idata.direct = new array [10] of int { 10 of 0 }
    idata.indir1 = 0
    idata.indir2 = 0
    idata.dirty = true
    idata.indSec = -1
    idata.WriteInode()
  else
    fsLock.Unlock()
  endIf
  return retVal
      endMethod

      --------------- ToyFs . FreeInode  ----------------
    method FreeInode (iNum: int)
        fsLock.Lock()
        i_bitmap.ClearBit(iNum)
  self.SaveSuper()
  fsLock.Unlock()
      endMethod

        --------------- ToyFs . AllocDataBlock  ----------------
    method AllocDataBlock () returns int
      var retVal: int
        fsLock.Lock()
        retVal = d_bitmap.FindZeroAndSet()
  self.SaveSuper()
  fsLock.Unlock()
  return retVal
      endMethod

      --------------- ToyFs . FreeDataBlock  ----------------
    method FreeDataBlock (dbNum: int)
        fsLock.Lock()
         d_bitmap.ClearBit(dbNum)
  self.SaveSuper()
  fsLock.Unlock()
      endMethod

      --------------- ToyFs . ReadFile  ----------------
    method ReadFile (file: ptr to OpenFile, userBuffer: ptr to char,
                     sizeInBytes: int)  returns int
        FatalError ("ToyFs . ReadFile Not Implemented.")
        return -1
    endMethod

      --------------- ToyFs . WriteFile  ----------------

    method  WriteFile (file: ptr to OpenFile, userBuffer: ptr to char,
                       sizeInBytes: int)  returns int
        FatalError ("ToyFs . WriteFile Not Implemented.")
        return -1
      endMethod

      --------------- ToyFs . CreateFile  ----------------
    method CreateFile (dir : ptr to OpenFile, filename: String, flags: int, mode: int)
           returns ptr to OpenFile
        FatalError ("ToyFs . CreateFile Not Implemented.")
        return null
      endMethod

      --------------- ToyFs . MakeDir  ----------------

    method MakeDir (dirname: String) returns int
         FatalError ("ToyFs . MakeDir Not Implemented.")
         return -1
      endMethod

      --------------- ToyFs . RemoveDir  ----------------

    method RemoveDir (dirname: String) returns int
        FatalError ("ToyFs . MakeDir Not Implemented.")
         return -1
      endMethod

      --------------- ToyFs . Link  ----------------

    method Link (oldname, newname: String) returns int
         FatalError ("ToyFs . MakeDir Not Implemented.")
         return -1
     endMethod


      --------------- ToyFs .Unlink   ----------------

    method Unlink (filename: String) returns int
        FatalError ("ToyFs . MakeDir Not Implemented.")
         return -1
      endMethod

  endBehavior


-----------------------------  InodeData         --------------------------------

  behavior InodeData

      ---------- InodeData . Init  -----------
      -- This method is called for each file opened,  each FCB has one
      -- This reads the inode data for the file at init time
      -- theLock should be a pointer to the FileManager.fileManagerLock
      -- bufptr should be a pointer to a frame allocated by the FileMangager
      --        for inode reads/writes  (should be improved!)
      -- num is the inode number
      --
      method Init ()
          -- Nothing is valid, set invalid inode number
          number = -1
        endMethod

      --------------- InodeDate . GetInode ----------------
      --
      -- Gets an inode from the disk
      -- 

      method GetInode ( num : int )
          var inodeSec : int
        p : ptr to diskInode
              ix : int

    -- Calculate where to get the inode
    inodeSec = (num-1) / INODES_PER_SEC
    fileSystem.fsLock.Lock()

    -- Read the proper one
    if (fileSystem.inodeBuffSec != inodeSec)
       -- Read the proper sector 
            diskDriver.SynchReadSector ( inodeSec + 1,  1,
                       fileSystem.inodeBuffer)
            fileSystem.inodeBuffSec = inodeSec
          endIf

    -- Point to the diskInode
    p = (fileSystem.inodeBuffer 
               + (((num - 1) % INODES_PER_SEC) * INODE_SIZE)) asPtrTo diskInode

          --print ("added = ") printInt (((num - 1) % INODES_PER_SEC) * INODE_SIZE) nl()
          --printIntVar ("num", num)
          --print ("p is 0x") printHex ( p asInteger ) nl()

    -- Set the fields of this in memory Inode
          number = num
    nlinks = p.nlinksAndMode >> 16
    mode   = p.nlinksAndMode & 0xff
    fsize  = p.fsize
    balloc = p.balloc
    direct = new array [10] of int { 10 of 0 }
    for ix = 0 to 9 
       direct[ix] = p.direct[ix]
    endFor
    indir1 = p.indir1
    indir2 = p.indir2

    dirty = false
    indSec = -1      -- -1 means not in use

    fileSystem.fsLock.Unlock()

    --print ("GetInode: ")
    --self.Print()
        endMethod

      method WriteInode()
          var inodeSec : int
        p : ptr to diskInode
              ix : int

    if ! dirty
       return
    endIf

    -- Calculate the location of the inode
    inodeSec = (number-1) / INODES_PER_SEC
    fileSystem.fsLock.Lock()

    -- Read the proper one
    if (fileSystem.inodeBuffSec != inodeSec)
       -- Read the proper sector 
            diskDriver.SynchReadSector ( inodeSec + 1,  1,
                       fileSystem.inodeBuffer)
            fileSystem.inodeBuffSec = inodeSec
          endIf

    -- Point to the diskInode
    p = (fileSystem.inodeBuffer 
               + (((number - 1) % INODES_PER_SEC) * INODE_SIZE)) asPtrTo diskInode
          *((&p.direct) asPtrTo int) = 10
          p.nlinksAndMode = nlinks << 16 | mode
    p.fsize = fsize
    p.balloc = balloc
    for ix = 0 to 9
       p.direct[ix] = direct[ix]
    endFor
    p.indir1 = indir1
    p.indir2 = indir2

    diskDriver.SynchWriteSector ( inodeSec + 1,  1,
                       fileSystem.inodeBuffer)

    dirty = false
    fileSystem.fsLock.Unlock()

        endMethod

      method Print()
          var ix : int 
          print ("IN: ")
    printInt (number) print (" ")
    if ((mode & TYPE_DIR) == TYPE_DIR)
      print ("d")
    else
      print ("-")
    endIf
    if ((mode & MODE_READ) == MODE_READ)
      print ("r")
    else
      print ("-")
    endIf
    if ((mode & MODE_WRITE) == MODE_WRITE)
      print ("w")
    else
      print ("-")
    endIf
    if ((mode & MODE_EXE) == MODE_EXE)
      print ("x ")
    else
      print ("- ")
    endIf
    printInt (nlinks) print (" ")
          printInt (fsize) print (" (")
          printInt (balloc) print (") [")
          for ix = 0 to 9 
             printInt (direct[ix]) 
       if ix < 9 
         print (",")
       else
         print ("] ")
             endIf
    endFor
    printInt (indir1)
    if (dirty)
             print (" dirty")
    endIf
          nl()
    if (indSec != -1 )
      for ix = 0 to 2047
              if *((indSec + 4*ix) asPtrTo int) != 0 
           printInt(ix) print("[")
                 printInt (*((indSec + 4*ix) asPtrTo int))  print ("] ")
              endIf
            endFor
            nl()
          endIf
        endMethod

      ----------- InodeData . GetDataSectorNumber () -------------

      -- This is expected to be called with fileManagerLock locked!

      method GetDataSectorNumber ( logicalSector: int ) returns int
        var dbPtr: ptr to int
    --printIntVar ("GetDataSectorNumber:logicalSector", logicalSector)
          if logicalSector < 10 
        return direct[logicalSector]
          else
              if logicalSector < 2058
           if indir1 == 0
        return 0
     endIf 
           if indSec <= 0
        -- Need to load the dbSec
        self.GetIndirect()
     endIf
     dbPtr = (indSec + (logicalSector-10)*4) asPtrTo int
     return *dbPtr
        else
           -- Not implemented
     FatalError ("Double Indirect not implemented.")
        endIf
          endIf
        return 0
        endMethod

      ----------- InodeData . AllocateNewSector () -------------

      method AllocateNewSector (logicalSector: int) returns bool
          -- Implementation not supplied ....
          return false
      endMethod

      ----------- InodeData . GetIndirect () -------------

      method GetIndirect ()
  
  -- read the indirect block
  if indir1 == 0
     FatalError ("GetIndirect: no indirect block to get.")
  endIf
  indSec = frameManager.GetAFrame() 
  diskDriver.SynchReadSector (indir1 + fileSystem.dataSecOffset, 1, indSec)

  endMethod
  
     ----------- InodeData . SaveIndirect () -------------

      method SaveIndirect ()
  
     -- read the indirect block
     if indir1 == 0 || indSec < 0
        FatalError ("SaveIndirect with no indirect!")
     endIf
     diskDriver.SynchWriteSector (indir1 + fileSystem.dataSecOffset, 1, indSec)

  endMethod

      ----------- InodeData . FreeIndirect () -------------

      method FreeIndirect ()

          -- Did we read one?
    if indSec <= 0
      return
    endIf
  
    -- Free the frame
    frameManager.PutAFrame(indSec)
          indSec = -1
        endMethod

      ----------- InodeData . SetMode () -------------

      method SetMode ( newMode: int )
         -- implementation not given
         endMethod

    endBehavior

-----------------------------  FileControlBlock  ---------------------------------

  behavior FileControlBlock

      ----------  FileControlBlock . Init  ----------
      --
      -- This method is called once at startup time.  It preallocates a buffer
      -- in memory which may be needed when I/O is done on the file.
      --
      method Init ()
          numberOfUsers = 0
          bufferPtr = frameManager.GetAFrame ()
          relativeSectorInBuffer = -1
          bufferIsDirty = false
    inode = new InodeData
         endMethod

      ----------  FileControlBlock . Print  ----------

      method Print ()
          print ("inode.number=")
          printInt (inode.number)
          print (",  numberOfUsers=")
          printInt (numberOfUsers)
          print (",  bufferPtr=")
          printHex (bufferPtr)
          print (",  relativeSectorInBuffer=")
          printInt (relativeSectorInBuffer)
          nl ()
    print ("Inode: ")
    inode.Print()
        endMethod

      ----------  FileControlBlock . ReadSector  ----------

      method ReadSector (newSector: int, allocateNew: bool ) returns bool
  var dataSector: int       
    if (newSector == relativeSectorInBuffer)
       return true
    endIf
          if bufferIsDirty
       self.Flush()
    endIf
    -- get the new one
    relativeSectorInBuffer = newSector
    dataSector = inode.GetDataSectorNumber(relativeSectorInBuffer)
    if dataSector == 0
       MemoryZero (bufferPtr, PAGE_SIZE)
       if allocateNew
           return  inode.AllocateNewSector(newSector)
             else
                 return  true
             endIf
    else 
             diskDriver.SynchReadSector (
                        dataSector + fileSystem.dataSecOffset, 1, bufferPtr)
    endIf
    return true
        endMethod

     ----------  FileControlBlock . Flush  ----------

      method Flush ()
        --
        -- This method writes out the buffer, if it is dirty.  This method
        -- assumes the caller already holds the fileManagerLock.
        -- 
  var dataSector: int

          if bufferIsDirty
            if relativeSectorInBuffer < 0
              FatalError ("FileManager.Flush: buffer is dirty but relativeSectorInBuffer =  -1")
            endIf
            bufferIsDirty = false
      dataSector = inode.GetDataSectorNumber(relativeSectorInBuffer)
      if dataSector == 0
         FatalError ("FCB.Flush ... no disk segment to flush to...")
      endIf
            diskDriver.SynchWriteSector (
                       dataSector + fileSystem.dataSecOffset, 1, bufferPtr)
          endIf
        endMethod

    ----------  FileControlBlock . Release  ----------

      -- Must be called with fileManagerLock locked.

      method Release (lock: ptr to Mutex)
         numberOfUsers = numberOfUsers - 1
         if numberOfUsers <= 0
      -- Final close, mark unused and release any indirect frame
      relativeSectorInBuffer = -1
      inode.FreeIndirect ()
      inode.number = -1
            fileManager.fcbFreeList.AddToEnd (self)
            fileManager.anFCBBecameFree.Signal ( lock )
         endIf
        endMethod

    endBehavior


-----------------------------  OpenFile  ---------------------------------

  behavior OpenFile

      ----------  OpenFile . Init  ----------

     method Init (fKind: int, fFcb: ptr to FileControlBlock, openFlags: int)
        kind = fKind
    fcb  = fFcb
          currentPos = 0
    numberOfUsers = 1
    addPos = -1
    flags = openFlags
       endMethod


      ----------  OpenFile . Print  ----------

      method Print ()
          print ("    OPEN FILE:   currentPos=")
          printInt (currentPos)
    print (" numOfUsers=") printInt(numberOfUsers)
          print (", fcb=")
          if fcb
            fcb.Print ()
          else
            print ("null\n")
          endIf
        endMethod

      ----------  OpenFile . NewReference  ----------

      method NewReference () returns ptr to OpenFile
           numberOfUsers = numberOfUsers + 1
     return self
        endMethod

      ----------  OpenFile . ReadBytes  ----------

      method ReadBytes (targetAddr, numBytes: int) returns bool
          --
          -- This method reads "numBytes" from this file and stores
          -- them at the address pointed to by "targetAddr".  If everything
          -- was read okay, it returns TRUE; if problems it returns FALSE.
          --
          -- This method may block the caller.  This method is reentrant.
          --
          var pos: int
          -- printIntVar ("OpenFile.ReadBytes    currentPos", currentPos)
          fileManager.fileManagerLock.Lock ()
          pos = currentPos
          currentPos = currentPos + numBytes
          fileManager.fileManagerLock.Unlock ()
          return fileManager.SynchRead (self, targetAddr, pos, numBytes)
        endMethod

      ----------  OpenFile . ReadInt  ----------

      method ReadInt () returns int
          --
          -- Read the next 4 bytes from a file and return it as an integer.
          --
          var i: int
          if ! self.ReadBytes ((&i) asInteger, 4)
            FatalError ("Within ReadInt: ReadBytes failed")
          endIf
          return i
        endMethod

      ----------  OpenFile . LoadExecutable  ----------

      method LoadExecutable (addrSpace: ptr to AddrSpace) returns int
        --
        -- This method reads an executable "a.out" file from the disk, creates
        -- a virtual address space (with all pages resident in memory), and
        -- loads the executable program into the new address space.
        --
        -- The virtual address space will consist of (in this order):
        --     The environment page(s)     see NUMBER_OF_ENVIRONMENT_PAGES
        --     The text page(s)
        --     The data page(s)
        --     The bss page(s)
        --     The stack page(s)           see USER_STACK_SIZE_IN_PAGES
        --
        -- The given "addrSpace" is assumed to be empty; this method will
        -- allocate new frames and initialize the page table.
        --
        -- If all is okay, this method returns the initial PC, which will be
        -- the address of the first word of the first text page.
        --
        -- If any problems arise, this method returns -1.
        --
          var nextVirtPage, addr: int
              textSize, dataSize, bssSize, textStart, dataStart, bssStart: int
              i, textSizeInPages, dataSizeInPages, bssSizeInPages: int
 
          -- Make sure this address space is empty...
          if addrSpace.numberOfPages != 0
            FatalError ("LoadExecutable: This virtual address space is not empty")
          endIf
         
          -- Read and check the magic number...
          if  self.ReadInt () != 0x424C5A78    -- in ASCII: "BLZx"
            print ("LoadExecutable: Bad magic number\n")
            return -1
          endIf

          -- Read in the header info...
          textSize = self.ReadInt ()
          dataSize = self.ReadInt ()
          bssSize = self.ReadInt ()
          textStart = self.ReadInt ()
          dataStart = self.ReadInt ()
          bssStart = self.ReadInt ()

          -- Compute the size of the text segment in pages...
          if textSize % PAGE_SIZE != 0
            print ("LoadExecutable: The text segment size not a multiple of page size\n")
            return -1
          endIf
          textSizeInPages = textSize / PAGE_SIZE

          -- Environment pages are filled in by the OS; make sure the executable
          -- and the OS agree about how many there are to be...
          if textStart != NUMBER_OF_ENVIRONMENT_PAGES * PAGE_SIZE
            print ("LoadExecutable: The environment size does not")
      print (" match the 'loadAddr' info supplied to the linker\n")
            return -1
          endIf

          -- Compute the size of the data segment in pages...
          if dataSize % PAGE_SIZE != 0
            print ("LoadExecutable: The data segment size not a multiple of page size\n")
            return -1
          endIf
          if dataStart != textStart + textSize
            print ("LoadExecutable: dataStart != textStart + textSize\n")
            return -1
          endIf
          dataSizeInPages = dataSize / PAGE_SIZE

          -- Compute the size of the bss segment in pages...
          if bssSize % PAGE_SIZE != 0
            print ("LoadExecutable: The bss segment size not a multiple of page size\n")
            return -1
          endIf
          if bssStart != dataStart + dataSize
            print ("LoadExecutable: bssStart != dataStart + dataSize\n")
            return -1
          endIf
          bssSizeInPages = bssSize / PAGE_SIZE

          -- Compute how many pages to put into the address space...
          i = textSizeInPages + dataSizeInPages + bssSizeInPages +
              USER_STACK_SIZE_IN_PAGES + NUMBER_OF_ENVIRONMENT_PAGES

          /*****
          printIntVar ("NUMBER_OF_ENVIRONMENT_PAGES", NUMBER_OF_ENVIRONMENT_PAGES)
          printIntVar ("USER_STACK_SIZE_IN_PAGES", USER_STACK_SIZE_IN_PAGES)
          printIntVar ("textSizeInPages", textSizeInPages)
          printIntVar ("dataSizeInPages", dataSizeInPages)
          printIntVar ("bssSizeInPages", bssSizeInPages)
          printIntVar ("addrSpace.numberOfPages", addrSpace.numberOfPages)
          printIntVar ("Number of pages in this address space", i)
          printIntVar ("MAX_PAGES_PER_VIRT_SPACE", MAX_PAGES_PER_VIRT_SPACE)
          *****/

          -- Allocate the frames...
          if i > MAX_PAGES_PER_VIRT_SPACE
            print ("LoadExecutable: This virtual address space exceeds the limit\n")
            printIntVar ("LoadExecutable: Number of pages in this address space", i)
            printIntVar ("LoadExecutable: MAX_PAGES_PER_VIRT_SPACE", MAX_PAGES_PER_VIRT_SPACE)
            return -1
          endIf

          frameManager.GetNewFrames (addrSpace, i)

          --print ("LoadExecutable: The address space just allocated...\n")
          --addrSpace.Print ()

          -- Read and check the separator...
          if  self.ReadInt () != 0x2a2a2a2a
            --print ("LoadExecutable: Invalid file format - missing separator (1)\n")
            frameManager.ReturnAllFrames (addrSpace)
            return -1
          endIf

          -- Read the text segment...
          nextVirtPage = textStart / PAGE_SIZE
          for i = 1 to textSizeInPages
            addr = addrSpace.ExtractFrameAddr (nextVirtPage)
            -- printIntVar ("About to read; nextVirtPage", nextVirtPage)
            -- printHexVar ("               addr", addr)
            if ! self.ReadBytes (addr, PAGE_SIZE)
              print ("LoadExecutable: Problems reading from file (text)\n")
              frameManager.ReturnAllFrames (addrSpace)
              return -1
            endIf
            addrSpace.ClearWritable (nextVirtPage)
            nextVirtPage = nextVirtPage + 1
          endFor

          -- Read and check the separator...
          if  self.ReadInt () != 0x2a2a2a2a
            --print ("LoadExecutable: Invalid file format - missing separator (2)\n")
            frameManager.ReturnAllFrames (addrSpace)
            return -1
          endIf

          -- Read the data segment...
          for i = 1 to dataSizeInPages
            addr = addrSpace.ExtractFrameAddr (nextVirtPage)
            -- printIntVar ("About to read; nextVirtPage", nextVirtPage)
            -- printHexVar ("               addr", addr)
            if ! self.ReadBytes (addr, PAGE_SIZE)
              print ("LoadExecutable: Problems reading from file (text)\n")
              frameManager.ReturnAllFrames (addrSpace)
              return -1
            endIf
            nextVirtPage = nextVirtPage + 1
          endFor

          -- Read and check the separator...
          if  self.ReadInt () != 0x2a2a2a2a
            print ("LoadExecutable: Invalid file format - missing separator (3)\n")
            frameManager.ReturnAllFrames (addrSpace)
            return -1
          endIf

          -- Zero out the bss segment...
          addr = addrSpace.ExtractFrameAddr (nextVirtPage)
          -- printIntVar ("About to zero bss segment; page", nextVirtPage)
          -- printHexVar ("                           addr", addr)
          -- printHexVar ("                           bssSizeInBytes", bssSize)
          MemoryZero (addr, bssSize)

          -- User programs begin execution at the first word of the text segment...
          return textStart
        endMethod


      ----------  OpenFile . Lookup  ----------

      method Lookup ( filename: String)
           returns ptr to dirEntry
    var ent: ptr to dirEntry

            if kind != DIRECTORY
        FatalError ("Lookup on a non-Directory file.")
      endIf

       -- Start at beginning
       currentPos = 0
       addPos = -1
       ent = self.GetNextEntry(filename arraySize)
       while ent != null
          if StrCmp (filename, &ent.name) == 0
       return ent
    endIf
    ent = self.GetNextEntry(filename arraySize)
       endWhile
       
       -- Not found
       return null
  endMethod

      ----------  OpenFile . GetNextEntry  ----------

      -- newSize -> used during lookup to keep a pointer
      -- to where an entry of newSize characters may be inserted

      method GetNextEntry (newSize: int) returns ptr to dirEntry
         var sec: int
       offset: int
       retVal: ptr to dirEntry

           if kind != DIRECTORY
        FatalError ("GetNextEntry on a non-Directory file.")
     endIf

     sec = currentPos / PAGE_SIZE
     offset = currentPos % PAGE_SIZE

     if fcb.relativeSectorInBuffer != sec
        -- print ("Need to load new sector!\n")
        if !fcb.ReadSector(sec, false)
          return null
        endIf
     endIf

     -- Point to an entry in the buffer    
     retVal = (fcb.bufferPtr + offset) asPtrTo dirEntry

     -- End of directory?
     if retVal.inodeNum == -1
       return null
     endIf

     -- End of Sector?
     if retVal.inodeNum == 0

       -- Can we save a new entry here?
       if addPos == -1 && offset <= PAGE_SIZE - entSize(newSize)
        addPos = currentPos
       endIf

       -- Get Next sector
       sec = sec + 1
       offset = 0
       currentPos = sec * PAGE_SIZE
       
       retVal = (fcb.bufferPtr + offset) asPtrTo dirEntry
       if retVal.inodeNum == -1
         return null
       endIf

     endIf

     -- Update Current pointer
     currentPos = currentPos + entSize(retVal.name arraySize)
     
           return retVal
  endMethod

      ----------  OpenFile . AddEntry  ----------

      method AddEntry (inodeNum: int, filename: String) returns bool
        var 
     ent: ptr to dirEntry
     pi: ptr to int
     sec: int
     offset: int
     save: int

     -- Sanity check
           if kind != DIRECTORY
        FatalError ("AddEntry on a non-Directory file.")
     endIf

     -- See if it exists already
     ent = self.Lookup (filename)
     if ent != null
        print ("AddEntry: found name ") print(filename) nl()
        return false
     endIf

     -- Check addPos ...
     if addPos < 0
        addPos = fcb.inode.fsize - 4
     endIf

     -- Now add the the entry, addPos should be set to
     sec = addPos / PAGE_SIZE
     offset = addPos % PAGE_SIZE
     -- Make sure the correct sector is loaded
     if fcb.relativeSectorInBuffer != sec
        -- print ("Need to load new sector!\n")
        if !fcb.ReadSector(sec, true)
          return false
        endIf
     endIf

     -- the location in the directory that the filename will fit
     ent = (fcb.bufferPtr + offset) asPtrTo dirEntry
     if ent.inodeNum != 0 && ent.inodeNum != -1
        FatalError ("OpenFile.AddEntry incorrectly set addPos")
     endIf

     -- Special case: -1 and not enough room in the current
     -- sector.
     if ent.inodeNum == -1 && entSize(filename arraySize) > PAGE_SIZE - offset
          -- don't use indirect block for directories ...
          if sec == 9 || ! fcb.inode.AllocateNewSector(sec+1)
       return false
    endIf
    fileSystem.fsLock.Lock()
          ent.inodeNum = 0
    fcb.bufferIsDirty = true
    fcb.Flush()
    sec = sec + 1
    offset = 0
    MemoryZero (fcb.bufferPtr, PAGE_SIZE)
    ent = fcb.bufferPtr asPtrTo dirEntry
    ent.inodeNum = -1
    currentPos = (sec-1) * PAGE_SIZE
    fcb.inode.fsize = currentPos+4
    fcb.inode.dirty = true
    fcb.relativeSectorInBuffer = sec
    fileSystem.fsLock.Unlock()
     endIf

     -- Now add the new entry.
     -- print ("AddEntry: ") print (filename) nl()
     fileSystem.fsLock.Lock()
     save = ent.inodeNum
     ent.inodeNum = inodeNum
     pi = ent asPtrTo int
     *(pi+4) = filename arraySize
     StrCopy(&ent.name, filename)
     fcb.bufferIsDirty = true
     offset = offset + entSize(filename arraySize)
     ent = (fcb.bufferPtr + offset) asPtrTo dirEntry
     ent.inodeNum = save
     currentPos = currentPos + entSize(filename arraySize)
     if currentPos+4 > fcb.inode.fsize
        fcb.inode.fsize = currentPos+4
        fcb.inode.dirty = true
        fileSystem.fsLock.Unlock()
        fcb.inode.WriteInode()
           else
        fileSystem.fsLock.Unlock()
           endIf
     
     fcb.Flush()
           return true
  endMethod
  endBehavior

endCode
