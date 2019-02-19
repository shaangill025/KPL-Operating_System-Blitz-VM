code Game

  -- OS Class: Project 2
  --
  -- <PUT YOUR NAME HERE>
  --

  function main ()
      InitializeScheduler ()
      GameParlor ()
      ThreadFinish ()
    endFunction

  var
      monitor2: GameMonitor
      ThreadArray: array [8] of Thread = new array of Thread {8 of new Thread} -- 8 threads for 8 groups

  function GameParlor ()
    monitor2 = new GameMonitor
    monitor2.Init()

    ThreadArray[0].Init ("A")
    ThreadArray[0].Fork (LetsPlay, 4)

    ThreadArray[1].Init ("B")
    ThreadArray[1].Fork (LetsPlay, 4)

    ThreadArray[2].Init ("C")
    ThreadArray[2].Fork (LetsPlay, 5)

    ThreadArray[3].Init ("D")
    ThreadArray[3].Fork (LetsPlay, 5)

    ThreadArray[4].Init ("E")
    ThreadArray[4].Fork (LetsPlay, 2)

    ThreadArray[5].Init ("F")
    ThreadArray[5].Fork (LetsPlay, 2)

    ThreadArray[6].Init ("G")
    ThreadArray[6].Fork (LetsPlay, 1)

    ThreadArray[7].Init ("H")
    ThreadArray[7].Fork (LetsPlay, 1)
  endFunction

function LetsPlay(p: int)
  var
    i: int
    for i = 0 to 4
      monitor2.Request(p)
      currentThread.Yield()
      monitor2.Return(p)
      currentThread.Yield()
    endFor
endFunction

class GameMonitor
  superclass Object
  fields
    mutex2: Mutex                   -- Mutex to lock
    front: Condition                -- First group in the line
    restOfLine: Condition           -- Rest of the groups in line
    diceAvailable: int              -- Tells how many dice are available
    groupsWaiting: int              -- Tells how many groups are waiting
  methods
    Init()
    Request (numberNeeded: int)     -- A group requests a the amount of dice they need for their game
    Return (numberReturned: int)    -- A group returns the dice after they have finished their game
    Print (str: String, count: int) -- Print statement for the program
endClass
 
  behavior GameMonitor  
    -- Creates and initializes all the variables used
    method Init()
   
    -- Create and initialize variables
    mutex2 = new Mutex
    mutex2.Init()
     
    front = new Condition
    front.Init()

    restOfLine = new Condition
    restOfLine.Init()

    diceAvailable = 8
    groupsWaiting = 0
  endMethod

  method Request(numberNeeded: int)
    mutex2.Lock()                             -- Lock the mutex
    self.Print ("requests", numberNeeded)     -- Print the amount of dice needed
    groupsWaiting = groupsWaiting + 1         -- Increment waiting group

    if groupsWaiting > 1                      -- There is a line, wait in the line
      restOfLine.Wait (&mutex2)               -- Unlock mutex and wait for signal
    endIf
    while diceAvailable < numberNeeded        -- at front of list, wait for dice
      front.Wait(&mutex2)                     -- Unlock mutex and wait for signal
    endWhile

    diceAvailable = diceAvailable - numberNeeded  
    groupsWaiting = groupsWaiting - 1         -- decrement waiting group
    restOfLine.Signal (&mutex2)               -- signal on, lock mutex, let play game
    self.Print("proceeds with", numberNeeded) -- print out how many lines needed 
    mutex2.Unlock ()                          -- Unlock the mutex
  endMethod
 
  method Return (numberReturned: int)
    mutex2.Lock ()                            -- Lock the mutex
    diceAvailable = diceAvailable + numberReturned
    self.Print ("releases and adds back", numberReturned) -- amount of dice 
    front.Signal (&mutex2)                    -- Wakeup the first group in line, if they exist
    mutex2.Unlock()
  endMethod
 
  method Print (str: String, count: int)
    print (currentThread.name)
    print ("  ")
    print (str)
    print ("  ")
    printInt (count)
    nl ()
    print ("------------------------------Number of dice now avail = ")
    printInt (diceAvailable)
    nl ()
  endMethod
endBehavior
endCode
