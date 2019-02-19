-- -*-Fundamental-*-

header Syscall


  enum SYSCALL_EXIT = 1,
       SYSCALL_SHUTDOWN,
       SYSCALL_YIELD,
       SYSCALL_GETPID,
       SYSCALL_GETPPID,
       SYSCALL_FORK,
       SYSCALL_JOIN,
       SYSCALL_EXEC,

       -- File System System calls
       SYSCALL_OPEN,
       SYSCALL_READ,
       SYSCALL_WRITE,
       SYSCALL_SEEK,
       SYSCALL_CLOSE,
       SYSCALL_STAT,
       SYSCALL_CHMODE,
       SYSCALL_LINK,
       SYSCALL_UNLINK,
       SYSCALL_MKDIR,
       SYSCALL_RMDIR,
       SYSCALL_CHDIR,
       SYSCALL_OPENDIR,
       SYSCALL_READDIR
  
  type

     statInfo = record
		  inodeNum: int
		  nlinks: int
		  mode: int
		  fsize: int
		  balloc: int
                endRecord

      dirEntry = record
      	           inodeNum: int
		   name: array [255] of char
                 endRecord

  const

     -- Flags for the open system call
     O_READ      = 1
     O_WRITE     = 2
     O_RDWR      = 3
     O_CREATE    = 4
     O_MAYCREATE = 8

     -- Modes
     TYPE_FILE     = 16   -- 0x10
     TYPE_DIR      = 32   -- 0x20
     TYPE_TERMINAL = 64   -- 0x40

     MODE_READ  = 4
     MODE_WRITE = 2
     MODE_EXE   = 1

  functions
      entSize (numChars: int) returns int

endHeader
