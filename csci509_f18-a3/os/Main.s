! Name of package being compiled: Main
! 
! Symbols from runtime.s
	.import	_putString
	.import	_heapInitialize
	.import	_heapAlloc
	.import	_heapFree
	.import	_IsKindOf
	.import	_RestoreCatchStack
	.import	_PerformThrow
	.import	_runtimeErrorOverflow
	.import	_runtimeErrorZeroDivide
	.import	_runtimeErrorNullPointer
	.import	_runtimeErrorUninitializedObject
	.import	_runtimeErrorWrongObject
	.import	_runtimeErrorWrongObject2
	.import	_runtimeErrorWrongObject3
	.import	_runtimeErrorBadObjectSize
	.import	_runtimeErrorDifferentArraySizes
	.import	_runtimeErrorWrongArraySize
	.import	_runtimeErrorUninitializedArray
	.import	_runtimeErrorBadArrayIndex
	.import	_runtimeErrorNullPointerDuringCall
	.import	_runtimeErrorArrayCountNotPositive
	.import	_runtimeErrorRestoreCatchStackError
	.text
! ErrorDecls
	.import	_Error_P_System_UncaughtThrowError
	.align
! Functions imported from other packages
	.import	_P_Syscall_entSize
	.import	print
	.import	printInt
	.import	printHex
	.import	printChar
	.import	printBool
	.import	_P_System_MemoryEqual
	.import	_P_System_StrEqual
	.import	_P_System_StrCopy
	.import	_P_System_StrCmp
	.import	_P_System_StrChr
	.import	_P_System_Min
	.import	_P_System_Max
	.import	_P_System_printIntVar
	.import	_P_System_printHexVar
	.import	_P_System_printBoolVar
	.import	_P_System_printCharVar
	.import	_P_System_printPtr
	.import	_P_System_nl
	.import	_P_System_PrintMemory
	.import	Cleari
	.import	Seti
	.import	Wait
	.import	RuntimeExit
	.import	getCatchStack
	.import	MemoryZero
	.import	MemoryCopy
	.import	_P_System_KPLSystemInitialize
	.import	_P_System_KPLMemoryAlloc
	.import	_P_System_KPLMemoryFree
	.import	_P_System_KPLUncaughtThrow
	.import	_P_System_KPLIsKindOf
	.import	_P_System_KPLSystemError
	.import	_P_BitMap_TestBitMap
	.import	_P_Kernel_TimerInterruptHandler
	.import	_P_Kernel_DiskInterruptHandler
	.import	_P_Kernel_SerialInterruptHandler
	.import	_P_Kernel_IllegalInstructionHandler
	.import	_P_Kernel_ArithmeticExceptionHandler
	.import	_P_Kernel_AddressExceptionHandler
	.import	_P_Kernel_PageInvalidExceptionHandler
	.import	_P_Kernel_PageReadonlyExceptionHandler
	.import	_P_Kernel_PrivilegedInstructionHandler
	.import	_P_Kernel_AlignmentExceptionHandler
	.import	_P_Kernel_SyscallTrapHandler
	.import	_P_Kernel_Handle_Sys_Fork
	.import	_P_Kernel_Handle_Sys_Yield
	.import	_P_Kernel_Handle_Sys_Exec
	.import	_P_Kernel_Handle_Sys_Join
	.import	_P_Kernel_Handle_Sys_Exit
	.import	_P_Kernel_Handle_Sys_Open
	.import	_P_Kernel_Handle_Sys_Read
	.import	_P_Kernel_Handle_Sys_Write
	.import	_P_Kernel_Handle_Sys_Seek
	.import	_P_Kernel_Handle_Sys_Close
	.import	_P_Kernel_Handle_Sys_Shutdown
	.import	_P_Kernel_InitializeScheduler
	.import	_P_Kernel_Run
	.import	_P_Kernel_PrintReadyList
	.import	_P_Kernel_ThreadStartMain
	.import	_P_Kernel_ThreadFinish
	.import	_P_Kernel_FatalError_ThreadVersion
	.import	_P_Kernel_SetInterruptsTo
	.import	_P_Kernel_ProcessFinish
	.import	_P_Kernel_InitFirstProcess
	.import	Switch
	.import	ThreadStartUp
	.import	GetOldUserPCFromSystemStack
	.import	LoadPageTableRegs
	.import	SaveUserRegs
	.import	RestoreUserRegs
	.import	BecomeUserThread
! Externally visible functions in this package
	.export	_mainEntry
	.export	main
! The following class and its methods are from other packages
	.import	_P_System_Object
! The following class and its methods are from other packages
	.import	_P_BitMap_BitMap
! The following class and its methods are from other packages
	.import	_P_List_List
! The following class and its methods are from other packages
	.import	_P_List_Listable
! The following class and its methods are from other packages
	.import	_P_Kernel_Semaphore
! The following class and its methods are from other packages
	.import	_P_Kernel_Mutex
! The following class and its methods are from other packages
	.import	_P_Kernel_Condition
! The following class and its methods are from other packages
	.import	_P_Kernel_Thread
! The following class and its methods are from other packages
	.import	_P_Kernel_ThreadManager
! The following class and its methods are from other packages
	.import	_P_Kernel_ProcessControlBlock
! The following class and its methods are from other packages
	.import	_P_Kernel_ProcessManager
! The following class and its methods are from other packages
	.import	_P_Kernel_FrameManager
! The following class and its methods are from other packages
	.import	_P_Kernel_AddrSpace
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
	.import	_P_System_FatalError
	.import	_P_Kernel_readyList
	.import	_P_Kernel_currentThread
	.import	_P_Kernel_mainThread
	.import	_P_Kernel_idleThread
	.import	_P_Kernel_threadsToBeDestroyed
	.import	_P_Kernel_currentInterruptStatus
	.import	_P_Kernel_processManager
	.import	_P_Kernel_threadManager
	.import	_P_Kernel_frameManager
! Global variables in this package
	.data
_Global_uniqueNumberLock:
! Static object
	.word	_P_Kernel_Mutex
	.word	0
	.word	0
	.word	0
	.word	0
_Global_nextUnique:
	.word	0x00000001		! decimal value = 1
_Global_allDone:
! Static object
	.word	_P_Kernel_Semaphore
	.word	0
	.word	0
	.word	0
	.word	0
_Global_freeze:
! Static object
	.word	_P_Kernel_Semaphore
	.word	0
	.word	0
	.word	0
	.word	0
_Global_allDone2:
! Static object
	.word	_P_Kernel_Semaphore
	.word	0
	.word	0
	.word	0
	.word	0
_Global_histogram:
! Static array
	.word	35		! number of elements
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.align
_Global_testPutAFrame:
	.skip	1
	.align
! String constants
_StringConst_24:
	.word	49			! length
	.ascii	"Data corruption, indicating that frame was shared"
	.align
_StringConst_23:
	.word	35			! length
	.ascii	"Bad frame number in some addr space"
	.align
_StringConst_22:
	.word	32			! length
	.ascii	"addrSpace.numberOfPages is wrong"
	.align
_StringConst_21:
	.word	43			! length
	.ascii	"Problems with bits in some page table entry"
	.align
_StringConst_20:
	.word	35			! length
	.ascii	"Bad frame number in some addr space"
	.align
_StringConst_19:
	.word	32			! length
	.ascii	"addrSpace.numberOfPages is wrong"
	.align
_StringConst_18:
	.word	26			! length
	.ascii	"Single page has wrong data"
	.align
_StringConst_17:
	.word	57			! length
	.ascii	"\n\n***** FRAME-MANAGER TEST COMPLETED SUCCESSFULLY *****\n\n"
	.align
_StringConst_16:
	.word	3			! length
	.ascii	":  "
	.align
_StringConst_15:
	.word	2			! length
	.ascii	"  "
	.align
_StringConst_14:
	.word	66			! length
	.ascii	"\n\nHere is a histogram showing how many times each frame was used:\n"
	.align
_StringConst_13:
	.word	16			! length
	.ascii	"TestFrameManager"
	.align
_StringConst_12:
	.word	36			! length
	.ascii	"\n\n*****  FRAME-MANAGER TEST  *****\n\n"
	.align
_StringConst_11:
	.word	31			! length
	.ascii	"Concurrency control failure (2)"
	.align
_StringConst_10:
	.word	59			! length
	.ascii	"\n\n***** PROCESS-MANAGER TEST COMPLETED SUCCESSFULLY *****\n\n"
	.align
_StringConst_9:
	.word	31			! length
	.ascii	"Concurrency control failure (1)"
	.align
_StringConst_8:
	.word	18			! length
	.ascii	"TestProcessManager"
	.align
_StringConst_7:
	.word	38			! length
	.ascii	"\n\n*****  PROCESS-MANAGER TEST  *****\n\n"
	.align
_StringConst_6:
	.word	31			! length
	.ascii	"Concurrency control failure (2)"
	.align
_StringConst_5:
	.word	58			! length
	.ascii	"\n\n***** THREAD-MANAGER TEST COMPLETED SUCCESSFULLY *****\n\n"
	.align
_StringConst_4:
	.word	31			! length
	.ascii	"Concurrency control failure (1)"
	.align
_StringConst_3:
	.word	17			! length
	.ascii	"TestThreadManager"
	.align
_StringConst_2:
	.word	37			! length
	.ascii	"\n\n*****  THREAD-MANAGER TEST  *****\n\n"
	.align
_StringConst_1:
	.word	9			! length
	.ascii	"MyProgram"
	.align
	.text
! 
! =====  MAIN ENTRY POINT  =====
! 
_mainEntry:
	set	_packageName,r2		! Get CheckVersion started
	set	0xeb2db4a8,r3		! .  hashVal = -349326168
	call	_CheckVersion_P_Main_	! .
	cmp	r1,0			! .
	be	_Label_34		! .
	ret				! .
_Label_34:				! .
	call	_heapInitialize
	jmp	main
! 
! Source Filename and Package Name
! 
_sourceFileName:
	.ascii	"Main.k\0"
_packageName:
	.ascii	"Main\0"
	.align
!
! CheckVersion
!
!     This routine is passed:
!       r2 = ptr to the name of the 'using' package
!       r3 = the expected hashVal for 'used' package (myPackage)
!     It prints an error message if the expected hashVal is not correct
!     It then checks all the packages that 'myPackage' uses.
!
!     This routine returns:
!       r1:  0=No problems, 1=Problems
!
!     Registers modified: r1-r4
!
_CheckVersion_P_Main_:
	.export	_CheckVersion_P_Main_
	set	0xeb2db4a8,r4		! myHashVal = -349326168
	cmp	r3,r4
	be	_Label_35
	set	_CVMess1,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess2,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess3,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess4,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess5,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess6,r1
	call	_putString
	mov	1,r1
	ret	
_Label_35:
	mov	0,r1
! Make sure _P_Syscall_ has hash value 0x73d5af34 (decimal 1943383860)
	set	_packageName,r2
	set	0x73d5af34,r3
	call	_CheckVersion_P_Syscall_
	.import	_CheckVersion_P_Syscall_
	cmp	r1,0
	bne	_Label_36
! Make sure _P_System_ has hash value 0xba42d652 (decimal -1170024878)
	set	_packageName,r2
	set	0xba42d652,r3
	call	_CheckVersion_P_System_
	.import	_CheckVersion_P_System_
	cmp	r1,0
	bne	_Label_36
! Make sure _P_BitMap_ has hash value 0x93947b8f (decimal -1818985585)
	set	_packageName,r2
	set	0x93947b8f,r3
	call	_CheckVersion_P_BitMap_
	.import	_CheckVersion_P_BitMap_
	cmp	r1,0
	bne	_Label_36
! Make sure _P_List_ has hash value 0xafebcabb (decimal -1343501637)
	set	_packageName,r2
	set	0xafebcabb,r3
	call	_CheckVersion_P_List_
	.import	_CheckVersion_P_List_
	cmp	r1,0
	bne	_Label_36
! Make sure _P_Kernel_ has hash value 0x5e21aca3 (decimal 1579265187)
	set	_packageName,r2
	set	0x5e21aca3,r3
	call	_CheckVersion_P_Kernel_
	.import	_CheckVersion_P_Kernel_
	cmp	r1,0
	bne	_Label_36
_Label_36:
	ret
_CVMess1:	.ascii	"\nVERSION CONSISTENCY ERROR: Package '\0"
_CVMess2:	.ascii	"' uses package '\0"
_CVMess3:	.ascii	"'.  Whenever a header file is modified, all packages that use that package (directly or indirectly) must be recompiled.  The header file for '\0"
_CVMess4:	.ascii	"' has been changed since '\0"
_CVMess5:	.ascii	"' was compiled last.  Please recompile all packages that depend on '\0"
_CVMess6:	.ascii	"'.\n\n\0"
	.align
! 
! ===============  FUNCTION main  ===============
! 
main:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor_main,r1
	push	r1
	mov	8,r1
_Label_516:
	push	r0
	sub	r1,1,r1
	bne	_Label_516
	mov	9,r13		! source line 9
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! SEND STATEMENT...
	mov	15,r13		! source line 15
	mov	"\0\0SE",r10
!   _temp_37 = &_Global_uniqueNumberLock
	set	_Global_uniqueNumberLock,r1
	store	r1,[r14+-36]
!   Send message Init
	load	[r14+-36],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! CALL STATEMENT...
!   Call the function
	mov	18,r13		! source line 18
	mov	"\0\0CA",r10
	call	_P_Kernel_InitializeScheduler
! ASSIGNMENT STATEMENT...
	mov	21,r13		! source line 21
	mov	"\0\0AS",r10
!   NEW CLASS Constructor...
!   ZeroMemory: _P_Kernel_processManager = zeros  (sizeInBytes=1512)
	set	_P_Kernel_processManager,r4
	mov	378,r3
_Label_517:
	store	r0,[r4]
	add	r4,4,r4
	sub	r3,1,r3
	bne	_Label_517
!   _P_Kernel_processManager = _P_Kernel_ProcessManager
	set	_P_Kernel_ProcessManager,r1
	set	_P_Kernel_processManager,r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	22,r13		! source line 22
	mov	"\0\0SE",r10
!   _temp_39 = &_P_Kernel_processManager
	set	_P_Kernel_processManager,r1
	store	r1,[r14+-28]
!   Send message Init
	load	[r14+-28],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	25,r13		! source line 25
	mov	"\0\0AS",r10
!   NEW CLASS Constructor...
!   ZeroMemory: _P_Kernel_threadManager = zeros  (sizeInBytes=41712)
	set	_P_Kernel_threadManager,r4
	mov	10428,r3
_Label_518:
	store	r0,[r4]
	add	r4,4,r4
	sub	r3,1,r3
	bne	_Label_518
!   _P_Kernel_threadManager = _P_Kernel_ThreadManager
	set	_P_Kernel_ThreadManager,r1
	set	_P_Kernel_threadManager,r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	26,r13		! source line 26
	mov	"\0\0SE",r10
!   _temp_41 = &_P_Kernel_threadManager
	set	_P_Kernel_threadManager,r1
	store	r1,[r14+-20]
!   Send message Init
	load	[r14+-20],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	29,r13		! source line 29
	mov	"\0\0AS",r10
!   NEW CLASS Constructor...
!   ZeroMemory: _P_Kernel_frameManager = zeros  (sizeInBytes=56)
	set	_P_Kernel_frameManager,r4
	mov	14,r3
_Label_519:
	store	r0,[r4]
	add	r4,4,r4
	sub	r3,1,r3
	bne	_Label_519
!   _P_Kernel_frameManager = _P_Kernel_FrameManager
	set	_P_Kernel_FrameManager,r1
	set	_P_Kernel_frameManager,r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	30,r13		! source line 30
	mov	"\0\0SE",r10
!   _temp_43 = &_P_Kernel_frameManager
	set	_P_Kernel_frameManager,r1
	store	r1,[r14+-12]
!   Send message Init
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	31,r13		! source line 31
	mov	"\0\0AS",r10
!   _Global_testPutAFrame = 1		(1 byte)
	mov	1,r1
	set	_Global_testPutAFrame,r2
	storeb	r1,[r2]
! CALL STATEMENT...
!   Call the function
	mov	112,r13		! source line 112
	mov	"\0\0CA",r10
	call	_function_32_RunThreadManagerTests
! CALL STATEMENT...
!   Call the function
	mov	113,r13		! source line 113
	mov	"\0\0CA",r10
	call	_function_30_RunProcessManagerTests
! CALL STATEMENT...
!   Call the function
	mov	114,r13		! source line 114
	mov	"\0\0CA",r10
	call	_function_28_RunFrameManagerTests
! CALL STATEMENT...
!   Call the function
	mov	116,r13		! source line 116
	mov	"\0\0CE",r10
	call	RuntimeExit
! RETURN STATEMENT...
	mov	116,r13		! source line 116
	mov	"\0\0RE",r10
	add	r15,36,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor_main:
	.word	_sourceFileName
	.word	_Label_44
	.word	0		! total size of parameters
	.word	32		! frame size = 32
	.word	_Label_45
	.word	-12
	.word	4
	.word	_Label_46
	.word	-16
	.word	4
	.word	_Label_47
	.word	-20
	.word	4
	.word	_Label_48
	.word	-24
	.word	4
	.word	_Label_49
	.word	-28
	.word	4
	.word	_Label_50
	.word	-32
	.word	4
	.word	_Label_51
	.word	-36
	.word	4
	.word	0
_Label_44:
	.ascii	"main\0"
	.align
_Label_45:
	.byte	'?'
	.ascii	"_temp_43\0"
	.align
_Label_46:
	.byte	'?'
	.ascii	"_temp_42\0"
	.align
_Label_47:
	.byte	'?'
	.ascii	"_temp_41\0"
	.align
_Label_48:
	.byte	'?'
	.ascii	"_temp_40\0"
	.align
_Label_49:
	.byte	'?'
	.ascii	"_temp_39\0"
	.align
_Label_50:
	.byte	'?'
	.ascii	"_temp_38\0"
	.align
_Label_51:
	.byte	'?'
	.ascii	"_temp_37\0"
	.align
! 
! ===============  FUNCTION GetUniqueNumber  ===============
! 
_function_33_GetUniqueNumber:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_33_GetUniqueNumber,r1
	push	r1
	mov	4,r1
_Label_520:
	push	r0
	sub	r1,1,r1
	bne	_Label_520
	mov	132,r13		! source line 132
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! SEND STATEMENT...
	mov	134,r13		! source line 134
	mov	"\0\0SE",r10
!   _temp_52 = &_Global_uniqueNumberLock
	set	_Global_uniqueNumberLock,r1
	store	r1,[r14+-16]
!   Send message Lock
	load	[r14+-16],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	135,r13		! source line 135
	mov	"\0\0AS",r10
!   i = _Global_nextUnique		(4 bytes)
	set	_Global_nextUnique,r1
	load	[r1],r1
	store	r1,[r14+-20]
! ASSIGNMENT STATEMENT...
	mov	136,r13		! source line 136
	mov	"\0\0AS",r10
!   _Global_nextUnique = _Global_nextUnique + count		(int)
	set	_Global_nextUnique,r1
	load	[r1],r1
	load	[r14+8],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	set	_Global_nextUnique,r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	137,r13		! source line 137
	mov	"\0\0SE",r10
!   _temp_53 = &_Global_uniqueNumberLock
	set	_Global_uniqueNumberLock,r1
	store	r1,[r14+-12]
!   Send message Unlock
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
! RETURN STATEMENT...
	mov	138,r13		! source line 138
	mov	"\0\0RE",r10
!   ReturnResult: i  (sizeInBytes=4)
	load	[r14+-20],r1
	store	r1,[r14+8]
	add	r15,20,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_33_GetUniqueNumber:
	.word	_sourceFileName
	.word	_Label_54
	.word	4		! total size of parameters
	.word	16		! frame size = 16
	.word	_Label_55
	.word	8
	.word	4
	.word	_Label_56
	.word	-12
	.word	4
	.word	_Label_57
	.word	-16
	.word	4
	.word	_Label_58
	.word	-20
	.word	4
	.word	0
_Label_54:
	.ascii	"GetUniqueNumber\0"
	.align
_Label_55:
	.byte	'I'
	.ascii	"count\0"
	.align
_Label_56:
	.byte	'?'
	.ascii	"_temp_53\0"
	.align
_Label_57:
	.byte	'?'
	.ascii	"_temp_52\0"
	.align
_Label_58:
	.byte	'I'
	.ascii	"i\0"
	.align
! 
! ===============  FUNCTION RunThreadManagerTests  ===============
! 
_function_32_RunThreadManagerTests:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_32_RunThreadManagerTests,r1
	push	r1
	mov	21,r1
_Label_521:
	push	r0
	sub	r1,1,r1
	bne	_Label_521
	mov	169,r13		! source line 169
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! SEND STATEMENT...
	mov	173,r13		! source line 173
	mov	"\0\0SE",r10
!   _temp_59 = &_Global_allDone
	set	_Global_allDone,r1
	store	r1,[r14+-72]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-72],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	174,r13		! source line 174
	mov	"\0\0SE",r10
!   _temp_60 = &_Global_freeze
	set	_Global_freeze,r1
	store	r1,[r14+-68]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-68],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	175,r13		! source line 175
	mov	"\0\0SE",r10
!   _temp_61 = &_Global_uniqueNumberLock
	set	_Global_uniqueNumberLock,r1
	store	r1,[r14+-64]
!   Send message Init
	load	[r14+-64],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	176,r13		! source line 176
	mov	"\0\0AS",r10
!   _Global_nextUnique = 1		(4 bytes)
	mov	1,r1
	set	_Global_nextUnique,r2
	store	r1,[r2]
! CALL STATEMENT...
!   _temp_62 = _StringConst_2
	set	_StringConst_2,r1
	store	r1,[r14+-60]
!   Prepare Argument: offset=8  value=_temp_62  sizeInBytes=4
	load	[r14+-60],r1
	store	r1,[r15+0]
!   Call the function
	mov	178,r13		! source line 178
	mov	"\0\0CE",r10
	call	print
! FOR STATEMENT...
	mov	180,r13		! source line 180
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_67 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-56]
!   Calculate and save the FOR-LOOP ending value
!   _temp_68 = 20		(4 bytes)
	mov	20,r1
	store	r1,[r14+-52]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_67  (sizeInBytes=4)
	load	[r14+-56],r1
	store	r1,[r14+-76]
_Label_63:
!   Perform the FOR-LOOP termination test
!   if i > _temp_68 then goto _Label_66		
	load	[r14+-76],r1
	load	[r14+-52],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_66
_Label_64:
	mov	180,r13		! source line 180
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	181,r13		! source line 181
	mov	"\0\0AS",r10
!   ALLOC CLASS Constructor...
!   Call alloc...
	mov	4164,r1
	store	r1,[r14+-48]
!   th = alloc (_temp_69)
	load	[r14+-48],r1
	call	_heapAlloc
	store	r1,[r14+-80]
!   ZeroMemory: *th = zeros  (sizeInBytes=4164)
	load	[r14+-80],r4
	mov	1041,r3
_Label_522:
	store	r0,[r4]
	add	r4,4,r4
	sub	r3,1,r3
	bne	_Label_522
!   *th = _P_Kernel_Thread
	set	_P_Kernel_Thread,r1
	load	[r14+-80],r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	182,r13		! source line 182
	mov	"\0\0SE",r10
!   _temp_71 = _StringConst_3
	set	_StringConst_3,r1
	store	r1,[r14+-40]
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-80],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=_temp_71  sizeInBytes=4
	load	[r14+-40],r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-80],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	183,r13		! source line 183
	mov	"\0\0SE",r10
!   _temp_72 = _function_31_TestThreadManager
	set	_function_31_TestThreadManager,r1
	store	r1,[r14+-36]
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-80],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=_temp_72  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=i  sizeInBytes=4
	load	[r14+-76],r1
	store	r1,[r15+8]
!   Send message Fork
	load	[r14+-80],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_65:
!   i = i + 1
	load	[r14+-76],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-76]
	jmp	_Label_63
! END FOR
_Label_66:
! FOR STATEMENT...
	mov	188,r13		! source line 188
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_77 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-32]
!   Calculate and save the FOR-LOOP ending value
!   _temp_78 = 20		(4 bytes)
	mov	20,r1
	store	r1,[r14+-28]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_77  (sizeInBytes=4)
	load	[r14+-32],r1
	store	r1,[r14+-76]
_Label_73:
!   Perform the FOR-LOOP termination test
!   if i > _temp_78 then goto _Label_76		
	load	[r14+-76],r1
	load	[r14+-28],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_76
_Label_74:
	mov	188,r13		! source line 188
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	189,r13		! source line 189
	mov	"\0\0SE",r10
!   _temp_79 = &_Global_allDone
	set	_Global_allDone,r1
	store	r1,[r14+-24]
!   Send message Down
	load	[r14+-24],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_75:
!   i = i + 1
	load	[r14+-76],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-76]
	jmp	_Label_73
! END FOR
_Label_76:
! IF STATEMENT...
	mov	192,r13		! source line 192
	mov	"\0\0IF",r10
!   Prepare Argument: offset=8  value=1  sizeInBytes=4
	mov	1,r1
	store	r1,[r15+0]
!   Call the function
	mov	192,r13		! source line 192
	mov	"\0\0CA",r10
	call	_function_33_GetUniqueNumber
!   Retrieve Result: targetName=_temp_82  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-20]
!   if _temp_82 == 401 then goto _Label_81		(int)
	load	[r14+-20],r1
	mov	401,r2
	cmp	r1,r2
	be	_Label_81
!	_Label_80	jmp	_Label_80
_Label_80:
! THEN...
	mov	193,r13		! source line 193
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_83 = _StringConst_4
	set	_StringConst_4,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_83  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	193,r13		! source line 193
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_81:
! CALL STATEMENT...
!   _temp_84 = _StringConst_5
	set	_StringConst_5,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_84  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	195,r13		! source line 195
	mov	"\0\0CE",r10
	call	print
! RETURN STATEMENT...
	mov	195,r13		! source line 195
	mov	"\0\0RE",r10
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_32_RunThreadManagerTests:
	.word	_sourceFileName
	.word	_Label_85
	.word	0		! total size of parameters
	.word	84		! frame size = 84
	.word	_Label_86
	.word	-12
	.word	4
	.word	_Label_87
	.word	-16
	.word	4
	.word	_Label_88
	.word	-20
	.word	4
	.word	_Label_89
	.word	-24
	.word	4
	.word	_Label_90
	.word	-28
	.word	4
	.word	_Label_91
	.word	-32
	.word	4
	.word	_Label_92
	.word	-36
	.word	4
	.word	_Label_93
	.word	-40
	.word	4
	.word	_Label_94
	.word	-44
	.word	4
	.word	_Label_95
	.word	-48
	.word	4
	.word	_Label_96
	.word	-52
	.word	4
	.word	_Label_97
	.word	-56
	.word	4
	.word	_Label_98
	.word	-60
	.word	4
	.word	_Label_99
	.word	-64
	.word	4
	.word	_Label_100
	.word	-68
	.word	4
	.word	_Label_101
	.word	-72
	.word	4
	.word	_Label_102
	.word	-76
	.word	4
	.word	_Label_103
	.word	-80
	.word	4
	.word	0
_Label_85:
	.ascii	"RunThreadManagerTests\0"
	.align
_Label_86:
	.byte	'?'
	.ascii	"_temp_84\0"
	.align
_Label_87:
	.byte	'?'
	.ascii	"_temp_83\0"
	.align
_Label_88:
	.byte	'?'
	.ascii	"_temp_82\0"
	.align
_Label_89:
	.byte	'?'
	.ascii	"_temp_79\0"
	.align
_Label_90:
	.byte	'?'
	.ascii	"_temp_78\0"
	.align
_Label_91:
	.byte	'?'
	.ascii	"_temp_77\0"
	.align
_Label_92:
	.byte	'?'
	.ascii	"_temp_72\0"
	.align
_Label_93:
	.byte	'?'
	.ascii	"_temp_71\0"
	.align
_Label_94:
	.byte	'?'
	.ascii	"_temp_70\0"
	.align
_Label_95:
	.byte	'?'
	.ascii	"_temp_69\0"
	.align
_Label_96:
	.byte	'?'
	.ascii	"_temp_68\0"
	.align
_Label_97:
	.byte	'?'
	.ascii	"_temp_67\0"
	.align
_Label_98:
	.byte	'?'
	.ascii	"_temp_62\0"
	.align
_Label_99:
	.byte	'?'
	.ascii	"_temp_61\0"
	.align
_Label_100:
	.byte	'?'
	.ascii	"_temp_60\0"
	.align
_Label_101:
	.byte	'?'
	.ascii	"_temp_59\0"
	.align
_Label_102:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_103:
	.byte	'P'
	.ascii	"th\0"
	.align
! 
! ===============  FUNCTION TestThreadManager  ===============
! 
_function_31_TestThreadManager:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_31_TestThreadManager,r1
	push	r1
	mov	22,r1
_Label_523:
	push	r0
	sub	r1,1,r1
	bne	_Label_523
	mov	207,r13		! source line 207
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! FOR STATEMENT...
	mov	211,r13		! source line 211
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_108 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-72]
!   Calculate and save the FOR-LOOP ending value
!   _temp_109 = 20		(4 bytes)
	mov	20,r1
	store	r1,[r14+-68]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_108  (sizeInBytes=4)
	load	[r14+-72],r1
	store	r1,[r14+-76]
_Label_104:
!   Perform the FOR-LOOP termination test
!   if i > _temp_109 then goto _Label_107		
	load	[r14+-76],r1
	load	[r14+-68],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_107
_Label_105:
	mov	211,r13		! source line 211
	mov	"\0\0FB",r10
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=myID  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	212,r13		! source line 212
	mov	"\0\0CE",r10
	call	printInt
! ASSIGNMENT STATEMENT...
	mov	213,r13		! source line 213
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=1  sizeInBytes=4
	mov	1,r1
	store	r1,[r15+0]
!   Call the function
	mov	213,r13		! source line 213
	mov	"\0\0CA",r10
	call	_function_33_GetUniqueNumber
!   Retrieve Result: targetName=e  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-84]
! ASSIGNMENT STATEMENT...
	mov	214,r13		! source line 214
	mov	"\0\0AS",r10
	mov	214,r13		! source line 214
	mov	"\0\0SE",r10
!   _temp_110 = &_P_Kernel_threadManager
	set	_P_Kernel_threadManager,r1
	store	r1,[r14+-64]
!   Send message GetANewThread
	load	[r14+-64],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=th  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-88]
! ASSIGNMENT STATEMENT...
	mov	215,r13		! source line 215
	mov	"\0\0AS",r10
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-88],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_111 = th + 12
	load	[r14+-88],r1
	add	r1,12,r1
	store	r1,[r14+-60]
!   Move address of _temp_111 [0 ] into _temp_112
!     make sure index expr is >= 0
	mov	0,r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+-60],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	4,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-56]
!   Data Move: *_temp_112 = e  (sizeInBytes=4)
	load	[r14+-84],r1
	load	[r14+-56],r2
	store	r1,[r2]
! FOR STATEMENT...
	mov	216,r13		! source line 216
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_117 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-52]
!   Calculate and save the FOR-LOOP ending value
!   _temp_118 = 10 + i		(int)
	mov	10,r1
	load	[r14+-76],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-48]
!   Initialize FOR-LOOP index variable
!   Data Move: j = _temp_117  (sizeInBytes=4)
	load	[r14+-52],r1
	store	r1,[r14+-80]
_Label_113:
!   Perform the FOR-LOOP termination test
!   if j > _temp_118 then goto _Label_116		
	load	[r14+-80],r1
	load	[r14+-48],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_116
_Label_114:
	mov	216,r13		! source line 216
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	217,r13		! source line 217
	mov	"\0\0SE",r10
!   if intIsZero (_P_Kernel_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Yield
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_115:
!   j = j + 1
	load	[r14+-80],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-80]
	jmp	_Label_113
! END FOR
_Label_116:
! IF STATEMENT...
	mov	219,r13		! source line 219
	mov	"\0\0IF",r10
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-88],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_122 = th + 12
	load	[r14+-88],r1
	add	r1,12,r1
	store	r1,[r14+-40]
!   Move address of _temp_122 [0 ] into _temp_123
!     make sure index expr is >= 0
	mov	0,r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+-40],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	4,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-36]
!   Data Move: _temp_121 = *_temp_123  (sizeInBytes=4)
	load	[r14+-36],r1
	load	[r1],r1
	store	r1,[r14+-44]
!   if e == _temp_121 then goto _Label_120		(int)
	load	[r14+-84],r1
	load	[r14+-44],r2
	cmp	r1,r2
	be	_Label_120
!	_Label_119	jmp	_Label_119
_Label_119:
! THEN...
	mov	220,r13		! source line 220
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_124 = _StringConst_6
	set	_StringConst_6,r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_124  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	220,r13		! source line 220
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_120:
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=46  sizeInBytes=1
	mov	46,r1
	storeb	r1,[r15+0]
!   Call the function
	mov	222,r13		! source line 222
	mov	"\0\0CE",r10
	call	printChar
! SEND STATEMENT...
	mov	223,r13		! source line 223
	mov	"\0\0SE",r10
!   _temp_125 = &_P_Kernel_threadManager
	set	_P_Kernel_threadManager,r1
	store	r1,[r14+-28]
!   Prepare Argument: offset=12  value=th  sizeInBytes=4
	load	[r14+-88],r1
	store	r1,[r15+4]
!   Send message FreeThread
	load	[r14+-28],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
! FOR STATEMENT...
	mov	224,r13		! source line 224
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_130 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-24]
!   Calculate and save the FOR-LOOP ending value
!   _temp_131 = 10 - i		(int)
	mov	10,r1
	load	[r14+-76],r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-20]
!   Initialize FOR-LOOP index variable
!   Data Move: j = _temp_130  (sizeInBytes=4)
	load	[r14+-24],r1
	store	r1,[r14+-80]
_Label_126:
!   Perform the FOR-LOOP termination test
!   if j > _temp_131 then goto _Label_129		
	load	[r14+-80],r1
	load	[r14+-20],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_129
_Label_127:
	mov	224,r13		! source line 224
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	225,r13		! source line 225
	mov	"\0\0SE",r10
!   if intIsZero (_P_Kernel_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Yield
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_128:
!   j = j + 1
	load	[r14+-80],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-80]
	jmp	_Label_126
! END FOR
_Label_129:
!   Increment the FOR-LOOP index variable and jump back
_Label_106:
!   i = i + 1
	load	[r14+-76],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-76]
	jmp	_Label_104
! END FOR
_Label_107:
! SEND STATEMENT...
	mov	228,r13		! source line 228
	mov	"\0\0SE",r10
!   _temp_132 = &_Global_allDone
	set	_Global_allDone,r1
	store	r1,[r14+-16]
!   Send message Up
	load	[r14+-16],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
! SEND STATEMENT...
	mov	229,r13		! source line 229
	mov	"\0\0SE",r10
!   _temp_133 = &_Global_freeze
	set	_Global_freeze,r1
	store	r1,[r14+-12]
!   Send message Down
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! RETURN STATEMENT...
	mov	229,r13		! source line 229
	mov	"\0\0RE",r10
	add	r15,92,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_31_TestThreadManager:
	.word	_sourceFileName
	.word	_Label_134
	.word	4		! total size of parameters
	.word	88		! frame size = 88
	.word	_Label_135
	.word	8
	.word	4
	.word	_Label_136
	.word	-12
	.word	4
	.word	_Label_137
	.word	-16
	.word	4
	.word	_Label_138
	.word	-20
	.word	4
	.word	_Label_139
	.word	-24
	.word	4
	.word	_Label_140
	.word	-28
	.word	4
	.word	_Label_141
	.word	-32
	.word	4
	.word	_Label_142
	.word	-36
	.word	4
	.word	_Label_143
	.word	-40
	.word	4
	.word	_Label_144
	.word	-44
	.word	4
	.word	_Label_145
	.word	-48
	.word	4
	.word	_Label_146
	.word	-52
	.word	4
	.word	_Label_147
	.word	-56
	.word	4
	.word	_Label_148
	.word	-60
	.word	4
	.word	_Label_149
	.word	-64
	.word	4
	.word	_Label_150
	.word	-68
	.word	4
	.word	_Label_151
	.word	-72
	.word	4
	.word	_Label_152
	.word	-76
	.word	4
	.word	_Label_153
	.word	-80
	.word	4
	.word	_Label_154
	.word	-84
	.word	4
	.word	_Label_155
	.word	-88
	.word	4
	.word	0
_Label_134:
	.ascii	"TestThreadManager\0"
	.align
_Label_135:
	.byte	'I'
	.ascii	"myID\0"
	.align
_Label_136:
	.byte	'?'
	.ascii	"_temp_133\0"
	.align
_Label_137:
	.byte	'?'
	.ascii	"_temp_132\0"
	.align
_Label_138:
	.byte	'?'
	.ascii	"_temp_131\0"
	.align
_Label_139:
	.byte	'?'
	.ascii	"_temp_130\0"
	.align
_Label_140:
	.byte	'?'
	.ascii	"_temp_125\0"
	.align
_Label_141:
	.byte	'?'
	.ascii	"_temp_124\0"
	.align
_Label_142:
	.byte	'?'
	.ascii	"_temp_123\0"
	.align
_Label_143:
	.byte	'?'
	.ascii	"_temp_122\0"
	.align
_Label_144:
	.byte	'?'
	.ascii	"_temp_121\0"
	.align
_Label_145:
	.byte	'?'
	.ascii	"_temp_118\0"
	.align
_Label_146:
	.byte	'?'
	.ascii	"_temp_117\0"
	.align
_Label_147:
	.byte	'?'
	.ascii	"_temp_112\0"
	.align
_Label_148:
	.byte	'?'
	.ascii	"_temp_111\0"
	.align
_Label_149:
	.byte	'?'
	.ascii	"_temp_110\0"
	.align
_Label_150:
	.byte	'?'
	.ascii	"_temp_109\0"
	.align
_Label_151:
	.byte	'?'
	.ascii	"_temp_108\0"
	.align
_Label_152:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_153:
	.byte	'I'
	.ascii	"j\0"
	.align
_Label_154:
	.byte	'I'
	.ascii	"e\0"
	.align
_Label_155:
	.byte	'P'
	.ascii	"th\0"
	.align
! 
! ===============  FUNCTION RunProcessManagerTests  ===============
! 
_function_30_RunProcessManagerTests:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_30_RunProcessManagerTests,r1
	push	r1
	mov	21,r1
_Label_524:
	push	r0
	sub	r1,1,r1
	bne	_Label_524
	mov	249,r13		! source line 249
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! SEND STATEMENT...
	mov	253,r13		! source line 253
	mov	"\0\0SE",r10
!   _temp_156 = &_Global_allDone
	set	_Global_allDone,r1
	store	r1,[r14+-72]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-72],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	254,r13		! source line 254
	mov	"\0\0SE",r10
!   _temp_157 = &_Global_freeze
	set	_Global_freeze,r1
	store	r1,[r14+-68]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-68],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	255,r13		! source line 255
	mov	"\0\0SE",r10
!   _temp_158 = &_Global_uniqueNumberLock
	set	_Global_uniqueNumberLock,r1
	store	r1,[r14+-64]
!   Send message Init
	load	[r14+-64],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	256,r13		! source line 256
	mov	"\0\0AS",r10
!   _Global_nextUnique = 1		(4 bytes)
	mov	1,r1
	set	_Global_nextUnique,r2
	store	r1,[r2]
! CALL STATEMENT...
!   _temp_159 = _StringConst_7
	set	_StringConst_7,r1
	store	r1,[r14+-60]
!   Prepare Argument: offset=8  value=_temp_159  sizeInBytes=4
	load	[r14+-60],r1
	store	r1,[r15+0]
!   Call the function
	mov	258,r13		! source line 258
	mov	"\0\0CE",r10
	call	print
! FOR STATEMENT...
	mov	260,r13		! source line 260
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_164 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-56]
!   Calculate and save the FOR-LOOP ending value
!   _temp_165 = 20		(4 bytes)
	mov	20,r1
	store	r1,[r14+-52]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_164  (sizeInBytes=4)
	load	[r14+-56],r1
	store	r1,[r14+-76]
_Label_160:
!   Perform the FOR-LOOP termination test
!   if i > _temp_165 then goto _Label_163		
	load	[r14+-76],r1
	load	[r14+-52],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_163
_Label_161:
	mov	260,r13		! source line 260
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	261,r13		! source line 261
	mov	"\0\0AS",r10
!   ALLOC CLASS Constructor...
!   Call alloc...
	mov	4164,r1
	store	r1,[r14+-48]
!   th = alloc (_temp_166)
	load	[r14+-48],r1
	call	_heapAlloc
	store	r1,[r14+-80]
!   ZeroMemory: *th = zeros  (sizeInBytes=4164)
	load	[r14+-80],r4
	mov	1041,r3
_Label_525:
	store	r0,[r4]
	add	r4,4,r4
	sub	r3,1,r3
	bne	_Label_525
!   *th = _P_Kernel_Thread
	set	_P_Kernel_Thread,r1
	load	[r14+-80],r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	262,r13		! source line 262
	mov	"\0\0SE",r10
!   _temp_168 = _StringConst_8
	set	_StringConst_8,r1
	store	r1,[r14+-40]
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-80],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=_temp_168  sizeInBytes=4
	load	[r14+-40],r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-80],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	263,r13		! source line 263
	mov	"\0\0SE",r10
!   _temp_169 = _function_29_TestProcessManager
	set	_function_29_TestProcessManager,r1
	store	r1,[r14+-36]
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-80],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=_temp_169  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=i  sizeInBytes=4
	load	[r14+-76],r1
	store	r1,[r15+8]
!   Send message Fork
	load	[r14+-80],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_162:
!   i = i + 1
	load	[r14+-76],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-76]
	jmp	_Label_160
! END FOR
_Label_163:
! FOR STATEMENT...
	mov	268,r13		! source line 268
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_174 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-32]
!   Calculate and save the FOR-LOOP ending value
!   _temp_175 = 20		(4 bytes)
	mov	20,r1
	store	r1,[r14+-28]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_174  (sizeInBytes=4)
	load	[r14+-32],r1
	store	r1,[r14+-76]
_Label_170:
!   Perform the FOR-LOOP termination test
!   if i > _temp_175 then goto _Label_173		
	load	[r14+-76],r1
	load	[r14+-28],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_173
_Label_171:
	mov	268,r13		! source line 268
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	269,r13		! source line 269
	mov	"\0\0SE",r10
!   _temp_176 = &_Global_allDone
	set	_Global_allDone,r1
	store	r1,[r14+-24]
!   Send message Down
	load	[r14+-24],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_172:
!   i = i + 1
	load	[r14+-76],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-76]
	jmp	_Label_170
! END FOR
_Label_173:
! IF STATEMENT...
	mov	272,r13		! source line 272
	mov	"\0\0IF",r10
!   Prepare Argument: offset=8  value=1  sizeInBytes=4
	mov	1,r1
	store	r1,[r15+0]
!   Call the function
	mov	272,r13		! source line 272
	mov	"\0\0CA",r10
	call	_function_33_GetUniqueNumber
!   Retrieve Result: targetName=_temp_179  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-20]
!   if _temp_179 == 401 then goto _Label_178		(int)
	load	[r14+-20],r1
	mov	401,r2
	cmp	r1,r2
	be	_Label_178
!	_Label_177	jmp	_Label_177
_Label_177:
! THEN...
	mov	273,r13		! source line 273
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_180 = _StringConst_9
	set	_StringConst_9,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_180  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	273,r13		! source line 273
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_178:
! CALL STATEMENT...
!   _temp_181 = _StringConst_10
	set	_StringConst_10,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_181  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	275,r13		! source line 275
	mov	"\0\0CE",r10
	call	print
! RETURN STATEMENT...
	mov	275,r13		! source line 275
	mov	"\0\0RE",r10
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_30_RunProcessManagerTests:
	.word	_sourceFileName
	.word	_Label_182
	.word	0		! total size of parameters
	.word	84		! frame size = 84
	.word	_Label_183
	.word	-12
	.word	4
	.word	_Label_184
	.word	-16
	.word	4
	.word	_Label_185
	.word	-20
	.word	4
	.word	_Label_186
	.word	-24
	.word	4
	.word	_Label_187
	.word	-28
	.word	4
	.word	_Label_188
	.word	-32
	.word	4
	.word	_Label_189
	.word	-36
	.word	4
	.word	_Label_190
	.word	-40
	.word	4
	.word	_Label_191
	.word	-44
	.word	4
	.word	_Label_192
	.word	-48
	.word	4
	.word	_Label_193
	.word	-52
	.word	4
	.word	_Label_194
	.word	-56
	.word	4
	.word	_Label_195
	.word	-60
	.word	4
	.word	_Label_196
	.word	-64
	.word	4
	.word	_Label_197
	.word	-68
	.word	4
	.word	_Label_198
	.word	-72
	.word	4
	.word	_Label_199
	.word	-76
	.word	4
	.word	_Label_200
	.word	-80
	.word	4
	.word	0
_Label_182:
	.ascii	"RunProcessManagerTests\0"
	.align
_Label_183:
	.byte	'?'
	.ascii	"_temp_181\0"
	.align
_Label_184:
	.byte	'?'
	.ascii	"_temp_180\0"
	.align
_Label_185:
	.byte	'?'
	.ascii	"_temp_179\0"
	.align
_Label_186:
	.byte	'?'
	.ascii	"_temp_176\0"
	.align
_Label_187:
	.byte	'?'
	.ascii	"_temp_175\0"
	.align
_Label_188:
	.byte	'?'
	.ascii	"_temp_174\0"
	.align
_Label_189:
	.byte	'?'
	.ascii	"_temp_169\0"
	.align
_Label_190:
	.byte	'?'
	.ascii	"_temp_168\0"
	.align
_Label_191:
	.byte	'?'
	.ascii	"_temp_167\0"
	.align
_Label_192:
	.byte	'?'
	.ascii	"_temp_166\0"
	.align
_Label_193:
	.byte	'?'
	.ascii	"_temp_165\0"
	.align
_Label_194:
	.byte	'?'
	.ascii	"_temp_164\0"
	.align
_Label_195:
	.byte	'?'
	.ascii	"_temp_159\0"
	.align
_Label_196:
	.byte	'?'
	.ascii	"_temp_158\0"
	.align
_Label_197:
	.byte	'?'
	.ascii	"_temp_157\0"
	.align
_Label_198:
	.byte	'?'
	.ascii	"_temp_156\0"
	.align
_Label_199:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_200:
	.byte	'P'
	.ascii	"th\0"
	.align
! 
! ===============  FUNCTION TestProcessManager  ===============
! 
_function_29_TestProcessManager:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_29_TestProcessManager,r1
	push	r1
	mov	20,r1
_Label_526:
	push	r0
	sub	r1,1,r1
	bne	_Label_526
	mov	288,r13		! source line 288
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! FOR STATEMENT...
	mov	292,r13		! source line 292
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_205 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-64]
!   Calculate and save the FOR-LOOP ending value
!   _temp_206 = 20		(4 bytes)
	mov	20,r1
	store	r1,[r14+-60]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_205  (sizeInBytes=4)
	load	[r14+-64],r1
	store	r1,[r14+-68]
_Label_201:
!   Perform the FOR-LOOP termination test
!   if i > _temp_206 then goto _Label_204		
	load	[r14+-68],r1
	load	[r14+-60],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_204
_Label_202:
	mov	292,r13		! source line 292
	mov	"\0\0FB",r10
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=myID  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	293,r13		! source line 293
	mov	"\0\0CE",r10
	call	printInt
! ASSIGNMENT STATEMENT...
	mov	294,r13		! source line 294
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=1  sizeInBytes=4
	mov	1,r1
	store	r1,[r15+0]
!   Call the function
	mov	294,r13		! source line 294
	mov	"\0\0CA",r10
	call	_function_33_GetUniqueNumber
!   Retrieve Result: targetName=e  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-76]
! ASSIGNMENT STATEMENT...
	mov	295,r13		! source line 295
	mov	"\0\0AS",r10
	mov	295,r13		! source line 295
	mov	"\0\0SE",r10
!   _temp_207 = &_P_Kernel_processManager
	set	_P_Kernel_processManager,r1
	store	r1,[r14+-56]
!   Send message GetANewProcess
	load	[r14+-56],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
!   Retrieve Result: targetName=pcb  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-80]
! ASSIGNMENT STATEMENT...
	mov	296,r13		! source line 296
	mov	"\0\0AS",r10
!   if intIsZero (pcb) then goto _runtimeErrorNullPointer
	load	[r14+-80],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_208 = pcb + 28
	load	[r14+-80],r1
	add	r1,28,r1
	store	r1,[r14+-52]
!   Data Move: *_temp_208 = e  (sizeInBytes=4)
	load	[r14+-76],r1
	load	[r14+-52],r2
	store	r1,[r2]
! FOR STATEMENT...
	mov	297,r13		! source line 297
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_213 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-48]
!   Calculate and save the FOR-LOOP ending value
!   _temp_214 = 10 + i		(int)
	mov	10,r1
	load	[r14+-68],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-44]
!   Initialize FOR-LOOP index variable
!   Data Move: j = _temp_213  (sizeInBytes=4)
	load	[r14+-48],r1
	store	r1,[r14+-72]
_Label_209:
!   Perform the FOR-LOOP termination test
!   if j > _temp_214 then goto _Label_212		
	load	[r14+-72],r1
	load	[r14+-44],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_212
_Label_210:
	mov	297,r13		! source line 297
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	298,r13		! source line 298
	mov	"\0\0SE",r10
!   if intIsZero (_P_Kernel_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Yield
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_211:
!   j = j + 1
	load	[r14+-72],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-72]
	jmp	_Label_209
! END FOR
_Label_212:
! IF STATEMENT...
	mov	300,r13		! source line 300
	mov	"\0\0IF",r10
!   if intIsZero (pcb) then goto _runtimeErrorNullPointer
	load	[r14+-80],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_218 = pcb + 28
	load	[r14+-80],r1
	add	r1,28,r1
	store	r1,[r14+-36]
!   Data Move: _temp_217 = *_temp_218  (sizeInBytes=4)
	load	[r14+-36],r1
	load	[r1],r1
	store	r1,[r14+-40]
!   if e == _temp_217 then goto _Label_216		(int)
	load	[r14+-76],r1
	load	[r14+-40],r2
	cmp	r1,r2
	be	_Label_216
!	_Label_215	jmp	_Label_215
_Label_215:
! THEN...
	mov	301,r13		! source line 301
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_219 = _StringConst_11
	set	_StringConst_11,r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_219  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	301,r13		! source line 301
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_216:
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=46  sizeInBytes=1
	mov	46,r1
	storeb	r1,[r15+0]
!   Call the function
	mov	303,r13		! source line 303
	mov	"\0\0CE",r10
	call	printChar
! SEND STATEMENT...
	mov	304,r13		! source line 304
	mov	"\0\0SE",r10
!   _temp_220 = &_P_Kernel_processManager
	set	_P_Kernel_processManager,r1
	store	r1,[r14+-28]
!   Prepare Argument: offset=12  value=pcb  sizeInBytes=4
	load	[r14+-80],r1
	store	r1,[r15+4]
!   Send message FreeProcess
	load	[r14+-28],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,20,r2
	call	r2
! FOR STATEMENT...
	mov	305,r13		! source line 305
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_225 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-24]
!   Calculate and save the FOR-LOOP ending value
!   _temp_226 = 10 - i		(int)
	mov	10,r1
	load	[r14+-68],r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-20]
!   Initialize FOR-LOOP index variable
!   Data Move: j = _temp_225  (sizeInBytes=4)
	load	[r14+-24],r1
	store	r1,[r14+-72]
_Label_221:
!   Perform the FOR-LOOP termination test
!   if j > _temp_226 then goto _Label_224		
	load	[r14+-72],r1
	load	[r14+-20],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_224
_Label_222:
	mov	305,r13		! source line 305
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	306,r13		! source line 306
	mov	"\0\0SE",r10
!   if intIsZero (_P_Kernel_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Yield
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_223:
!   j = j + 1
	load	[r14+-72],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-72]
	jmp	_Label_221
! END FOR
_Label_224:
!   Increment the FOR-LOOP index variable and jump back
_Label_203:
!   i = i + 1
	load	[r14+-68],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-68]
	jmp	_Label_201
! END FOR
_Label_204:
! SEND STATEMENT...
	mov	309,r13		! source line 309
	mov	"\0\0SE",r10
!   _temp_227 = &_Global_allDone
	set	_Global_allDone,r1
	store	r1,[r14+-16]
!   Send message Up
	load	[r14+-16],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
! SEND STATEMENT...
	mov	310,r13		! source line 310
	mov	"\0\0SE",r10
!   _temp_228 = &_Global_freeze
	set	_Global_freeze,r1
	store	r1,[r14+-12]
!   Send message Down
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! RETURN STATEMENT...
	mov	310,r13		! source line 310
	mov	"\0\0RE",r10
	add	r15,84,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_29_TestProcessManager:
	.word	_sourceFileName
	.word	_Label_229
	.word	4		! total size of parameters
	.word	80		! frame size = 80
	.word	_Label_230
	.word	8
	.word	4
	.word	_Label_231
	.word	-12
	.word	4
	.word	_Label_232
	.word	-16
	.word	4
	.word	_Label_233
	.word	-20
	.word	4
	.word	_Label_234
	.word	-24
	.word	4
	.word	_Label_235
	.word	-28
	.word	4
	.word	_Label_236
	.word	-32
	.word	4
	.word	_Label_237
	.word	-36
	.word	4
	.word	_Label_238
	.word	-40
	.word	4
	.word	_Label_239
	.word	-44
	.word	4
	.word	_Label_240
	.word	-48
	.word	4
	.word	_Label_241
	.word	-52
	.word	4
	.word	_Label_242
	.word	-56
	.word	4
	.word	_Label_243
	.word	-60
	.word	4
	.word	_Label_244
	.word	-64
	.word	4
	.word	_Label_245
	.word	-68
	.word	4
	.word	_Label_246
	.word	-72
	.word	4
	.word	_Label_247
	.word	-76
	.word	4
	.word	_Label_248
	.word	-80
	.word	4
	.word	0
_Label_229:
	.ascii	"TestProcessManager\0"
	.align
_Label_230:
	.byte	'I'
	.ascii	"myID\0"
	.align
_Label_231:
	.byte	'?'
	.ascii	"_temp_228\0"
	.align
_Label_232:
	.byte	'?'
	.ascii	"_temp_227\0"
	.align
_Label_233:
	.byte	'?'
	.ascii	"_temp_226\0"
	.align
_Label_234:
	.byte	'?'
	.ascii	"_temp_225\0"
	.align
_Label_235:
	.byte	'?'
	.ascii	"_temp_220\0"
	.align
_Label_236:
	.byte	'?'
	.ascii	"_temp_219\0"
	.align
_Label_237:
	.byte	'?'
	.ascii	"_temp_218\0"
	.align
_Label_238:
	.byte	'?'
	.ascii	"_temp_217\0"
	.align
_Label_239:
	.byte	'?'
	.ascii	"_temp_214\0"
	.align
_Label_240:
	.byte	'?'
	.ascii	"_temp_213\0"
	.align
_Label_241:
	.byte	'?'
	.ascii	"_temp_208\0"
	.align
_Label_242:
	.byte	'?'
	.ascii	"_temp_207\0"
	.align
_Label_243:
	.byte	'?'
	.ascii	"_temp_206\0"
	.align
_Label_244:
	.byte	'?'
	.ascii	"_temp_205\0"
	.align
_Label_245:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_246:
	.byte	'I'
	.ascii	"j\0"
	.align
_Label_247:
	.byte	'I'
	.ascii	"e\0"
	.align
_Label_248:
	.byte	'P'
	.ascii	"pcb\0"
	.align
! 
! ===============  FUNCTION RunFrameManagerTests  ===============
! 
_function_28_RunFrameManagerTests:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_28_RunFrameManagerTests,r1
	push	r1
	mov	28,r1
_Label_527:
	push	r0
	sub	r1,1,r1
	bne	_Label_527
	mov	331,r13		! source line 331
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! SEND STATEMENT...
	mov	335,r13		! source line 335
	mov	"\0\0SE",r10
!   _temp_249 = &_Global_allDone2
	set	_Global_allDone2,r1
	store	r1,[r14+-96]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-96],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	336,r13		! source line 336
	mov	"\0\0SE",r10
!   _temp_250 = &_Global_freeze
	set	_Global_freeze,r1
	store	r1,[r14+-92]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-92],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! CALL STATEMENT...
!   _temp_251 = _StringConst_12
	set	_StringConst_12,r1
	store	r1,[r14+-88]
!   Prepare Argument: offset=8  value=_temp_251  sizeInBytes=4
	load	[r14+-88],r1
	store	r1,[r15+0]
!   Call the function
	mov	338,r13		! source line 338
	mov	"\0\0CE",r10
	call	print
! FOR STATEMENT...
	mov	340,r13		! source line 340
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_256 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-84]
!   Calculate and save the FOR-LOOP ending value
!   _temp_257 = 10		(4 bytes)
	mov	10,r1
	store	r1,[r14+-80]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_256  (sizeInBytes=4)
	load	[r14+-84],r1
	store	r1,[r14+-100]
_Label_252:
!   Perform the FOR-LOOP termination test
!   if i > _temp_257 then goto _Label_255		
	load	[r14+-100],r1
	load	[r14+-80],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_255
_Label_253:
	mov	340,r13		! source line 340
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	341,r13		! source line 341
	mov	"\0\0AS",r10
!   ALLOC CLASS Constructor...
!   Call alloc...
	mov	4164,r1
	store	r1,[r14+-76]
!   th = alloc (_temp_258)
	load	[r14+-76],r1
	call	_heapAlloc
	store	r1,[r14+-108]
!   ZeroMemory: *th = zeros  (sizeInBytes=4164)
	load	[r14+-108],r4
	mov	1041,r3
_Label_528:
	store	r0,[r4]
	add	r4,4,r4
	sub	r3,1,r3
	bne	_Label_528
!   *th = _P_Kernel_Thread
	set	_P_Kernel_Thread,r1
	load	[r14+-108],r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	342,r13		! source line 342
	mov	"\0\0SE",r10
!   _temp_260 = _StringConst_13
	set	_StringConst_13,r1
	store	r1,[r14+-68]
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-108],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=_temp_260  sizeInBytes=4
	load	[r14+-68],r1
	store	r1,[r15+4]
!   Send message Init
	load	[r14+-108],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,4,r2
	call	r2
! SEND STATEMENT...
	mov	343,r13		! source line 343
	mov	"\0\0SE",r10
!   _temp_261 = _function_27_TestFrameManager
	set	_function_27_TestFrameManager,r1
	store	r1,[r14+-64]
!   if intIsZero (th) then goto _runtimeErrorNullPointer
	load	[r14+-108],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=_temp_261  sizeInBytes=4
	load	[r14+-64],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=i  sizeInBytes=4
	load	[r14+-100],r1
	store	r1,[r15+8]
!   Send message Fork
	load	[r14+-108],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_254:
!   i = i + 1
	load	[r14+-100],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-100]
	jmp	_Label_252
! END FOR
_Label_255:
! FOR STATEMENT...
	mov	348,r13		! source line 348
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_266 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-60]
!   Calculate and save the FOR-LOOP ending value
!   _temp_267 = 10		(4 bytes)
	mov	10,r1
	store	r1,[r14+-56]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_266  (sizeInBytes=4)
	load	[r14+-60],r1
	store	r1,[r14+-100]
_Label_262:
!   Perform the FOR-LOOP termination test
!   if i > _temp_267 then goto _Label_265		
	load	[r14+-100],r1
	load	[r14+-56],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_265
_Label_263:
	mov	348,r13		! source line 348
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	349,r13		! source line 349
	mov	"\0\0SE",r10
!   _temp_268 = &_Global_allDone2
	set	_Global_allDone2,r1
	store	r1,[r14+-52]
!   Send message Down
	load	[r14+-52],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_264:
!   i = i + 1
	load	[r14+-100],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-100]
	jmp	_Label_262
! END FOR
_Label_265:
! CALL STATEMENT...
!   _temp_269 = _StringConst_14
	set	_StringConst_14,r1
	store	r1,[r14+-48]
!   Prepare Argument: offset=8  value=_temp_269  sizeInBytes=4
	load	[r14+-48],r1
	store	r1,[r15+0]
!   Call the function
	mov	352,r13		! source line 352
	mov	"\0\0CE",r10
	call	print
! FOR STATEMENT...
	mov	353,r13		! source line 353
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_274 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-44]
!   Calculate and save the FOR-LOOP ending value
!   _temp_275 = 34		(4 bytes)
	mov	34,r1
	store	r1,[r14+-40]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_274  (sizeInBytes=4)
	load	[r14+-44],r1
	store	r1,[r14+-100]
_Label_270:
!   Perform the FOR-LOOP termination test
!   if i > _temp_275 then goto _Label_273		
	load	[r14+-100],r1
	load	[r14+-40],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_273
_Label_271:
	mov	353,r13		! source line 353
	mov	"\0\0FB",r10
! CALL STATEMENT...
!   _temp_276 = _StringConst_15
	set	_StringConst_15,r1
	store	r1,[r14+-36]
!   Prepare Argument: offset=8  value=_temp_276  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Call the function
	mov	354,r13		! source line 354
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=i  sizeInBytes=4
	load	[r14+-100],r1
	store	r1,[r15+0]
!   Call the function
	mov	355,r13		! source line 355
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   _temp_277 = _StringConst_16
	set	_StringConst_16,r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_277  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	356,r13		! source line 356
	mov	"\0\0CE",r10
	call	print
! FOR STATEMENT...
	mov	357,r13		! source line 357
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_282 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-28]
!   Calculate and save the FOR-LOOP ending value
!   _temp_284 = &_Global_histogram
	set	_Global_histogram,r1
	store	r1,[r14+-20]
!   Move address of _temp_284 [i ] into _temp_285
!     make sure index expr is >= 0
	load	[r14+-100],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+-20],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	4,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-16]
!   Data Move: _temp_283 = *_temp_285  (sizeInBytes=4)
	load	[r14+-16],r1
	load	[r1],r1
	store	r1,[r14+-24]
!   Initialize FOR-LOOP index variable
!   Data Move: j = _temp_282  (sizeInBytes=4)
	load	[r14+-28],r1
	store	r1,[r14+-104]
_Label_278:
!   Perform the FOR-LOOP termination test
!   if j > _temp_283 then goto _Label_281		
	load	[r14+-104],r1
	load	[r14+-24],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_281
_Label_279:
	mov	357,r13		! source line 357
	mov	"\0\0FB",r10
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=42  sizeInBytes=1
	mov	42,r1
	storeb	r1,[r15+0]
!   Call the function
	mov	358,r13		! source line 358
	mov	"\0\0CE",r10
	call	printChar
!   Increment the FOR-LOOP index variable and jump back
_Label_280:
!   j = j + 1
	load	[r14+-104],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-104]
	jmp	_Label_278
! END FOR
_Label_281:
! CALL STATEMENT...
!   Call the function
	mov	360,r13		! source line 360
	mov	"\0\0CA",r10
	call	_P_System_nl
!   Increment the FOR-LOOP index variable and jump back
_Label_272:
!   i = i + 1
	load	[r14+-100],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-100]
	jmp	_Label_270
! END FOR
_Label_273:
! CALL STATEMENT...
!   _temp_286 = _StringConst_17
	set	_StringConst_17,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_286  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	363,r13		! source line 363
	mov	"\0\0CE",r10
	call	print
! RETURN STATEMENT...
	mov	363,r13		! source line 363
	mov	"\0\0RE",r10
	add	r15,116,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_28_RunFrameManagerTests:
	.word	_sourceFileName
	.word	_Label_287
	.word	0		! total size of parameters
	.word	112		! frame size = 112
	.word	_Label_288
	.word	-12
	.word	4
	.word	_Label_289
	.word	-16
	.word	4
	.word	_Label_290
	.word	-20
	.word	4
	.word	_Label_291
	.word	-24
	.word	4
	.word	_Label_292
	.word	-28
	.word	4
	.word	_Label_293
	.word	-32
	.word	4
	.word	_Label_294
	.word	-36
	.word	4
	.word	_Label_295
	.word	-40
	.word	4
	.word	_Label_296
	.word	-44
	.word	4
	.word	_Label_297
	.word	-48
	.word	4
	.word	_Label_298
	.word	-52
	.word	4
	.word	_Label_299
	.word	-56
	.word	4
	.word	_Label_300
	.word	-60
	.word	4
	.word	_Label_301
	.word	-64
	.word	4
	.word	_Label_302
	.word	-68
	.word	4
	.word	_Label_303
	.word	-72
	.word	4
	.word	_Label_304
	.word	-76
	.word	4
	.word	_Label_305
	.word	-80
	.word	4
	.word	_Label_306
	.word	-84
	.word	4
	.word	_Label_307
	.word	-88
	.word	4
	.word	_Label_308
	.word	-92
	.word	4
	.word	_Label_309
	.word	-96
	.word	4
	.word	_Label_310
	.word	-100
	.word	4
	.word	_Label_311
	.word	-104
	.word	4
	.word	_Label_312
	.word	-108
	.word	4
	.word	0
_Label_287:
	.ascii	"RunFrameManagerTests\0"
	.align
_Label_288:
	.byte	'?'
	.ascii	"_temp_286\0"
	.align
_Label_289:
	.byte	'?'
	.ascii	"_temp_285\0"
	.align
_Label_290:
	.byte	'?'
	.ascii	"_temp_284\0"
	.align
_Label_291:
	.byte	'?'
	.ascii	"_temp_283\0"
	.align
_Label_292:
	.byte	'?'
	.ascii	"_temp_282\0"
	.align
_Label_293:
	.byte	'?'
	.ascii	"_temp_277\0"
	.align
_Label_294:
	.byte	'?'
	.ascii	"_temp_276\0"
	.align
_Label_295:
	.byte	'?'
	.ascii	"_temp_275\0"
	.align
_Label_296:
	.byte	'?'
	.ascii	"_temp_274\0"
	.align
_Label_297:
	.byte	'?'
	.ascii	"_temp_269\0"
	.align
_Label_298:
	.byte	'?'
	.ascii	"_temp_268\0"
	.align
_Label_299:
	.byte	'?'
	.ascii	"_temp_267\0"
	.align
_Label_300:
	.byte	'?'
	.ascii	"_temp_266\0"
	.align
_Label_301:
	.byte	'?'
	.ascii	"_temp_261\0"
	.align
_Label_302:
	.byte	'?'
	.ascii	"_temp_260\0"
	.align
_Label_303:
	.byte	'?'
	.ascii	"_temp_259\0"
	.align
_Label_304:
	.byte	'?'
	.ascii	"_temp_258\0"
	.align
_Label_305:
	.byte	'?'
	.ascii	"_temp_257\0"
	.align
_Label_306:
	.byte	'?'
	.ascii	"_temp_256\0"
	.align
_Label_307:
	.byte	'?'
	.ascii	"_temp_251\0"
	.align
_Label_308:
	.byte	'?'
	.ascii	"_temp_250\0"
	.align
_Label_309:
	.byte	'?'
	.ascii	"_temp_249\0"
	.align
_Label_310:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_311:
	.byte	'I'
	.ascii	"j\0"
	.align
_Label_312:
	.byte	'P'
	.ascii	"th\0"
	.align
! 
! ===============  FUNCTION TestFrameManager  ===============
! 
_function_27_TestFrameManager:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_27_TestFrameManager,r1
	push	r1
	mov	45,r1
_Label_529:
	push	r0
	sub	r1,1,r1
	bne	_Label_529
	mov	389,r13		! source line 389
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	394,r13		! source line 394
	mov	"\0\0AS",r10
	mov	394,r13		! source line 394
	mov	"\0\0SE",r10
!   _temp_313 = &_P_Kernel_processManager
	set	_P_Kernel_processManager,r1
	store	r1,[r14+-148]
!   Send message GetANewProcess
	load	[r14+-148],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
!   Retrieve Result: targetName=pcb  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-176]
! FOR STATEMENT...
	mov	395,r13		! source line 395
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_318 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-144]
!   Calculate and save the FOR-LOOP ending value
!   _temp_319 = 5		(4 bytes)
	mov	5,r1
	store	r1,[r14+-140]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_318  (sizeInBytes=4)
	load	[r14+-144],r1
	store	r1,[r14+-152]
_Label_314:
!   Perform the FOR-LOOP termination test
!   if i > _temp_319 then goto _Label_317		
	load	[r14+-152],r1
	load	[r14+-140],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_317
_Label_315:
	mov	395,r13		! source line 395
	mov	"\0\0FB",r10
! FOR STATEMENT...
	mov	396,r13		! source line 396
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_324 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-136]
!   Calculate and save the FOR-LOOP ending value
!   _temp_325 = 24		(4 bytes)
	mov	24,r1
	store	r1,[r14+-132]
!   Initialize FOR-LOOP index variable
!   Data Move: sz = _temp_324  (sizeInBytes=4)
	load	[r14+-136],r1
	store	r1,[r14+-164]
_Label_320:
!   Perform the FOR-LOOP termination test
!   if sz > _temp_325 then goto _Label_323		
	load	[r14+-164],r1
	load	[r14+-132],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_323
_Label_321:
	mov	396,r13		! source line 396
	mov	"\0\0FB",r10
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=myID  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	397,r13		! source line 397
	mov	"\0\0CE",r10
	call	printInt
! ASSIGNMENT STATEMENT...
	mov	398,r13		! source line 398
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=sz  sizeInBytes=4
	load	[r14+-164],r1
	store	r1,[r15+0]
!   Call the function
	mov	398,r13		! source line 398
	mov	"\0\0CA",r10
	call	_function_33_GetUniqueNumber
!   Retrieve Result: targetName=newData  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-160]
! IF STATEMENT...
	mov	399,r13		! source line 399
	mov	"\0\0IF",r10
!   if _Global_testPutAFrame then goto _Label_326 else goto _Label_327
	set	_Global_testPutAFrame,r1
	loadb	[r1],r1
	cmp	r1,0
	be	_Label_327
	jmp	_Label_326
_Label_326:
! THEN...
	mov	400,r13		! source line 400
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	400,r13		! source line 400
	mov	"\0\0AS",r10
	mov	400,r13		! source line 400
	mov	"\0\0SE",r10
!   _temp_328 = &_P_Kernel_frameManager
	set	_P_Kernel_frameManager,r1
	store	r1,[r14+-128]
!   Send message GetAFrame
	load	[r14+-128],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=singlePage  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-168]
! ASSIGNMENT STATEMENT...
	mov	401,r13		! source line 401
	mov	"\0\0AS",r10
!   if intIsZero (singlePage) then goto _runtimeErrorNullPointer
	load	[r14+-168],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_329 = newData + 1		(int)
	load	[r14+-160],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-124]
!   Data Move: *singlePage = _temp_329  (sizeInBytes=4)
	load	[r14+-124],r1
	load	[r14+-168],r2
	store	r1,[r2]
! ASSIGNMENT STATEMENT...
	mov	402,r13		! source line 402
	mov	"\0\0AS",r10
!   _temp_330 = singlePage - 1048576		(int)
	load	[r14+-168],r1
	set	1048576,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-120]
!   singlePgNo = _temp_330 div 8192		(int)
	load	[r14+-120],r1
	mov	8192,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	div	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-172]
! ASSIGNMENT STATEMENT...
	mov	404,r13		! source line 404
	mov	"\0\0AS",r10
!   _temp_331 = &_Global_histogram
	set	_Global_histogram,r1
	store	r1,[r14+-116]
!   Move address of _temp_331 [singlePgNo ] into _temp_332
!     make sure index expr is >= 0
	load	[r14+-172],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+-116],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	4,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-112]
!   _temp_335 = &_Global_histogram
	set	_Global_histogram,r1
	store	r1,[r14+-100]
!   Move address of _temp_335 [singlePgNo ] into _temp_336
!     make sure index expr is >= 0
	load	[r14+-172],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+-100],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	4,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-96]
!   Data Move: _temp_334 = *_temp_336  (sizeInBytes=4)
	load	[r14+-96],r1
	load	[r1],r1
	store	r1,[r14+-104]
!   _temp_333 = _temp_334 + 1		(int)
	load	[r14+-104],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-108]
!   Data Move: *_temp_332 = _temp_333  (sizeInBytes=4)
	load	[r14+-108],r1
	load	[r14+-112],r2
	store	r1,[r2]
! END IF...
_Label_327:
! SEND STATEMENT...
	mov	406,r13		! source line 406
	mov	"\0\0SE",r10
!   if intIsZero (pcb) then goto _runtimeErrorNullPointer
	load	[r14+-176],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_338 = pcb + 32
	load	[r14+-176],r1
	add	r1,32,r1
	store	r1,[r14+-88]
!   _temp_337 = _temp_338		(4 bytes)
	load	[r14+-88],r1
	store	r1,[r14+-92]
!   _temp_339 = &_P_Kernel_frameManager
	set	_P_Kernel_frameManager,r1
	store	r1,[r14+-84]
!   Prepare Argument: offset=12  value=_temp_337  sizeInBytes=4
	load	[r14+-92],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=sz  sizeInBytes=4
	load	[r14+-164],r1
	store	r1,[r15+8]
!   Send message GetNewFrames
	load	[r14+-84],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,20,r2
	call	r2
! CALL STATEMENT...
!   if intIsZero (pcb) then goto _runtimeErrorNullPointer
	load	[r14+-176],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_341 = pcb + 32
	load	[r14+-176],r1
	add	r1,32,r1
	store	r1,[r14+-76]
!   _temp_340 = _temp_341		(4 bytes)
	load	[r14+-76],r1
	store	r1,[r14+-80]
!   Prepare Argument: offset=8  value=_temp_340  sizeInBytes=4
	load	[r14+-80],r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=sz  sizeInBytes=4
	load	[r14+-164],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=newData  sizeInBytes=4
	load	[r14+-160],r1
	store	r1,[r15+8]
!   Call the function
	mov	407,r13		! source line 407
	mov	"\0\0CA",r10
	call	_function_26_CheckAddrSpace
! FOR STATEMENT...
	mov	408,r13		! source line 408
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_346 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-72]
!   Calculate and save the FOR-LOOP ending value
!   _temp_347 = 10 + i		(int)
	mov	10,r1
	load	[r14+-152],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-68]
!   Initialize FOR-LOOP index variable
!   Data Move: j = _temp_346  (sizeInBytes=4)
	load	[r14+-72],r1
	store	r1,[r14+-156]
_Label_342:
!   Perform the FOR-LOOP termination test
!   if j > _temp_347 then goto _Label_345		
	load	[r14+-156],r1
	load	[r14+-68],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_345
_Label_343:
	mov	408,r13		! source line 408
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	409,r13		! source line 409
	mov	"\0\0SE",r10
!   if intIsZero (_P_Kernel_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Yield
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_344:
!   j = j + 1
	load	[r14+-156],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-156]
	jmp	_Label_342
! END FOR
_Label_345:
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=46  sizeInBytes=1
	mov	46,r1
	storeb	r1,[r15+0]
!   Call the function
	mov	411,r13		! source line 411
	mov	"\0\0CE",r10
	call	printChar
! CALL STATEMENT...
!   if intIsZero (pcb) then goto _runtimeErrorNullPointer
	load	[r14+-176],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_349 = pcb + 32
	load	[r14+-176],r1
	add	r1,32,r1
	store	r1,[r14+-60]
!   _temp_348 = _temp_349		(4 bytes)
	load	[r14+-60],r1
	store	r1,[r14+-64]
!   Prepare Argument: offset=8  value=_temp_348  sizeInBytes=4
	load	[r14+-64],r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=sz  sizeInBytes=4
	load	[r14+-164],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=newData  sizeInBytes=4
	load	[r14+-160],r1
	store	r1,[r15+8]
!   Call the function
	mov	412,r13		! source line 412
	mov	"\0\0CA",r10
	call	_function_25_CheckAddrSpace2
! SEND STATEMENT...
	mov	413,r13		! source line 413
	mov	"\0\0SE",r10
!   if intIsZero (pcb) then goto _runtimeErrorNullPointer
	load	[r14+-176],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_351 = pcb + 32
	load	[r14+-176],r1
	add	r1,32,r1
	store	r1,[r14+-52]
!   _temp_350 = _temp_351		(4 bytes)
	load	[r14+-52],r1
	store	r1,[r14+-56]
!   _temp_352 = &_P_Kernel_frameManager
	set	_P_Kernel_frameManager,r1
	store	r1,[r14+-48]
!   Prepare Argument: offset=12  value=_temp_350  sizeInBytes=4
	load	[r14+-56],r1
	store	r1,[r15+4]
!   Send message ReturnAllFrames
	load	[r14+-48],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,24,r2
	call	r2
! FOR STATEMENT...
	mov	414,r13		! source line 414
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_357 = 1		(4 bytes)
	mov	1,r1
	store	r1,[r14+-44]
!   Calculate and save the FOR-LOOP ending value
!   _temp_358 = 10 - i		(int)
	mov	10,r1
	load	[r14+-152],r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-40]
!   Initialize FOR-LOOP index variable
!   Data Move: j = _temp_357  (sizeInBytes=4)
	load	[r14+-44],r1
	store	r1,[r14+-156]
_Label_353:
!   Perform the FOR-LOOP termination test
!   if j > _temp_358 then goto _Label_356		
	load	[r14+-156],r1
	load	[r14+-40],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_356
_Label_354:
	mov	414,r13		! source line 414
	mov	"\0\0FB",r10
! SEND STATEMENT...
	mov	415,r13		! source line 415
	mov	"\0\0SE",r10
!   if intIsZero (_P_Kernel_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Yield
	set	_P_Kernel_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Increment the FOR-LOOP index variable and jump back
_Label_355:
!   j = j + 1
	load	[r14+-156],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-156]
	jmp	_Label_353
! END FOR
_Label_356:
! IF STATEMENT...
	mov	417,r13		! source line 417
	mov	"\0\0IF",r10
!   if _Global_testPutAFrame then goto _Label_359 else goto _Label_360
	set	_Global_testPutAFrame,r1
	loadb	[r1],r1
	cmp	r1,0
	be	_Label_360
	jmp	_Label_359
_Label_359:
! THEN...
	mov	418,r13		! source line 418
	mov	"\0\0TN",r10
! IF STATEMENT...
	mov	418,r13		! source line 418
	mov	"\0\0IF",r10
!   if intIsZero (singlePage) then goto _runtimeErrorNullPointer
	load	[r14+-168],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_363 = *singlePage  (sizeInBytes=4)
	load	[r14+-168],r1
	load	[r1],r1
	store	r1,[r14+-36]
!   _temp_364 = newData + 1		(int)
	load	[r14+-160],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-32]
!   if _temp_363 == _temp_364 then goto _Label_362		(int)
	load	[r14+-36],r1
	load	[r14+-32],r2
	cmp	r1,r2
	be	_Label_362
!	_Label_361	jmp	_Label_361
_Label_361:
! THEN...
	mov	419,r13		! source line 419
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_365 = _StringConst_18
	set	_StringConst_18,r1
	store	r1,[r14+-28]
!   Prepare Argument: offset=8  value=_temp_365  sizeInBytes=4
	load	[r14+-28],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	419,r13		! source line 419
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_362:
! SEND STATEMENT...
	mov	421,r13		! source line 421
	mov	"\0\0SE",r10
!   _temp_366 = &_P_Kernel_frameManager
	set	_P_Kernel_frameManager,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=12  value=singlePage  sizeInBytes=4
	load	[r14+-168],r1
	store	r1,[r15+4]
!   Send message PutAFrame
	load	[r14+-24],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
! END IF...
_Label_360:
!   Increment the FOR-LOOP index variable and jump back
_Label_322:
!   sz = sz + 1
	load	[r14+-164],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-164]
	jmp	_Label_320
! END FOR
_Label_323:
!   Increment the FOR-LOOP index variable and jump back
_Label_316:
!   i = i + 1
	load	[r14+-152],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-152]
	jmp	_Label_314
! END FOR
_Label_317:
! SEND STATEMENT...
	mov	425,r13		! source line 425
	mov	"\0\0SE",r10
!   _temp_367 = &_Global_allDone2
	set	_Global_allDone2,r1
	store	r1,[r14+-20]
!   Send message Up
	load	[r14+-20],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
! SEND STATEMENT...
	mov	426,r13		! source line 426
	mov	"\0\0SE",r10
!   _temp_368 = &_P_Kernel_processManager
	set	_P_Kernel_processManager,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=12  value=pcb  sizeInBytes=4
	load	[r14+-176],r1
	store	r1,[r15+4]
!   Send message FreeProcess
	load	[r14+-16],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,20,r2
	call	r2
! SEND STATEMENT...
	mov	427,r13		! source line 427
	mov	"\0\0SE",r10
!   _temp_369 = &_Global_freeze
	set	_Global_freeze,r1
	store	r1,[r14+-12]
!   Send message Down
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! RETURN STATEMENT...
	mov	427,r13		! source line 427
	mov	"\0\0RE",r10
	add	r15,184,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_27_TestFrameManager:
	.word	_sourceFileName
	.word	_Label_370
	.word	4		! total size of parameters
	.word	180		! frame size = 180
	.word	_Label_371
	.word	8
	.word	4
	.word	_Label_372
	.word	-12
	.word	4
	.word	_Label_373
	.word	-16
	.word	4
	.word	_Label_374
	.word	-20
	.word	4
	.word	_Label_375
	.word	-24
	.word	4
	.word	_Label_376
	.word	-28
	.word	4
	.word	_Label_377
	.word	-32
	.word	4
	.word	_Label_378
	.word	-36
	.word	4
	.word	_Label_379
	.word	-40
	.word	4
	.word	_Label_380
	.word	-44
	.word	4
	.word	_Label_381
	.word	-48
	.word	4
	.word	_Label_382
	.word	-52
	.word	4
	.word	_Label_383
	.word	-56
	.word	4
	.word	_Label_384
	.word	-60
	.word	4
	.word	_Label_385
	.word	-64
	.word	4
	.word	_Label_386
	.word	-68
	.word	4
	.word	_Label_387
	.word	-72
	.word	4
	.word	_Label_388
	.word	-76
	.word	4
	.word	_Label_389
	.word	-80
	.word	4
	.word	_Label_390
	.word	-84
	.word	4
	.word	_Label_391
	.word	-88
	.word	4
	.word	_Label_392
	.word	-92
	.word	4
	.word	_Label_393
	.word	-96
	.word	4
	.word	_Label_394
	.word	-100
	.word	4
	.word	_Label_395
	.word	-104
	.word	4
	.word	_Label_396
	.word	-108
	.word	4
	.word	_Label_397
	.word	-112
	.word	4
	.word	_Label_398
	.word	-116
	.word	4
	.word	_Label_399
	.word	-120
	.word	4
	.word	_Label_400
	.word	-124
	.word	4
	.word	_Label_401
	.word	-128
	.word	4
	.word	_Label_402
	.word	-132
	.word	4
	.word	_Label_403
	.word	-136
	.word	4
	.word	_Label_404
	.word	-140
	.word	4
	.word	_Label_405
	.word	-144
	.word	4
	.word	_Label_406
	.word	-148
	.word	4
	.word	_Label_407
	.word	-152
	.word	4
	.word	_Label_408
	.word	-156
	.word	4
	.word	_Label_409
	.word	-160
	.word	4
	.word	_Label_410
	.word	-164
	.word	4
	.word	_Label_411
	.word	-168
	.word	4
	.word	_Label_412
	.word	-172
	.word	4
	.word	_Label_413
	.word	-176
	.word	4
	.word	0
_Label_370:
	.ascii	"TestFrameManager\0"
	.align
_Label_371:
	.byte	'I'
	.ascii	"myID\0"
	.align
_Label_372:
	.byte	'?'
	.ascii	"_temp_369\0"
	.align
_Label_373:
	.byte	'?'
	.ascii	"_temp_368\0"
	.align
_Label_374:
	.byte	'?'
	.ascii	"_temp_367\0"
	.align
_Label_375:
	.byte	'?'
	.ascii	"_temp_366\0"
	.align
_Label_376:
	.byte	'?'
	.ascii	"_temp_365\0"
	.align
_Label_377:
	.byte	'?'
	.ascii	"_temp_364\0"
	.align
_Label_378:
	.byte	'?'
	.ascii	"_temp_363\0"
	.align
_Label_379:
	.byte	'?'
	.ascii	"_temp_358\0"
	.align
_Label_380:
	.byte	'?'
	.ascii	"_temp_357\0"
	.align
_Label_381:
	.byte	'?'
	.ascii	"_temp_352\0"
	.align
_Label_382:
	.byte	'?'
	.ascii	"_temp_351\0"
	.align
_Label_383:
	.byte	'?'
	.ascii	"_temp_350\0"
	.align
_Label_384:
	.byte	'?'
	.ascii	"_temp_349\0"
	.align
_Label_385:
	.byte	'?'
	.ascii	"_temp_348\0"
	.align
_Label_386:
	.byte	'?'
	.ascii	"_temp_347\0"
	.align
_Label_387:
	.byte	'?'
	.ascii	"_temp_346\0"
	.align
_Label_388:
	.byte	'?'
	.ascii	"_temp_341\0"
	.align
_Label_389:
	.byte	'?'
	.ascii	"_temp_340\0"
	.align
_Label_390:
	.byte	'?'
	.ascii	"_temp_339\0"
	.align
_Label_391:
	.byte	'?'
	.ascii	"_temp_338\0"
	.align
_Label_392:
	.byte	'?'
	.ascii	"_temp_337\0"
	.align
_Label_393:
	.byte	'?'
	.ascii	"_temp_336\0"
	.align
_Label_394:
	.byte	'?'
	.ascii	"_temp_335\0"
	.align
_Label_395:
	.byte	'?'
	.ascii	"_temp_334\0"
	.align
_Label_396:
	.byte	'?'
	.ascii	"_temp_333\0"
	.align
_Label_397:
	.byte	'?'
	.ascii	"_temp_332\0"
	.align
_Label_398:
	.byte	'?'
	.ascii	"_temp_331\0"
	.align
_Label_399:
	.byte	'?'
	.ascii	"_temp_330\0"
	.align
_Label_400:
	.byte	'?'
	.ascii	"_temp_329\0"
	.align
_Label_401:
	.byte	'?'
	.ascii	"_temp_328\0"
	.align
_Label_402:
	.byte	'?'
	.ascii	"_temp_325\0"
	.align
_Label_403:
	.byte	'?'
	.ascii	"_temp_324\0"
	.align
_Label_404:
	.byte	'?'
	.ascii	"_temp_319\0"
	.align
_Label_405:
	.byte	'?'
	.ascii	"_temp_318\0"
	.align
_Label_406:
	.byte	'?'
	.ascii	"_temp_313\0"
	.align
_Label_407:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_408:
	.byte	'I'
	.ascii	"j\0"
	.align
_Label_409:
	.byte	'I'
	.ascii	"newData\0"
	.align
_Label_410:
	.byte	'I'
	.ascii	"sz\0"
	.align
_Label_411:
	.byte	'I'
	.ascii	"singlePage\0"
	.align
_Label_412:
	.byte	'I'
	.ascii	"singlePgNo\0"
	.align
_Label_413:
	.byte	'P'
	.ascii	"pcb\0"
	.align
! 
! ===============  FUNCTION CheckAddrSpace  ===============
! 
_function_26_CheckAddrSpace:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_26_CheckAddrSpace,r1
	push	r1
	mov	23,r1
_Label_530:
	push	r0
	sub	r1,1,r1
	bne	_Label_530
	mov	435,r13		! source line 435
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	437,r13		! source line 437
	mov	"\0\0IF",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_417 = addrSpace + 4
	load	[r14+8],r1
	add	r1,4,r1
	store	r1,[r14+-76]
!   Data Move: _temp_416 = *_temp_417  (sizeInBytes=4)
	load	[r14+-76],r1
	load	[r1],r1
	store	r1,[r14+-80]
!   if _temp_416 == n then goto _Label_415		(int)
	load	[r14+-80],r1
	load	[r14+12],r2
	cmp	r1,r2
	be	_Label_415
!	_Label_414	jmp	_Label_414
_Label_414:
! THEN...
	mov	438,r13		! source line 438
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_418 = _StringConst_19
	set	_StringConst_19,r1
	store	r1,[r14+-72]
!   Prepare Argument: offset=8  value=_temp_418  sizeInBytes=4
	load	[r14+-72],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	438,r13		! source line 438
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_415:
! FOR STATEMENT...
	mov	440,r13		! source line 440
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_423 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-68]
!   Calculate and save the FOR-LOOP ending value
!   _temp_424 = n - 1		(int)
	load	[r14+12],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-64]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_423  (sizeInBytes=4)
	load	[r14+-68],r1
	store	r1,[r14+-84]
_Label_419:
!   Perform the FOR-LOOP termination test
!   if i > _temp_424 then goto _Label_422		
	load	[r14+-84],r1
	load	[r14+-64],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_422
_Label_420:
	mov	440,r13		! source line 440
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	441,r13		! source line 441
	mov	"\0\0AS",r10
	mov	441,r13		! source line 441
	mov	"\0\0SE",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=i  sizeInBytes=4
	load	[r14+-84],r1
	store	r1,[r15+4]
!   Send message ExtractFrameAddr
	load	[r14+8],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=frameAddr  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-88]
! ASSIGNMENT STATEMENT...
	mov	442,r13		! source line 442
	mov	"\0\0AS",r10
!   _temp_425 = frameAddr - 1048576		(int)
	load	[r14+-88],r1
	set	1048576,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-60]
!   frameNumber = _temp_425 div 8192		(int)
	load	[r14+-60],r1
	mov	8192,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	div	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-92]
! IF STATEMENT...
	mov	444,r13		! source line 444
	mov	"\0\0IF",r10
!   if frameNumber >= 0 then goto _Label_429		(int)
	load	[r14+-92],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_429
	jmp	_Label_426
_Label_429:
!   if frameNumber < 35 then goto _Label_428		(int)
	load	[r14+-92],r1
	mov	35,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bl	_Label_428
	jmp	_Label_426
_Label_428:
!   _temp_430 = frameAddr rem 8192		(int)
	load	[r14+-88],r1
	mov	8192,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-56]
!   if intIsZero (_temp_430) then goto _Label_427
	load	[r14+-56],r1
	cmp	r1,r0
	be	_Label_427
!	_Label_426	jmp	_Label_426
_Label_426:
! THEN...
	mov	447,r13		! source line 447
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_431 = _StringConst_20
	set	_StringConst_20,r1
	store	r1,[r14+-52]
!   Prepare Argument: offset=8  value=_temp_431  sizeInBytes=4
	load	[r14+-52],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	447,r13		! source line 447
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_427:
! ASSIGNMENT STATEMENT...
	mov	449,r13		! source line 449
	mov	"\0\0AS",r10
!   _temp_432 = &_Global_histogram
	set	_Global_histogram,r1
	store	r1,[r14+-48]
!   Move address of _temp_432 [frameNumber ] into _temp_433
!     make sure index expr is >= 0
	load	[r14+-92],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+-48],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	4,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-44]
!   _temp_436 = &_Global_histogram
	set	_Global_histogram,r1
	store	r1,[r14+-32]
!   Move address of _temp_436 [frameNumber ] into _temp_437
!     make sure index expr is >= 0
	load	[r14+-92],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+-32],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	4,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-28]
!   Data Move: _temp_435 = *_temp_437  (sizeInBytes=4)
	load	[r14+-28],r1
	load	[r1],r1
	store	r1,[r14+-36]
!   _temp_434 = _temp_435 + 1		(int)
	load	[r14+-36],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-40]
!   Data Move: *_temp_433 = _temp_434  (sizeInBytes=4)
	load	[r14+-40],r1
	load	[r14+-44],r2
	store	r1,[r2]
! IF STATEMENT...
	mov	450,r13		! source line 450
	mov	"\0\0IF",r10
	mov	450,r13		! source line 450
	mov	"\0\0SE",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=i  sizeInBytes=4
	load	[r14+-84],r1
	store	r1,[r15+4]
!   Send message ExtractUndefinedBits
	load	[r14+8],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
!   Retrieve Result: targetName=_temp_444  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-24]
!   if intIsZero (_temp_444) then goto _Label_443
	load	[r14+-24],r1
	cmp	r1,r0
	be	_Label_443
	jmp	_Label_438
_Label_443:
	mov	451,r13		! source line 451
	mov	"\0\0SE",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=i  sizeInBytes=4
	load	[r14+-84],r1
	store	r1,[r15+4]
!   Send message IsDirty
	load	[r14+8],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,24,r2
	call	r2
!   if result==true then goto _Label_438 else goto _Label_442
	loadb	[r15],r1
	cmp	r1,0
	be	_Label_442
	jmp	_Label_438
_Label_442:
	mov	452,r13		! source line 452
	mov	"\0\0SE",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=i  sizeInBytes=4
	load	[r14+-84],r1
	store	r1,[r15+4]
!   Send message IsReferenced
	load	[r14+8],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,28,r2
	call	r2
!   if result==true then goto _Label_438 else goto _Label_441
	loadb	[r15],r1
	cmp	r1,0
	be	_Label_441
	jmp	_Label_438
_Label_441:
	mov	453,r13		! source line 453
	mov	"\0\0SE",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=i  sizeInBytes=4
	load	[r14+-84],r1
	store	r1,[r15+4]
!   Send message IsWritable
	load	[r14+8],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,32,r2
	call	r2
!   Retrieve Result: targetName=_temp_445  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-10]
!   if _temp_445 then goto _Label_440 else goto _Label_438
	loadb	[r14+-10],r1
	cmp	r1,0
	be	_Label_438
	jmp	_Label_440
_Label_440:
	mov	454,r13		! source line 454
	mov	"\0\0SE",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=i  sizeInBytes=4
	load	[r14+-84],r1
	store	r1,[r15+4]
!   Send message IsValid
	load	[r14+8],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,36,r2
	call	r2
!   Retrieve Result: targetName=_temp_446  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-9]
!   if _temp_446 then goto _Label_439 else goto _Label_438
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_438
	jmp	_Label_439
_Label_438:
! THEN...
	mov	455,r13		! source line 455
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_447 = _StringConst_21
	set	_StringConst_21,r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_447  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	455,r13		! source line 455
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_439:
! ASSIGNMENT STATEMENT...
	mov	457,r13		! source line 457
	mov	"\0\0AS",r10
!   if intIsZero (frameAddr) then goto _runtimeErrorNullPointer
	load	[r14+-88],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_448 = uniq + i		(int)
	load	[r14+16],r1
	load	[r14+-84],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-16]
!   Data Move: *frameAddr = _temp_448  (sizeInBytes=4)
	load	[r14+-16],r1
	load	[r14+-88],r2
	store	r1,[r2]
!   Increment the FOR-LOOP index variable and jump back
_Label_421:
!   i = i + 1
	load	[r14+-84],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-84]
	jmp	_Label_419
! END FOR
_Label_422:
! RETURN STATEMENT...
	mov	440,r13		! source line 440
	mov	"\0\0RE",r10
	add	r15,96,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_26_CheckAddrSpace:
	.word	_sourceFileName
	.word	_Label_449
	.word	12		! total size of parameters
	.word	92		! frame size = 92
	.word	_Label_450
	.word	8
	.word	4
	.word	_Label_451
	.word	12
	.word	4
	.word	_Label_452
	.word	16
	.word	4
	.word	_Label_453
	.word	-16
	.word	4
	.word	_Label_454
	.word	-20
	.word	4
	.word	_Label_455
	.word	-9
	.word	1
	.word	_Label_456
	.word	-10
	.word	1
	.word	_Label_457
	.word	-24
	.word	4
	.word	_Label_458
	.word	-28
	.word	4
	.word	_Label_459
	.word	-32
	.word	4
	.word	_Label_460
	.word	-36
	.word	4
	.word	_Label_461
	.word	-40
	.word	4
	.word	_Label_462
	.word	-44
	.word	4
	.word	_Label_463
	.word	-48
	.word	4
	.word	_Label_464
	.word	-52
	.word	4
	.word	_Label_465
	.word	-56
	.word	4
	.word	_Label_466
	.word	-60
	.word	4
	.word	_Label_467
	.word	-64
	.word	4
	.word	_Label_468
	.word	-68
	.word	4
	.word	_Label_469
	.word	-72
	.word	4
	.word	_Label_470
	.word	-76
	.word	4
	.word	_Label_471
	.word	-80
	.word	4
	.word	_Label_472
	.word	-84
	.word	4
	.word	_Label_473
	.word	-88
	.word	4
	.word	_Label_474
	.word	-92
	.word	4
	.word	0
_Label_449:
	.ascii	"CheckAddrSpace\0"
	.align
_Label_450:
	.byte	'P'
	.ascii	"addrSpace\0"
	.align
_Label_451:
	.byte	'I'
	.ascii	"n\0"
	.align
_Label_452:
	.byte	'I'
	.ascii	"uniq\0"
	.align
_Label_453:
	.byte	'?'
	.ascii	"_temp_448\0"
	.align
_Label_454:
	.byte	'?'
	.ascii	"_temp_447\0"
	.align
_Label_455:
	.byte	'C'
	.ascii	"_temp_446\0"
	.align
_Label_456:
	.byte	'C'
	.ascii	"_temp_445\0"
	.align
_Label_457:
	.byte	'?'
	.ascii	"_temp_444\0"
	.align
_Label_458:
	.byte	'?'
	.ascii	"_temp_437\0"
	.align
_Label_459:
	.byte	'?'
	.ascii	"_temp_436\0"
	.align
_Label_460:
	.byte	'?'
	.ascii	"_temp_435\0"
	.align
_Label_461:
	.byte	'?'
	.ascii	"_temp_434\0"
	.align
_Label_462:
	.byte	'?'
	.ascii	"_temp_433\0"
	.align
_Label_463:
	.byte	'?'
	.ascii	"_temp_432\0"
	.align
_Label_464:
	.byte	'?'
	.ascii	"_temp_431\0"
	.align
_Label_465:
	.byte	'?'
	.ascii	"_temp_430\0"
	.align
_Label_466:
	.byte	'?'
	.ascii	"_temp_425\0"
	.align
_Label_467:
	.byte	'?'
	.ascii	"_temp_424\0"
	.align
_Label_468:
	.byte	'?'
	.ascii	"_temp_423\0"
	.align
_Label_469:
	.byte	'?'
	.ascii	"_temp_418\0"
	.align
_Label_470:
	.byte	'?'
	.ascii	"_temp_417\0"
	.align
_Label_471:
	.byte	'?'
	.ascii	"_temp_416\0"
	.align
_Label_472:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_473:
	.byte	'I'
	.ascii	"frameAddr\0"
	.align
_Label_474:
	.byte	'I'
	.ascii	"frameNumber\0"
	.align
! 
! ===============  FUNCTION CheckAddrSpace2  ===============
! 
_function_25_CheckAddrSpace2:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_25_CheckAddrSpace2,r1
	push	r1
	mov	16,r1
_Label_531:
	push	r0
	sub	r1,1,r1
	bne	_Label_531
	mov	468,r13		! source line 468
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	470,r13		! source line 470
	mov	"\0\0IF",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_478 = addrSpace + 4
	load	[r14+8],r1
	add	r1,4,r1
	store	r1,[r14+-48]
!   Data Move: _temp_477 = *_temp_478  (sizeInBytes=4)
	load	[r14+-48],r1
	load	[r1],r1
	store	r1,[r14+-52]
!   if _temp_477 == n then goto _Label_476		(int)
	load	[r14+-52],r1
	load	[r14+12],r2
	cmp	r1,r2
	be	_Label_476
!	_Label_475	jmp	_Label_475
_Label_475:
! THEN...
	mov	471,r13		! source line 471
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_479 = _StringConst_22
	set	_StringConst_22,r1
	store	r1,[r14+-44]
!   Prepare Argument: offset=8  value=_temp_479  sizeInBytes=4
	load	[r14+-44],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	471,r13		! source line 471
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_476:
! FOR STATEMENT...
	mov	473,r13		! source line 473
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_484 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-40]
!   Calculate and save the FOR-LOOP ending value
!   _temp_485 = n - 1		(int)
	load	[r14+12],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-36]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_484  (sizeInBytes=4)
	load	[r14+-40],r1
	store	r1,[r14+-56]
_Label_480:
!   Perform the FOR-LOOP termination test
!   if i > _temp_485 then goto _Label_483		
	load	[r14+-56],r1
	load	[r14+-36],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_483
_Label_481:
	mov	473,r13		! source line 473
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	474,r13		! source line 474
	mov	"\0\0AS",r10
	mov	474,r13		! source line 474
	mov	"\0\0SE",r10
!   if intIsZero (addrSpace) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Prepare Argument: offset=12  value=i  sizeInBytes=4
	load	[r14+-56],r1
	store	r1,[r15+4]
!   Send message ExtractFrameAddr
	load	[r14+8],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=frameAddr  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-60]
! ASSIGNMENT STATEMENT...
	mov	475,r13		! source line 475
	mov	"\0\0AS",r10
!   _temp_486 = frameAddr - 1048576		(int)
	load	[r14+-60],r1
	set	1048576,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-32]
!   frameNumber = _temp_486 div 8192		(int)
	load	[r14+-32],r1
	mov	8192,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	div	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-64]
! IF STATEMENT...
	mov	477,r13		! source line 477
	mov	"\0\0IF",r10
!   if frameNumber >= 0 then goto _Label_490		(int)
	load	[r14+-64],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_490
	jmp	_Label_487
_Label_490:
!   if frameNumber < 35 then goto _Label_489		(int)
	load	[r14+-64],r1
	mov	35,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bl	_Label_489
	jmp	_Label_487
_Label_489:
!   _temp_491 = frameAddr rem 8192		(int)
	load	[r14+-60],r1
	mov	8192,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-28]
!   if intIsZero (_temp_491) then goto _Label_488
	load	[r14+-28],r1
	cmp	r1,r0
	be	_Label_488
!	_Label_487	jmp	_Label_487
_Label_487:
! THEN...
	mov	480,r13		! source line 480
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_492 = _StringConst_23
	set	_StringConst_23,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_492  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	480,r13		! source line 480
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_488:
! IF STATEMENT...
	mov	482,r13		! source line 482
	mov	"\0\0IF",r10
!   if intIsZero (frameAddr) then goto _runtimeErrorNullPointer
	load	[r14+-60],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_495 = *frameAddr  (sizeInBytes=4)
	load	[r14+-60],r1
	load	[r1],r1
	store	r1,[r14+-20]
!   _temp_496 = uniq + i		(int)
	load	[r14+16],r1
	load	[r14+-56],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-16]
!   if _temp_495 == _temp_496 then goto _Label_494		(int)
	load	[r14+-20],r1
	load	[r14+-16],r2
	cmp	r1,r2
	be	_Label_494
!	_Label_493	jmp	_Label_493
_Label_493:
! THEN...
	mov	483,r13		! source line 483
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_497 = _StringConst_24
	set	_StringConst_24,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_497  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   call indirectly through variable _P_System_FatalError
	mov	483,r13		! source line 483
	mov	"\0\0CF",r10
	set	_P_System_FatalError,r1
	load	[r1],r1
	cmp	r1,0
	be	_runtimeErrorNullPointerDuringCall
	call	r1
! END IF...
_Label_494:
!   Increment the FOR-LOOP index variable and jump back
_Label_482:
!   i = i + 1
	load	[r14+-56],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-56]
	jmp	_Label_480
! END FOR
_Label_483:
! RETURN STATEMENT...
	mov	473,r13		! source line 473
	mov	"\0\0RE",r10
	add	r15,68,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_25_CheckAddrSpace2:
	.word	_sourceFileName
	.word	_Label_498
	.word	12		! total size of parameters
	.word	64		! frame size = 64
	.word	_Label_499
	.word	8
	.word	4
	.word	_Label_500
	.word	12
	.word	4
	.word	_Label_501
	.word	16
	.word	4
	.word	_Label_502
	.word	-12
	.word	4
	.word	_Label_503
	.word	-16
	.word	4
	.word	_Label_504
	.word	-20
	.word	4
	.word	_Label_505
	.word	-24
	.word	4
	.word	_Label_506
	.word	-28
	.word	4
	.word	_Label_507
	.word	-32
	.word	4
	.word	_Label_508
	.word	-36
	.word	4
	.word	_Label_509
	.word	-40
	.word	4
	.word	_Label_510
	.word	-44
	.word	4
	.word	_Label_511
	.word	-48
	.word	4
	.word	_Label_512
	.word	-52
	.word	4
	.word	_Label_513
	.word	-56
	.word	4
	.word	_Label_514
	.word	-60
	.word	4
	.word	_Label_515
	.word	-64
	.word	4
	.word	0
_Label_498:
	.ascii	"CheckAddrSpace2\0"
	.align
_Label_499:
	.byte	'P'
	.ascii	"addrSpace\0"
	.align
_Label_500:
	.byte	'I'
	.ascii	"n\0"
	.align
_Label_501:
	.byte	'I'
	.ascii	"uniq\0"
	.align
_Label_502:
	.byte	'?'
	.ascii	"_temp_497\0"
	.align
_Label_503:
	.byte	'?'
	.ascii	"_temp_496\0"
	.align
_Label_504:
	.byte	'?'
	.ascii	"_temp_495\0"
	.align
_Label_505:
	.byte	'?'
	.ascii	"_temp_492\0"
	.align
_Label_506:
	.byte	'?'
	.ascii	"_temp_491\0"
	.align
_Label_507:
	.byte	'?'
	.ascii	"_temp_486\0"
	.align
_Label_508:
	.byte	'?'
	.ascii	"_temp_485\0"
	.align
_Label_509:
	.byte	'?'
	.ascii	"_temp_484\0"
	.align
_Label_510:
	.byte	'?'
	.ascii	"_temp_479\0"
	.align
_Label_511:
	.byte	'?'
	.ascii	"_temp_478\0"
	.align
_Label_512:
	.byte	'?'
	.ascii	"_temp_477\0"
	.align
_Label_513:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_514:
	.byte	'I'
	.ascii	"frameAddr\0"
	.align
_Label_515:
	.byte	'I'
	.ascii	"frameNumber\0"
	.align
