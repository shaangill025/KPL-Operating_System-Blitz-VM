code Syscall

  -- Size of a directory entry
  function entSize (numChars: int) returns int
      if numChars % 4 == 0
         return 8 + numChars
      else
         return 8 + numChars + 4 - numChars % 4
      endIf
    endFunction

endCode
