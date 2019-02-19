code TestProgram2

-----------------------------  TestProgram2  ---------------------------------

  function main ()

    var ix: int

      print ("User-level program 'TestProgram2' is running!\n")

      print ("Command line arguments:\n")
      if cmdArgs == null
        print ("   None provided.\n")
      else
        for ix = 0 to cmdArgs arraySize - 1
           print ("   arg[") printInt(ix) print("] is ") print (cmdArgs[ix]) nl()
        endFor
        nl ()
      endIf

      print ("\n***** About to call Sys_Shutdown...\n")
      print ("***** Should print:\n")
      print ("*****     FATAL ERROR in UserProgram: \"Syscall 'Shutdown' was invoked by a user thread\" -- TERMINATING!\n")

      Sys_Shutdown ()

      print ("\n*************** ERROR: Execution should not continue after Shutdown\n")

    endFunction

endCode
