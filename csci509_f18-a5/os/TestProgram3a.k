code TestProgram3a

           ------------------------------------------
           ------                              ------
           ------   Phil Nelson's args test    ------
           ------                              ------
           ------------------------------------------

--------------------------  main --------------------------------

  function main ()
    var ret: int
        err: int
	pid: int
        argc: int
	lastArg: ptr to array of char

       argc = cmdArgs arraySize
       pid = Sys_GetPid()

       printIntVar ("\nTestProgram3a is now running as pid ", pid)
       if pid != 1
          print ("!!!!  Args test error: pid should be 1.  !!!!") nl()
       endIf
       printIntVar ("Number of command line arguments is: ", argc)
       lastArg = cmdArgs[argc-1]
       print ("Last argument is: ") print (lastArg) nl ()

       ret = Sys_Fork()
       
       if ret < 0 
          print ("Sys_Fork failed ... test failed\n")
       else
          if ret == 0
	    -- In the child ... check out arguments!
	    if argc != cmdArgs arraySize ||
	       lastArg != cmdArgs[argc-1]
	       print ("Failed Fork with Arguments test!\n")
	       print ("  Args differ in child!\n\n")
	    else
	       if pid != Sys_GetPPid()
	          print ("Failure, mismatching pid's from getpid/getppid\n")
	       else
	          printIntVar ("Child's pid in child is ", Sys_GetPid())
	       	  printIntVar ("Parent's pid is: ", Sys_GetPPid())
	       endIf
	       print ("Success! args are the same in the child!\n")
	    endIf
	  else
	    err = Sys_Join (ret)
	    printIntVar ("Parent process spawned child with pid: ", ret)
	    Sys_Shutdown ()
          endIf
       endIf

    endFunction

endCode
 
