! Name of package being compiled: UserSystem
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
	.export	_Error_P_UserSystem_UncaughtThrowError
_Error_P_UserSystem_UncaughtThrowError:
	.ascii	"_Error_P_UserSystem_UncaughtThrowError\0"
	.align
! Functions imported from other packages
	.import	_P_Syscall_entSize
! Externally visible functions in this package
	.export	_P_UserSystem_Sys_Exit
	.export	_P_UserSystem_Sys_Shutdown
	.export	_P_UserSystem_Sys_Yield
	.export	_P_UserSystem_Sys_Fork
	.export	_P_UserSystem_Sys_Join
	.export	_P_UserSystem_Sys_Exec
	.export	_P_UserSystem_Sys_Open
	.export	_P_UserSystem_Sys_Read
	.export	_P_UserSystem_Sys_Write
	.export	_P_UserSystem_Sys_Seek
	.export	_P_UserSystem_Sys_Close
	.export	_P_UserSystem_Sys_GetPid
	.export	_P_UserSystem_Sys_GetPPid
	.export	_P_UserSystem_Sys_Stat
	.export	_P_UserSystem_Sys_ChMode
	.export	_P_UserSystem_Sys_Link
	.export	_P_UserSystem_Sys_Unlink
	.export	_P_UserSystem_Sys_Mkdir
	.export	_P_UserSystem_Sys_Rmdir
	.export	_P_UserSystem_Sys_Chdir
	.export	_P_UserSystem_Sys_Opendir
	.export	_P_UserSystem_Sys_Readdir
	.import	DoSyscall
	.import	TerminateWithError
	.import	print
	.import	printInt
	.import	printHex
	.import	printChar
	.import	printBool
	.import	printDouble
	.export	_P_UserSystem_StrEqual
	.export	_P_UserSystem_StrCopy
	.export	_P_UserSystem_StrCmp
	.export	_P_UserSystem_Min
	.export	_P_UserSystem_Max
	.export	_P_UserSystem_printIntVar
	.export	_P_UserSystem_printHexVar
	.export	_P_UserSystem_printBoolVar
	.export	_P_UserSystem_printCharVar
	.export	_P_UserSystem_printPtr
	.export	_P_UserSystem_nl
	.export	_P_UserSystem_MemoryEqual
	.import	getCatchStack
	.import	MemoryZero
	.import	MemoryCopy
	.export	_P_UserSystem_KPLSystemInitialize
	.export	_P_UserSystem_KPLMemoryAlloc
	.export	_P_UserSystem_KPLMemoryFree
	.export	_P_UserSystem_KPLUncaughtThrow
	.export	_P_UserSystem_KPLIsKindOf
	.export	_P_UserSystem_KPLSystemError
! The following class and its methods are from this package
	.export	_P_UserSystem_Object
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
! Global variables in this package
	.data
	.export	_P_UserSystem_cmdArgs
_P_UserSystem_cmdArgs:
	.skip	4
_Global_memoryArea:
	.skip	20004
_Global_nextCharToUse:
	.word	0
_Global_alreadyInAlloc:
	.byte	0
	.align
! String constants
_StringConst_23:
	.word	2			! length
	.ascii	":\t"
	.align
_StringConst_22:
	.word	1			! length
	.ascii	":"
	.align
_StringConst_21:
	.word	5			! length
	.ascii	"     "
	.align
_StringConst_20:
	.word	28			! length
	.ascii	"   Here is the CATCH STACK:\n"
	.align
_StringConst_19:
	.word	63			! length
	.ascii	"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n"
	.align
_StringConst_18:
	.word	41			! length
	.ascii	"   Currently active method or function = "
	.align
_StringConst_17:
	.word	1			! length
	.ascii	":"
	.align
_StringConst_16:
	.word	31			! length
	.ascii	"   Location at time of THROW = "
	.align
_StringConst_15:
	.word	16			! length
	.ascii	"   Error Name = "
	.align
_StringConst_14:
	.word	64			! length
	.ascii	"\n\n++++++++++ An error has been thrown but not caught ++++++++++\n"
	.align
_StringConst_13:
	.word	36			! length
	.ascii	"WITHIN KPLIsKindOf: Bad Magic Number"
	.align
_StringConst_12:
	.word	34			! length
	.ascii	"WITHIN KPLIsKindOf: objPtr is NULL"
	.align
_StringConst_11:
	.word	43			! length
	.ascii	"\n\nFATAL KPL RUNTIME ERROR IN USER PROGRAM: "
	.align
_StringConst_10:
	.word	36			! length
	.ascii	"WITHIN KPLMemoryAlloc: Out of memory"
	.align
_StringConst_9:
	.word	49			! length
	.ascii	"WITHIN KPLMemoryAlloc: byte count is not positive"
	.align
_StringConst_8:
	.word	18			! length
	.ascii	"\n\nBad byteCount = "
	.align
_StringConst_7:
	.word	32			! length
	.ascii	"WITHIN KPLMemoryAlloc: Reentered"
	.align
_StringConst_6:
	.word	3			! length
	.ascii	" = "
	.align
_StringConst_5:
	.word	2			! length
	.ascii	"\'\n"
	.align
_StringConst_4:
	.word	4			! length
	.ascii	" = \'"
	.align
_StringConst_3:
	.word	3			! length
	.ascii	" = "
	.align
_StringConst_2:
	.word	3			! length
	.ascii	" = "
	.align
_StringConst_1:
	.word	3			! length
	.ascii	" = "
	.align
	.text
! 
! Source Filename and Package Name
! 
_sourceFileName:
	.ascii	"UserSystem.k\0"
_packageName:
	.ascii	"UserSystem\0"
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
_CheckVersion_P_UserSystem_:
	.export	_CheckVersion_P_UserSystem_
	set	0x0234a765,r4		! myHashVal = 37005157
	cmp	r3,r4
	be	_Label_26
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
_Label_26:
	mov	0,r1
! Make sure _P_Syscall_ has hash value 0x73d5af34 (decimal 1943383860)
	set	_packageName,r2
	set	0x73d5af34,r3
	call	_CheckVersion_P_Syscall_
	.import	_CheckVersion_P_Syscall_
	cmp	r1,0
	bne	_Label_27
_Label_27:
	ret
_CVMess1:	.ascii	"\nVERSION CONSISTENCY ERROR: Package '\0"
_CVMess2:	.ascii	"' uses package '\0"
_CVMess3:	.ascii	"'.  Whenever a header file is modified, all packages that use that package (directly or indirectly) must be recompiled.  The header file for '\0"
_CVMess4:	.ascii	"' has been changed since '\0"
_CVMess5:	.ascii	"' was compiled last.  Please recompile all packages that depend on '\0"
_CVMess6:	.ascii	"'.\n\n\0"
	.align
! 
! ===============  FUNCTION Sys_Exit  ===============
! 
_P_UserSystem_Sys_Exit:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Exit,r1
	push	r1
	mov	6,r1
_Label_463:
	push	r0
	sub	r1,1,r1
	bne	_Label_463
	mov	13,r13		! source line 13
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	21,r13		! source line 21
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=1  sizeInBytes=4
	mov	1,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=returnStatus  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	21,r13		! source line 21
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=ignore  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
! RETURN STATEMENT...
	mov	21,r13		! source line 21
	mov	"\0\0RE",r10
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Exit:
	.word	_sourceFileName
	.word	_Label_28
	.word	4		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_29
	.word	8
	.word	4
	.word	_Label_30
	.word	-12
	.word	4
	.word	0
_Label_28:
	.ascii	"Sys_Exit\0"
	.align
_Label_29:
	.byte	'I'
	.ascii	"returnStatus\0"
	.align
_Label_30:
	.byte	'I'
	.ascii	"ignore\0"
	.align
! 
! ===============  FUNCTION Sys_Shutdown  ===============
! 
_P_UserSystem_Sys_Shutdown:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Shutdown,r1
	push	r1
	mov	6,r1
_Label_464:
	push	r0
	sub	r1,1,r1
	bne	_Label_464
	mov	26,r13		! source line 26
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	32,r13		! source line 32
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	32,r13		! source line 32
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=ignore  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
! RETURN STATEMENT...
	mov	32,r13		! source line 32
	mov	"\0\0RE",r10
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Shutdown:
	.word	_sourceFileName
	.word	_Label_31
	.word	0		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_32
	.word	-12
	.word	4
	.word	0
_Label_31:
	.ascii	"Sys_Shutdown\0"
	.align
_Label_32:
	.byte	'I'
	.ascii	"ignore\0"
	.align
! 
! ===============  FUNCTION Sys_Yield  ===============
! 
_P_UserSystem_Sys_Yield:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Yield,r1
	push	r1
	mov	6,r1
_Label_465:
	push	r0
	sub	r1,1,r1
	bne	_Label_465
	mov	37,r13		! source line 37
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	44,r13		! source line 44
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=3  sizeInBytes=4
	mov	3,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	44,r13		! source line 44
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=ignore  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
! RETURN STATEMENT...
	mov	44,r13		! source line 44
	mov	"\0\0RE",r10
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Yield:
	.word	_sourceFileName
	.word	_Label_33
	.word	0		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_34
	.word	-12
	.word	4
	.word	0
_Label_33:
	.ascii	"Sys_Yield\0"
	.align
_Label_34:
	.byte	'I'
	.ascii	"ignore\0"
	.align
! 
! ===============  FUNCTION Sys_Fork  ===============
! 
_P_UserSystem_Sys_Fork:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Fork,r1
	push	r1
	mov	6,r1
_Label_466:
	push	r0
	sub	r1,1,r1
	bne	_Label_466
	mov	49,r13		! source line 49
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	58,r13		! source line 58
	mov	"\0\0RE",r10
!   Prepare Argument: offset=8  value=6  sizeInBytes=4
	mov	6,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	58,r13		! source line 58
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_35  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
!   ReturnResult: _temp_35  (sizeInBytes=4)
	load	[r14+-12],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Fork:
	.word	_sourceFileName
	.word	_Label_36
	.word	0		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_37
	.word	-12
	.word	4
	.word	0
_Label_36:
	.ascii	"Sys_Fork\0"
	.align
_Label_37:
	.byte	'?'
	.ascii	"_temp_35\0"
	.align
! 
! ===============  FUNCTION Sys_Join  ===============
! 
_P_UserSystem_Sys_Join:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Join,r1
	push	r1
	mov	6,r1
_Label_467:
	push	r0
	sub	r1,1,r1
	bne	_Label_467
	mov	63,r13		! source line 63
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	73,r13		! source line 73
	mov	"\0\0RE",r10
!   Prepare Argument: offset=8  value=7  sizeInBytes=4
	mov	7,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=processID  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	73,r13		! source line 73
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_38  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
!   ReturnResult: _temp_38  (sizeInBytes=4)
	load	[r14+-12],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Join:
	.word	_sourceFileName
	.word	_Label_39
	.word	4		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_40
	.word	8
	.word	4
	.word	_Label_41
	.word	-12
	.word	4
	.word	0
_Label_39:
	.ascii	"Sys_Join\0"
	.align
_Label_40:
	.byte	'I'
	.ascii	"processID\0"
	.align
_Label_41:
	.byte	'?'
	.ascii	"_temp_38\0"
	.align
! 
! ===============  FUNCTION Sys_Exec  ===============
! 
_P_UserSystem_Sys_Exec:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Exec,r1
	push	r1
	mov	8,r1
_Label_468:
	push	r0
	sub	r1,1,r1
	bne	_Label_468
	mov	78,r13		! source line 78
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	89,r13		! source line 89
	mov	"\0\0RE",r10
!   _temp_43 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-16]
!   _temp_44 = args		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=8  sizeInBytes=4
	mov	8,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_43  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=_temp_44  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	89,r13		! source line 89
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_42  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-20]
!   ReturnResult: _temp_42  (sizeInBytes=4)
	load	[r14+-20],r1
	store	r1,[r14+8]
	add	r15,36,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Exec:
	.word	_sourceFileName
	.word	_Label_45
	.word	8		! total size of parameters
	.word	32		! frame size = 32
	.word	_Label_46
	.word	8
	.word	4
	.word	_Label_47
	.word	12
	.word	4
	.word	_Label_48
	.word	-12
	.word	4
	.word	_Label_49
	.word	-16
	.word	4
	.word	_Label_50
	.word	-20
	.word	4
	.word	0
_Label_45:
	.ascii	"Sys_Exec\0"
	.align
_Label_46:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_47:
	.byte	'P'
	.ascii	"args\0"
	.align
_Label_48:
	.byte	'?'
	.ascii	"_temp_44\0"
	.align
_Label_49:
	.byte	'?'
	.ascii	"_temp_43\0"
	.align
_Label_50:
	.byte	'?'
	.ascii	"_temp_42\0"
	.align
! 
! ===============  FUNCTION Sys_Open  ===============
! 
_P_UserSystem_Sys_Open:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Open,r1
	push	r1
	mov	7,r1
_Label_469:
	push	r0
	sub	r1,1,r1
	bne	_Label_469
	mov	94,r13		! source line 94
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	101,r13		! source line 101
	mov	"\0\0RE",r10
!   _temp_52 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=9  sizeInBytes=4
	mov	9,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_52  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=flags  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=mode  sizeInBytes=4
	load	[r14+16],r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	101,r13		! source line 101
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_51  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_51  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Open:
	.word	_sourceFileName
	.word	_Label_53
	.word	12		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_54
	.word	8
	.word	4
	.word	_Label_55
	.word	12
	.word	4
	.word	_Label_56
	.word	16
	.word	4
	.word	_Label_57
	.word	-12
	.word	4
	.word	_Label_58
	.word	-16
	.word	4
	.word	0
_Label_53:
	.ascii	"Sys_Open\0"
	.align
_Label_54:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_55:
	.byte	'I'
	.ascii	"flags\0"
	.align
_Label_56:
	.byte	'I'
	.ascii	"mode\0"
	.align
_Label_57:
	.byte	'?'
	.ascii	"_temp_52\0"
	.align
_Label_58:
	.byte	'?'
	.ascii	"_temp_51\0"
	.align
! 
! ===============  FUNCTION Sys_Read  ===============
! 
_P_UserSystem_Sys_Read:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Read,r1
	push	r1
	mov	7,r1
_Label_470:
	push	r0
	sub	r1,1,r1
	bne	_Label_470
	mov	106,r13		! source line 106
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	125,r13		! source line 125
	mov	"\0\0RE",r10
!   _temp_60 = buffer		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=10  sizeInBytes=4
	mov	10,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=fileDesc  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=_temp_60  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=sizeInBytes  sizeInBytes=4
	load	[r14+16],r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	125,r13		! source line 125
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_59  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_59  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Read:
	.word	_sourceFileName
	.word	_Label_61
	.word	12		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_62
	.word	8
	.word	4
	.word	_Label_63
	.word	12
	.word	4
	.word	_Label_64
	.word	16
	.word	4
	.word	_Label_65
	.word	-12
	.word	4
	.word	_Label_66
	.word	-16
	.word	4
	.word	0
_Label_61:
	.ascii	"Sys_Read\0"
	.align
_Label_62:
	.byte	'I'
	.ascii	"fileDesc\0"
	.align
_Label_63:
	.byte	'P'
	.ascii	"buffer\0"
	.align
_Label_64:
	.byte	'I'
	.ascii	"sizeInBytes\0"
	.align
_Label_65:
	.byte	'?'
	.ascii	"_temp_60\0"
	.align
_Label_66:
	.byte	'?'
	.ascii	"_temp_59\0"
	.align
! 
! ===============  FUNCTION Sys_Write  ===============
! 
_P_UserSystem_Sys_Write:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Write,r1
	push	r1
	mov	7,r1
_Label_471:
	push	r0
	sub	r1,1,r1
	bne	_Label_471
	mov	130,r13		! source line 130
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	150,r13		! source line 150
	mov	"\0\0RE",r10
!   _temp_68 = buffer		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=11  sizeInBytes=4
	mov	11,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=fileDesc  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=_temp_68  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=sizeInBytes  sizeInBytes=4
	load	[r14+16],r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	150,r13		! source line 150
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_67  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_67  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Write:
	.word	_sourceFileName
	.word	_Label_69
	.word	12		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_70
	.word	8
	.word	4
	.word	_Label_71
	.word	12
	.word	4
	.word	_Label_72
	.word	16
	.word	4
	.word	_Label_73
	.word	-12
	.word	4
	.word	_Label_74
	.word	-16
	.word	4
	.word	0
_Label_69:
	.ascii	"Sys_Write\0"
	.align
_Label_70:
	.byte	'I'
	.ascii	"fileDesc\0"
	.align
_Label_71:
	.byte	'P'
	.ascii	"buffer\0"
	.align
_Label_72:
	.byte	'I'
	.ascii	"sizeInBytes\0"
	.align
_Label_73:
	.byte	'?'
	.ascii	"_temp_68\0"
	.align
_Label_74:
	.byte	'?'
	.ascii	"_temp_67\0"
	.align
! 
! ===============  FUNCTION Sys_Seek  ===============
! 
_P_UserSystem_Sys_Seek:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Seek,r1
	push	r1
	mov	6,r1
_Label_472:
	push	r0
	sub	r1,1,r1
	bne	_Label_472
	mov	155,r13		! source line 155
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	176,r13		! source line 176
	mov	"\0\0RE",r10
!   Prepare Argument: offset=8  value=12  sizeInBytes=4
	mov	12,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=fileDesc  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=newCurrentPos  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	176,r13		! source line 176
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_75  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
!   ReturnResult: _temp_75  (sizeInBytes=4)
	load	[r14+-12],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Seek:
	.word	_sourceFileName
	.word	_Label_76
	.word	8		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_77
	.word	8
	.word	4
	.word	_Label_78
	.word	12
	.word	4
	.word	_Label_79
	.word	-12
	.word	4
	.word	0
_Label_76:
	.ascii	"Sys_Seek\0"
	.align
_Label_77:
	.byte	'I'
	.ascii	"fileDesc\0"
	.align
_Label_78:
	.byte	'I'
	.ascii	"newCurrentPos\0"
	.align
_Label_79:
	.byte	'?'
	.ascii	"_temp_75\0"
	.align
! 
! ===============  FUNCTION Sys_Close  ===============
! 
_P_UserSystem_Sys_Close:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Close,r1
	push	r1
	mov	6,r1
_Label_473:
	push	r0
	sub	r1,1,r1
	bne	_Label_473
	mov	181,r13		! source line 181
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	188,r13		! source line 188
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=13  sizeInBytes=4
	mov	13,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=fileDesc  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	188,r13		! source line 188
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=ignore  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
! RETURN STATEMENT...
	mov	188,r13		! source line 188
	mov	"\0\0RE",r10
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Close:
	.word	_sourceFileName
	.word	_Label_80
	.word	4		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_81
	.word	8
	.word	4
	.word	_Label_82
	.word	-12
	.word	4
	.word	0
_Label_80:
	.ascii	"Sys_Close\0"
	.align
_Label_81:
	.byte	'I'
	.ascii	"fileDesc\0"
	.align
_Label_82:
	.byte	'I'
	.ascii	"ignore\0"
	.align
! 
! ===============  FUNCTION Sys_GetPid  ===============
! 
_P_UserSystem_Sys_GetPid:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_GetPid,r1
	push	r1
	mov	6,r1
_Label_474:
	push	r0
	sub	r1,1,r1
	bne	_Label_474
	mov	193,r13		! source line 193
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	195,r13		! source line 195
	mov	"\0\0RE",r10
!   Prepare Argument: offset=8  value=4  sizeInBytes=4
	mov	4,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	195,r13		! source line 195
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_83  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
!   ReturnResult: _temp_83  (sizeInBytes=4)
	load	[r14+-12],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_GetPid:
	.word	_sourceFileName
	.word	_Label_84
	.word	0		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_85
	.word	-12
	.word	4
	.word	0
_Label_84:
	.ascii	"Sys_GetPid\0"
	.align
_Label_85:
	.byte	'?'
	.ascii	"_temp_83\0"
	.align
! 
! ===============  FUNCTION Sys_GetPPid  ===============
! 
_P_UserSystem_Sys_GetPPid:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_GetPPid,r1
	push	r1
	mov	6,r1
_Label_475:
	push	r0
	sub	r1,1,r1
	bne	_Label_475
	mov	201,r13		! source line 201
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	203,r13		! source line 203
	mov	"\0\0RE",r10
!   Prepare Argument: offset=8  value=5  sizeInBytes=4
	mov	5,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	203,r13		! source line 203
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_86  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-12]
!   ReturnResult: _temp_86  (sizeInBytes=4)
	load	[r14+-12],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_GetPPid:
	.word	_sourceFileName
	.word	_Label_87
	.word	0		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_88
	.word	-12
	.word	4
	.word	0
_Label_87:
	.ascii	"Sys_GetPPid\0"
	.align
_Label_88:
	.byte	'?'
	.ascii	"_temp_86\0"
	.align
! 
! ===============  FUNCTION Sys_Stat  ===============
! 
_P_UserSystem_Sys_Stat:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Stat,r1
	push	r1
	mov	8,r1
_Label_476:
	push	r0
	sub	r1,1,r1
	bne	_Label_476
	mov	208,r13		! source line 208
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	209,r13		! source line 209
	mov	"\0\0RE",r10
!   _temp_90 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-16]
!   _temp_91 = statPtr		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=14  sizeInBytes=4
	mov	14,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_90  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=_temp_91  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	209,r13		! source line 209
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_89  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-20]
!   ReturnResult: _temp_89  (sizeInBytes=4)
	load	[r14+-20],r1
	store	r1,[r14+8]
	add	r15,36,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Stat:
	.word	_sourceFileName
	.word	_Label_92
	.word	8		! total size of parameters
	.word	32		! frame size = 32
	.word	_Label_93
	.word	8
	.word	4
	.word	_Label_94
	.word	12
	.word	4
	.word	_Label_95
	.word	-12
	.word	4
	.word	_Label_96
	.word	-16
	.word	4
	.word	_Label_97
	.word	-20
	.word	4
	.word	0
_Label_92:
	.ascii	"Sys_Stat\0"
	.align
_Label_93:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_94:
	.byte	'P'
	.ascii	"statPtr\0"
	.align
_Label_95:
	.byte	'?'
	.ascii	"_temp_91\0"
	.align
_Label_96:
	.byte	'?'
	.ascii	"_temp_90\0"
	.align
_Label_97:
	.byte	'?'
	.ascii	"_temp_89\0"
	.align
! 
! ===============  FUNCTION Sys_ChMode  ===============
! 
_P_UserSystem_Sys_ChMode:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_ChMode,r1
	push	r1
	mov	7,r1
_Label_477:
	push	r0
	sub	r1,1,r1
	bne	_Label_477
	mov	215,r13		! source line 215
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	216,r13		! source line 216
	mov	"\0\0RE",r10
!   _temp_99 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=15  sizeInBytes=4
	mov	15,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_99  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=mode  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	216,r13		! source line 216
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_98  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_98  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_ChMode:
	.word	_sourceFileName
	.word	_Label_100
	.word	8		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_101
	.word	8
	.word	4
	.word	_Label_102
	.word	12
	.word	4
	.word	_Label_103
	.word	-12
	.word	4
	.word	_Label_104
	.word	-16
	.word	4
	.word	0
_Label_100:
	.ascii	"Sys_ChMode\0"
	.align
_Label_101:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_102:
	.byte	'I'
	.ascii	"mode\0"
	.align
_Label_103:
	.byte	'?'
	.ascii	"_temp_99\0"
	.align
_Label_104:
	.byte	'?'
	.ascii	"_temp_98\0"
	.align
! 
! ===============  FUNCTION Sys_Link  ===============
! 
_P_UserSystem_Sys_Link:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Link,r1
	push	r1
	mov	8,r1
_Label_478:
	push	r0
	sub	r1,1,r1
	bne	_Label_478
	mov	222,r13		! source line 222
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	223,r13		! source line 223
	mov	"\0\0RE",r10
!   _temp_106 = oldname		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-16]
!   _temp_107 = newname		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=16  sizeInBytes=4
	mov	16,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_106  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=_temp_107  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	223,r13		! source line 223
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_105  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-20]
!   ReturnResult: _temp_105  (sizeInBytes=4)
	load	[r14+-20],r1
	store	r1,[r14+8]
	add	r15,36,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Link:
	.word	_sourceFileName
	.word	_Label_108
	.word	8		! total size of parameters
	.word	32		! frame size = 32
	.word	_Label_109
	.word	8
	.word	4
	.word	_Label_110
	.word	12
	.word	4
	.word	_Label_111
	.word	-12
	.word	4
	.word	_Label_112
	.word	-16
	.word	4
	.word	_Label_113
	.word	-20
	.word	4
	.word	0
_Label_108:
	.ascii	"Sys_Link\0"
	.align
_Label_109:
	.byte	'P'
	.ascii	"oldname\0"
	.align
_Label_110:
	.byte	'P'
	.ascii	"newname\0"
	.align
_Label_111:
	.byte	'?'
	.ascii	"_temp_107\0"
	.align
_Label_112:
	.byte	'?'
	.ascii	"_temp_106\0"
	.align
_Label_113:
	.byte	'?'
	.ascii	"_temp_105\0"
	.align
! 
! ===============  FUNCTION Sys_Unlink  ===============
! 
_P_UserSystem_Sys_Unlink:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Unlink,r1
	push	r1
	mov	7,r1
_Label_479:
	push	r0
	sub	r1,1,r1
	bne	_Label_479
	mov	229,r13		! source line 229
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	230,r13		! source line 230
	mov	"\0\0RE",r10
!   _temp_115 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=17  sizeInBytes=4
	mov	17,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_115  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	230,r13		! source line 230
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_114  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_114  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Unlink:
	.word	_sourceFileName
	.word	_Label_116
	.word	4		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_117
	.word	8
	.word	4
	.word	_Label_118
	.word	-12
	.word	4
	.word	_Label_119
	.word	-16
	.word	4
	.word	0
_Label_116:
	.ascii	"Sys_Unlink\0"
	.align
_Label_117:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_118:
	.byte	'?'
	.ascii	"_temp_115\0"
	.align
_Label_119:
	.byte	'?'
	.ascii	"_temp_114\0"
	.align
! 
! ===============  FUNCTION Sys_Mkdir  ===============
! 
_P_UserSystem_Sys_Mkdir:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Mkdir,r1
	push	r1
	mov	7,r1
_Label_480:
	push	r0
	sub	r1,1,r1
	bne	_Label_480
	mov	235,r13		! source line 235
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	236,r13		! source line 236
	mov	"\0\0RE",r10
!   _temp_121 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=18  sizeInBytes=4
	mov	18,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_121  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	236,r13		! source line 236
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_120  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_120  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Mkdir:
	.word	_sourceFileName
	.word	_Label_122
	.word	4		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_123
	.word	8
	.word	4
	.word	_Label_124
	.word	-12
	.word	4
	.word	_Label_125
	.word	-16
	.word	4
	.word	0
_Label_122:
	.ascii	"Sys_Mkdir\0"
	.align
_Label_123:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_124:
	.byte	'?'
	.ascii	"_temp_121\0"
	.align
_Label_125:
	.byte	'?'
	.ascii	"_temp_120\0"
	.align
! 
! ===============  FUNCTION Sys_Rmdir  ===============
! 
_P_UserSystem_Sys_Rmdir:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Rmdir,r1
	push	r1
	mov	7,r1
_Label_481:
	push	r0
	sub	r1,1,r1
	bne	_Label_481
	mov	241,r13		! source line 241
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	242,r13		! source line 242
	mov	"\0\0RE",r10
!   _temp_127 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=19  sizeInBytes=4
	mov	19,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_127  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	242,r13		! source line 242
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_126  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_126  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Rmdir:
	.word	_sourceFileName
	.word	_Label_128
	.word	4		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_129
	.word	8
	.word	4
	.word	_Label_130
	.word	-12
	.word	4
	.word	_Label_131
	.word	-16
	.word	4
	.word	0
_Label_128:
	.ascii	"Sys_Rmdir\0"
	.align
_Label_129:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_130:
	.byte	'?'
	.ascii	"_temp_127\0"
	.align
_Label_131:
	.byte	'?'
	.ascii	"_temp_126\0"
	.align
! 
! ===============  FUNCTION Sys_Chdir  ===============
! 
_P_UserSystem_Sys_Chdir:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Chdir,r1
	push	r1
	mov	7,r1
_Label_482:
	push	r0
	sub	r1,1,r1
	bne	_Label_482
	mov	247,r13		! source line 247
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	248,r13		! source line 248
	mov	"\0\0RE",r10
!   _temp_133 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=20  sizeInBytes=4
	mov	20,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_133  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	248,r13		! source line 248
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_132  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_132  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Chdir:
	.word	_sourceFileName
	.word	_Label_134
	.word	4		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_135
	.word	8
	.word	4
	.word	_Label_136
	.word	-12
	.word	4
	.word	_Label_137
	.word	-16
	.word	4
	.word	0
_Label_134:
	.ascii	"Sys_Chdir\0"
	.align
_Label_135:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_136:
	.byte	'?'
	.ascii	"_temp_133\0"
	.align
_Label_137:
	.byte	'?'
	.ascii	"_temp_132\0"
	.align
! 
! ===============  FUNCTION Sys_Opendir  ===============
! 
_P_UserSystem_Sys_Opendir:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Opendir,r1
	push	r1
	mov	7,r1
_Label_483:
	push	r0
	sub	r1,1,r1
	bne	_Label_483
	mov	253,r13		! source line 253
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	254,r13		! source line 254
	mov	"\0\0RE",r10
!   _temp_139 = filename		(4 bytes)
	load	[r14+8],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=21  sizeInBytes=4
	mov	21,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_139  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	254,r13		! source line 254
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_138  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_138  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Opendir:
	.word	_sourceFileName
	.word	_Label_140
	.word	4		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_141
	.word	8
	.word	4
	.word	_Label_142
	.word	-12
	.word	4
	.word	_Label_143
	.word	-16
	.word	4
	.word	0
_Label_140:
	.ascii	"Sys_Opendir\0"
	.align
_Label_141:
	.byte	'P'
	.ascii	"filename\0"
	.align
_Label_142:
	.byte	'?'
	.ascii	"_temp_139\0"
	.align
_Label_143:
	.byte	'?'
	.ascii	"_temp_138\0"
	.align
! 
! ===============  FUNCTION Sys_Readdir  ===============
! 
_P_UserSystem_Sys_Readdir:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Sys_Readdir,r1
	push	r1
	mov	7,r1
_Label_484:
	push	r0
	sub	r1,1,r1
	bne	_Label_484
	mov	259,r13		! source line 259
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	260,r13		! source line 260
	mov	"\0\0RE",r10
!   _temp_145 = entPtr		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=22  sizeInBytes=4
	mov	22,r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=dfd  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=_temp_145  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+8]
!   Prepare Argument: offset=20  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+12]
!   Prepare Argument: offset=24  value=0  sizeInBytes=4
	mov	0,r1
	store	r1,[r15+16]
!   Call the function
	mov	260,r13		! source line 260
	mov	"\0\0CE",r10
	call	DoSyscall
!   Retrieve Result: targetName=_temp_144  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
!   ReturnResult: _temp_144  (sizeInBytes=4)
	load	[r14+-16],r1
	store	r1,[r14+8]
	add	r15,32,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Sys_Readdir:
	.word	_sourceFileName
	.word	_Label_146
	.word	8		! total size of parameters
	.word	28		! frame size = 28
	.word	_Label_147
	.word	8
	.word	4
	.word	_Label_148
	.word	12
	.word	4
	.word	_Label_149
	.word	-12
	.word	4
	.word	_Label_150
	.word	-16
	.word	4
	.word	0
_Label_146:
	.ascii	"Sys_Readdir\0"
	.align
_Label_147:
	.byte	'I'
	.ascii	"dfd\0"
	.align
_Label_148:
	.byte	'P'
	.ascii	"entPtr\0"
	.align
_Label_149:
	.byte	'?'
	.ascii	"_temp_145\0"
	.align
_Label_150:
	.byte	'?'
	.ascii	"_temp_144\0"
	.align
! 
! ===============  FUNCTION StrEqual  ===============
! 
_P_UserSystem_StrEqual:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_StrEqual,r1
	push	r1
	mov	9,r1
_Label_485:
	push	r0
	sub	r1,1,r1
	bne	_Label_485
	mov	265,r13		! source line 265
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	271,r13		! source line 271
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_153 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-40]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_154 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-36]
!   if _temp_153 == _temp_154 then goto _Label_152		(int)
	load	[r14+-40],r1
	load	[r14+-36],r2
	cmp	r1,r2
	be	_Label_152
!	_Label_151	jmp	_Label_151
_Label_151:
! THEN...
	mov	272,r13		! source line 272
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	272,r13		! source line 272
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=1)
	mov	0,r1
	storeb	r1,[r14+8]
	add	r15,40,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_152:
! FOR STATEMENT...
	mov	274,r13		! source line 274
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_159 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-32]
!   Calculate and save the FOR-LOOP ending value
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_161 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-24]
!   _temp_160 = _temp_161 - 1		(int)
	load	[r14+-24],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-28]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_159  (sizeInBytes=4)
	load	[r14+-32],r1
	store	r1,[r14+-44]
_Label_155:
!   Perform the FOR-LOOP termination test
!   if i > _temp_160 then goto _Label_158		
	load	[r14+-44],r1
	load	[r14+-28],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_158
_Label_156:
	mov	274,r13		! source line 274
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	275,r13		! source line 275
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_165
!     make sure index expr is >= 0
	load	[r14+-44],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+8],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-20]
!   Data Move: _temp_164 = *_temp_165  (sizeInBytes=1)
	load	[r14+-20],r1
	loadb	[r1],r1
	storeb	r1,[r14+-11]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s2 [i ] into _temp_167
!     make sure index expr is >= 0
	load	[r14+-44],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+12],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-16]
!   Data Move: _temp_166 = *_temp_167  (sizeInBytes=1)
	load	[r14+-16],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
!   _temp_168 = _temp_164 XOR _temp_166		(bool)
	loadb	[r14+-11],r1
	loadb	[r14+-10],r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_168 then goto _Label_162 else goto _Label_163
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_163
	jmp	_Label_162
_Label_162:
! THEN...
	mov	276,r13		! source line 276
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	276,r13		! source line 276
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=1)
	mov	0,r1
	storeb	r1,[r14+8]
	add	r15,40,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_163:
!   Increment the FOR-LOOP index variable and jump back
_Label_157:
!   i = i + 1
	load	[r14+-44],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-44]
	jmp	_Label_155
! END FOR
_Label_158:
! RETURN STATEMENT...
	mov	279,r13		! source line 279
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=1)
	mov	1,r1
	storeb	r1,[r14+8]
	add	r15,40,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_StrEqual:
	.word	_sourceFileName
	.word	_Label_169
	.word	8		! total size of parameters
	.word	36		! frame size = 36
	.word	_Label_170
	.word	8
	.word	4
	.word	_Label_171
	.word	12
	.word	4
	.word	_Label_172
	.word	-9
	.word	1
	.word	_Label_173
	.word	-16
	.word	4
	.word	_Label_174
	.word	-10
	.word	1
	.word	_Label_175
	.word	-20
	.word	4
	.word	_Label_176
	.word	-11
	.word	1
	.word	_Label_177
	.word	-24
	.word	4
	.word	_Label_178
	.word	-28
	.word	4
	.word	_Label_179
	.word	-32
	.word	4
	.word	_Label_180
	.word	-36
	.word	4
	.word	_Label_181
	.word	-40
	.word	4
	.word	_Label_182
	.word	-44
	.word	4
	.word	0
_Label_169:
	.ascii	"StrEqual\0"
	.align
_Label_170:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_171:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_172:
	.byte	'C'
	.ascii	"_temp_168\0"
	.align
_Label_173:
	.byte	'?'
	.ascii	"_temp_167\0"
	.align
_Label_174:
	.byte	'C'
	.ascii	"_temp_166\0"
	.align
_Label_175:
	.byte	'?'
	.ascii	"_temp_165\0"
	.align
_Label_176:
	.byte	'C'
	.ascii	"_temp_164\0"
	.align
_Label_177:
	.byte	'?'
	.ascii	"_temp_161\0"
	.align
_Label_178:
	.byte	'?'
	.ascii	"_temp_160\0"
	.align
_Label_179:
	.byte	'?'
	.ascii	"_temp_159\0"
	.align
_Label_180:
	.byte	'?'
	.ascii	"_temp_154\0"
	.align
_Label_181:
	.byte	'?'
	.ascii	"_temp_153\0"
	.align
_Label_182:
	.byte	'I'
	.ascii	"i\0"
	.align
! 
! ===============  FUNCTION StrCopy  ===============
! 
_P_UserSystem_StrCopy:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_StrCopy,r1
	push	r1
	mov	11,r1
_Label_486:
	push	r0
	sub	r1,1,r1
	bne	_Label_486
	mov	284,r13		! source line 284
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	298,r13		! source line 298
	mov	"\0\0AS",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_183 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-36]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_184 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_183  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_184  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+4]
!   Call the function
	mov	298,r13		! source line 298
	mov	"\0\0CA",r10
	call	_P_UserSystem_Min
!   Retrieve Result: targetName=sz  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-44]
! FOR STATEMENT...
	mov	299,r13		! source line 299
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_189 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-28]
!   Calculate and save the FOR-LOOP ending value
!   _temp_190 = sz - 1		(int)
	load	[r14+-44],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-24]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_189  (sizeInBytes=4)
	load	[r14+-28],r1
	store	r1,[r14+-40]
_Label_185:
!   Perform the FOR-LOOP termination test
!   if i > _temp_190 then goto _Label_188		
	load	[r14+-40],r1
	load	[r14+-24],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_188
_Label_186:
	mov	299,r13		! source line 299
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	300,r13		! source line 300
	mov	"\0\0AS",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_191
!     make sure index expr is >= 0
	load	[r14+-40],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+8],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-20]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s2 [i ] into _temp_193
!     make sure index expr is >= 0
	load	[r14+-40],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+12],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-16]
!   Data Move: _temp_192 = *_temp_193  (sizeInBytes=1)
	load	[r14+-16],r1
	loadb	[r1],r1
	storeb	r1,[r14+-9]
!   Data Move: *_temp_191 = _temp_192  (sizeInBytes=1)
	loadb	[r14+-9],r1
	load	[r14+-20],r2
	storeb	r1,[r2]
!   Increment the FOR-LOOP index variable and jump back
_Label_187:
!   i = i + 1
	load	[r14+-40],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-40]
	jmp	_Label_185
! END FOR
_Label_188:
! RETURN STATEMENT...
	mov	299,r13		! source line 299
	mov	"\0\0RE",r10
	add	r15,48,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_StrCopy:
	.word	_sourceFileName
	.word	_Label_194
	.word	8		! total size of parameters
	.word	44		! frame size = 44
	.word	_Label_195
	.word	8
	.word	4
	.word	_Label_196
	.word	12
	.word	4
	.word	_Label_197
	.word	-16
	.word	4
	.word	_Label_198
	.word	-9
	.word	1
	.word	_Label_199
	.word	-20
	.word	4
	.word	_Label_200
	.word	-24
	.word	4
	.word	_Label_201
	.word	-28
	.word	4
	.word	_Label_202
	.word	-32
	.word	4
	.word	_Label_203
	.word	-36
	.word	4
	.word	_Label_204
	.word	-40
	.word	4
	.word	_Label_205
	.word	-44
	.word	4
	.word	0
_Label_194:
	.ascii	"StrCopy\0"
	.align
_Label_195:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_196:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_197:
	.byte	'?'
	.ascii	"_temp_193\0"
	.align
_Label_198:
	.byte	'C'
	.ascii	"_temp_192\0"
	.align
_Label_199:
	.byte	'?'
	.ascii	"_temp_191\0"
	.align
_Label_200:
	.byte	'?'
	.ascii	"_temp_190\0"
	.align
_Label_201:
	.byte	'?'
	.ascii	"_temp_189\0"
	.align
_Label_202:
	.byte	'?'
	.ascii	"_temp_184\0"
	.align
_Label_203:
	.byte	'?'
	.ascii	"_temp_183\0"
	.align
_Label_204:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_205:
	.byte	'I'
	.ascii	"sz\0"
	.align
! 
! ===============  FUNCTION StrCmp  ===============
! 
_P_UserSystem_StrCmp:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_StrCmp,r1
	push	r1
	mov	21,r1
_Label_487:
	push	r0
	sub	r1,1,r1
	bne	_Label_487
	mov	306,r13		! source line 306
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! sz
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_206 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-76]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_207 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-72]
!   Prepare Argument: offset=8  value=_temp_206  sizeInBytes=4
	load	[r14+-76],r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_207  sizeInBytes=4
	load	[r14+-72],r1
	store	r1,[r15+4]
!   Call the function
	mov	315,r13		! source line 315
	mov	"\0\0CA",r10
	call	_P_UserSystem_Min
!   Retrieve Result: targetName=sz  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-80]
! FOR STATEMENT...
	mov	317,r13		! source line 317
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_212 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-68]
!   Calculate and save the FOR-LOOP ending value
!   _temp_213 = sz - 1		(int)
	load	[r14+-80],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-64]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_212  (sizeInBytes=4)
	load	[r14+-68],r1
	store	r1,[r14+-84]
_Label_208:
!   Perform the FOR-LOOP termination test
!   if i > _temp_213 then goto _Label_211		
	load	[r14+-84],r1
	load	[r14+-64],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_211
_Label_209:
	mov	317,r13		! source line 317
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	318,r13		! source line 318
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_218
!     make sure index expr is >= 0
	load	[r14+-84],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+8],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-56]
!   Data Move: _temp_217 = *_temp_218  (sizeInBytes=1)
	load	[r14+-56],r1
	loadb	[r1],r1
	storeb	r1,[r14+-12]
!   _temp_216 = charToInt (_temp_217)
	loadb	[r14+-12],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-60]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s2 [i ] into _temp_221
!     make sure index expr is >= 0
	load	[r14+-84],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+12],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-48]
!   Data Move: _temp_220 = *_temp_221  (sizeInBytes=1)
	load	[r14+-48],r1
	loadb	[r1],r1
	storeb	r1,[r14+-11]
!   _temp_219 = charToInt (_temp_220)
	loadb	[r14+-11],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-52]
!   if _temp_216 >= _temp_219 then goto _Label_215		(int)
	load	[r14+-60],r1
	load	[r14+-52],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_215
!	_Label_214	jmp	_Label_214
_Label_214:
! THEN...
	mov	319,r13		! source line 319
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	319,r13		! source line 319
	mov	"\0\0RE",r10
!   ReturnResult: -1  (sizeInBytes=4)
	mov	-1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_222
_Label_215:
! ELSE...
	mov	320,r13		! source line 320
	mov	"\0\0EL",r10
! IF STATEMENT...
	mov	320,r13		! source line 320
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_227
!     make sure index expr is >= 0
	load	[r14+-84],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+8],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-40]
!   Data Move: _temp_226 = *_temp_227  (sizeInBytes=1)
	load	[r14+-40],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
!   _temp_225 = charToInt (_temp_226)
	loadb	[r14+-10],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-44]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s2 [i ] into _temp_230
!     make sure index expr is >= 0
	load	[r14+-84],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	load	[r14+12],r1
	load	[r1],r3
	cmp	r3,0
	ble	_runtimeErrorUninitializedArray
	cmp	r2,r3
	bvs	_runtimeErrorOverflow
	bge	_runtimeErrorBadArrayIndex
!     compute address of array element
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-32]
!   Data Move: _temp_229 = *_temp_230  (sizeInBytes=1)
	load	[r14+-32],r1
	loadb	[r1],r1
	storeb	r1,[r14+-9]
!   _temp_228 = charToInt (_temp_229)
	loadb	[r14+-9],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-36]
!   if _temp_225 <= _temp_228 then goto _Label_224		(int)
	load	[r14+-44],r1
	load	[r14+-36],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_224
!	_Label_223	jmp	_Label_223
_Label_223:
! THEN...
	mov	321,r13		! source line 321
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	321,r13		! source line 321
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=4)
	mov	1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_224:
! END IF...
_Label_222:
!   Increment the FOR-LOOP index variable and jump back
_Label_210:
!   i = i + 1
	load	[r14+-84],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-84]
	jmp	_Label_208
! END FOR
_Label_211:
! IF STATEMENT...
	mov	324,r13		! source line 324
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_233 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-28]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_234 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-24]
!   if _temp_233 >= _temp_234 then goto _Label_232		(int)
	load	[r14+-28],r1
	load	[r14+-24],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_232
!	_Label_231	jmp	_Label_231
_Label_231:
! THEN...
	mov	325,r13		! source line 325
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	325,r13		! source line 325
	mov	"\0\0RE",r10
!   ReturnResult: -1  (sizeInBytes=4)
	mov	-1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_235
_Label_232:
! ELSE...
	mov	326,r13		! source line 326
	mov	"\0\0EL",r10
! IF STATEMENT...
	mov	326,r13		! source line 326
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_238 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-20]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_239 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-16]
!   if _temp_238 <= _temp_239 then goto _Label_237		(int)
	load	[r14+-20],r1
	load	[r14+-16],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_237
!	_Label_236	jmp	_Label_236
_Label_236:
! THEN...
	mov	327,r13		! source line 327
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	327,r13		! source line 327
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=4)
	mov	1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_240
_Label_237:
! ELSE...
	mov	329,r13		! source line 329
	mov	"\0\0EL",r10
! RETURN STATEMENT...
	mov	329,r13		! source line 329
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=4)
	mov	0,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_240:
! END IF...
_Label_235:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_StrCmp:
	.word	_sourceFileName
	.word	_Label_241
	.word	8		! total size of parameters
	.word	84		! frame size = 84
	.word	_Label_242
	.word	8
	.word	4
	.word	_Label_243
	.word	12
	.word	4
	.word	_Label_244
	.word	-16
	.word	4
	.word	_Label_245
	.word	-20
	.word	4
	.word	_Label_246
	.word	-24
	.word	4
	.word	_Label_247
	.word	-28
	.word	4
	.word	_Label_248
	.word	-32
	.word	4
	.word	_Label_249
	.word	-9
	.word	1
	.word	_Label_250
	.word	-36
	.word	4
	.word	_Label_251
	.word	-40
	.word	4
	.word	_Label_252
	.word	-10
	.word	1
	.word	_Label_253
	.word	-44
	.word	4
	.word	_Label_254
	.word	-48
	.word	4
	.word	_Label_255
	.word	-11
	.word	1
	.word	_Label_256
	.word	-52
	.word	4
	.word	_Label_257
	.word	-56
	.word	4
	.word	_Label_258
	.word	-12
	.word	1
	.word	_Label_259
	.word	-60
	.word	4
	.word	_Label_260
	.word	-64
	.word	4
	.word	_Label_261
	.word	-68
	.word	4
	.word	_Label_262
	.word	-72
	.word	4
	.word	_Label_263
	.word	-76
	.word	4
	.word	_Label_264
	.word	-80
	.word	4
	.word	_Label_265
	.word	-84
	.word	4
	.word	0
_Label_241:
	.ascii	"StrCmp\0"
	.align
_Label_242:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_243:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_244:
	.byte	'?'
	.ascii	"_temp_239\0"
	.align
_Label_245:
	.byte	'?'
	.ascii	"_temp_238\0"
	.align
_Label_246:
	.byte	'?'
	.ascii	"_temp_234\0"
	.align
_Label_247:
	.byte	'?'
	.ascii	"_temp_233\0"
	.align
_Label_248:
	.byte	'?'
	.ascii	"_temp_230\0"
	.align
_Label_249:
	.byte	'C'
	.ascii	"_temp_229\0"
	.align
_Label_250:
	.byte	'?'
	.ascii	"_temp_228\0"
	.align
_Label_251:
	.byte	'?'
	.ascii	"_temp_227\0"
	.align
_Label_252:
	.byte	'C'
	.ascii	"_temp_226\0"
	.align
_Label_253:
	.byte	'?'
	.ascii	"_temp_225\0"
	.align
_Label_254:
	.byte	'?'
	.ascii	"_temp_221\0"
	.align
_Label_255:
	.byte	'C'
	.ascii	"_temp_220\0"
	.align
_Label_256:
	.byte	'?'
	.ascii	"_temp_219\0"
	.align
_Label_257:
	.byte	'?'
	.ascii	"_temp_218\0"
	.align
_Label_258:
	.byte	'C'
	.ascii	"_temp_217\0"
	.align
_Label_259:
	.byte	'?'
	.ascii	"_temp_216\0"
	.align
_Label_260:
	.byte	'?'
	.ascii	"_temp_213\0"
	.align
_Label_261:
	.byte	'?'
	.ascii	"_temp_212\0"
	.align
_Label_262:
	.byte	'?'
	.ascii	"_temp_207\0"
	.align
_Label_263:
	.byte	'?'
	.ascii	"_temp_206\0"
	.align
_Label_264:
	.byte	'I'
	.ascii	"sz\0"
	.align
_Label_265:
	.byte	'I'
	.ascii	"i\0"
	.align
! 
! ===============  FUNCTION Min  ===============
! 
_P_UserSystem_Min:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Min,r1
	push	r1
	mov	335,r13		! source line 335
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	336,r13		! source line 336
	mov	"\0\0IF",r10
!   if i >= j then goto _Label_267		(int)
	load	[r14+8],r1
	load	[r14+12],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_267
!	_Label_266	jmp	_Label_266
_Label_266:
! THEN...
	mov	337,r13		! source line 337
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	337,r13		! source line 337
	mov	"\0\0RE",r10
!   ReturnResult: i  (sizeInBytes=4)
	load	[r14+8],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_268
_Label_267:
! ELSE...
	mov	339,r13		! source line 339
	mov	"\0\0EL",r10
! RETURN STATEMENT...
	mov	339,r13		! source line 339
	mov	"\0\0RE",r10
!   ReturnResult: j  (sizeInBytes=4)
	load	[r14+12],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_268:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Min:
	.word	_sourceFileName
	.word	_Label_269
	.word	8		! total size of parameters
	.word	0		! frame size = 0
	.word	_Label_270
	.word	8
	.word	4
	.word	_Label_271
	.word	12
	.word	4
	.word	0
_Label_269:
	.ascii	"Min\0"
	.align
_Label_270:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_271:
	.byte	'I'
	.ascii	"j\0"
	.align
! 
! ===============  FUNCTION Max  ===============
! 
_P_UserSystem_Max:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_Max,r1
	push	r1
	mov	345,r13		! source line 345
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	346,r13		! source line 346
	mov	"\0\0IF",r10
!   if i <= j then goto _Label_273		(int)
	load	[r14+8],r1
	load	[r14+12],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_273
!	_Label_272	jmp	_Label_272
_Label_272:
! THEN...
	mov	347,r13		! source line 347
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	347,r13		! source line 347
	mov	"\0\0RE",r10
!   ReturnResult: i  (sizeInBytes=4)
	load	[r14+8],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_274
_Label_273:
! ELSE...
	mov	349,r13		! source line 349
	mov	"\0\0EL",r10
! RETURN STATEMENT...
	mov	349,r13		! source line 349
	mov	"\0\0RE",r10
!   ReturnResult: j  (sizeInBytes=4)
	load	[r14+12],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_274:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_Max:
	.word	_sourceFileName
	.word	_Label_275
	.word	8		! total size of parameters
	.word	0		! frame size = 0
	.word	_Label_276
	.word	8
	.word	4
	.word	_Label_277
	.word	12
	.word	4
	.word	0
_Label_275:
	.ascii	"Max\0"
	.align
_Label_276:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_277:
	.byte	'I'
	.ascii	"j\0"
	.align
! 
! ===============  FUNCTION printIntVar  ===============
! 
_P_UserSystem_printIntVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_printIntVar,r1
	push	r1
	mov	2,r1
_Label_488:
	push	r0
	sub	r1,1,r1
	bne	_Label_488
	mov	355,r13		! source line 355
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	363,r13		! source line 363
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_278 = _StringConst_1
	set	_StringConst_1,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_278  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	364,r13		! source line 364
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=i  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+0]
!   Call the function
	mov	365,r13		! source line 365
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   Call the function
	mov	366,r13		! source line 366
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! RETURN STATEMENT...
	mov	366,r13		! source line 366
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_printIntVar:
	.word	_sourceFileName
	.word	_Label_279
	.word	8		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_280
	.word	8
	.word	4
	.word	_Label_281
	.word	12
	.word	4
	.word	_Label_282
	.word	-12
	.word	4
	.word	0
_Label_279:
	.ascii	"printIntVar\0"
	.align
_Label_280:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_281:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_282:
	.byte	'?'
	.ascii	"_temp_278\0"
	.align
! 
! ===============  FUNCTION printHexVar  ===============
! 
_P_UserSystem_printHexVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_printHexVar,r1
	push	r1
	mov	2,r1
_Label_489:
	push	r0
	sub	r1,1,r1
	bne	_Label_489
	mov	371,r13		! source line 371
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	379,r13		! source line 379
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_283 = _StringConst_2
	set	_StringConst_2,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_283  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	380,r13		! source line 380
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=i  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+0]
!   Call the function
	mov	381,r13		! source line 381
	mov	"\0\0CE",r10
	call	printHex
! CALL STATEMENT...
!   Call the function
	mov	382,r13		! source line 382
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! RETURN STATEMENT...
	mov	382,r13		! source line 382
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_printHexVar:
	.word	_sourceFileName
	.word	_Label_284
	.word	8		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_285
	.word	8
	.word	4
	.word	_Label_286
	.word	12
	.word	4
	.word	_Label_287
	.word	-12
	.word	4
	.word	0
_Label_284:
	.ascii	"printHexVar\0"
	.align
_Label_285:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_286:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_287:
	.byte	'?'
	.ascii	"_temp_283\0"
	.align
! 
! ===============  FUNCTION printBoolVar  ===============
! 
_P_UserSystem_printBoolVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_printBoolVar,r1
	push	r1
	mov	2,r1
_Label_490:
	push	r0
	sub	r1,1,r1
	bne	_Label_490
	mov	387,r13		! source line 387
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	395,r13		! source line 395
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_288 = _StringConst_3
	set	_StringConst_3,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_288  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	396,r13		! source line 396
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=b  sizeInBytes=1
	loadb	[r14+12],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	397,r13		! source line 397
	mov	"\0\0CE",r10
	call	printBool
! CALL STATEMENT...
!   Call the function
	mov	398,r13		! source line 398
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! RETURN STATEMENT...
	mov	398,r13		! source line 398
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_printBoolVar:
	.word	_sourceFileName
	.word	_Label_289
	.word	8		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_290
	.word	8
	.word	4
	.word	_Label_291
	.word	12
	.word	1
	.word	_Label_292
	.word	-12
	.word	4
	.word	0
_Label_289:
	.ascii	"printBoolVar\0"
	.align
_Label_290:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_291:
	.byte	'B'
	.ascii	"b\0"
	.align
_Label_292:
	.byte	'?'
	.ascii	"_temp_288\0"
	.align
! 
! ===============  FUNCTION printCharVar  ===============
! 
_P_UserSystem_printCharVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_printCharVar,r1
	push	r1
	mov	3,r1
_Label_491:
	push	r0
	sub	r1,1,r1
	bne	_Label_491
	mov	403,r13		! source line 403
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	411,r13		! source line 411
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_293 = _StringConst_4
	set	_StringConst_4,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_293  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	412,r13		! source line 412
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=c  sizeInBytes=1
	loadb	[r14+12],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	413,r13		! source line 413
	mov	"\0\0CE",r10
	call	printChar
! CALL STATEMENT...
!   _temp_294 = _StringConst_5
	set	_StringConst_5,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_294  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	414,r13		! source line 414
	mov	"\0\0CE",r10
	call	print
! RETURN STATEMENT...
	mov	414,r13		! source line 414
	mov	"\0\0RE",r10
	add	r15,16,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_printCharVar:
	.word	_sourceFileName
	.word	_Label_295
	.word	8		! total size of parameters
	.word	12		! frame size = 12
	.word	_Label_296
	.word	8
	.word	4
	.word	_Label_297
	.word	12
	.word	1
	.word	_Label_298
	.word	-12
	.word	4
	.word	_Label_299
	.word	-16
	.word	4
	.word	0
_Label_295:
	.ascii	"printCharVar\0"
	.align
_Label_296:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_297:
	.byte	'C'
	.ascii	"c\0"
	.align
_Label_298:
	.byte	'?'
	.ascii	"_temp_294\0"
	.align
_Label_299:
	.byte	'?'
	.ascii	"_temp_293\0"
	.align
! 
! ===============  FUNCTION printPtr  ===============
! 
_P_UserSystem_printPtr:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_printPtr,r1
	push	r1
	mov	3,r1
_Label_492:
	push	r0
	sub	r1,1,r1
	bne	_Label_492
	mov	419,r13		! source line 419
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	427,r13		! source line 427
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_300 = _StringConst_6
	set	_StringConst_6,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_300  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	428,r13		! source line 428
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_301 = p		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_301  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	429,r13		! source line 429
	mov	"\0\0CE",r10
	call	printHex
! CALL STATEMENT...
!   Call the function
	mov	430,r13		! source line 430
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! RETURN STATEMENT...
	mov	430,r13		! source line 430
	mov	"\0\0RE",r10
	add	r15,16,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_printPtr:
	.word	_sourceFileName
	.word	_Label_302
	.word	8		! total size of parameters
	.word	12		! frame size = 12
	.word	_Label_303
	.word	8
	.word	4
	.word	_Label_304
	.word	12
	.word	4
	.word	_Label_305
	.word	-12
	.word	4
	.word	_Label_306
	.word	-16
	.word	4
	.word	0
_Label_302:
	.ascii	"printPtr\0"
	.align
_Label_303:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_304:
	.byte	'P'
	.ascii	"p\0"
	.align
_Label_305:
	.byte	'?'
	.ascii	"_temp_301\0"
	.align
_Label_306:
	.byte	'?'
	.ascii	"_temp_300\0"
	.align
! 
! ===============  FUNCTION nl  ===============
! 
_P_UserSystem_nl:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_nl,r1
	push	r1
	mov	1,r1
_Label_493:
	push	r0
	sub	r1,1,r1
	bne	_Label_493
	mov	435,r13		! source line 435
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=10  sizeInBytes=1
	mov	10,r1
	storeb	r1,[r15+0]
!   Call the function
	mov	436,r13		! source line 436
	mov	"\0\0CE",r10
	call	printChar
! RETURN STATEMENT...
	mov	436,r13		! source line 436
	mov	"\0\0RE",r10
	add	r15,8,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_nl:
	.word	_sourceFileName
	.word	_Label_307
	.word	0		! total size of parameters
	.word	4		! frame size = 4
	.word	0
_Label_307:
	.ascii	"nl\0"
	.align
! 
! ===============  FUNCTION printNullTerminatedString  ===============
! 
_function_25_printNullTerminatedString:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_25_printNullTerminatedString,r1
	push	r1
	mov	2,r1
_Label_494:
	push	r0
	sub	r1,1,r1
	bne	_Label_494
	mov	441,r13		! source line 441
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! WHILE STATEMENT...
	mov	447,r13		! source line 447
	mov	"\0\0WH",r10
_Label_308:
!	_Label_309	jmp	_Label_309
_Label_309:
	mov	447,r13		! source line 447
	mov	"\0\0WB",r10
! ASSIGNMENT STATEMENT...
	mov	448,r13		! source line 448
	mov	"\0\0AS",r10
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: ch = *p  (sizeInBytes=1)
	load	[r14+8],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
! IF STATEMENT...
	mov	449,r13		! source line 449
	mov	"\0\0IF",r10
!   _temp_313 = ch XOR 0		(bool)
	loadb	[r14+-10],r1
	mov	0,r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_313 then goto _Label_312 else goto _Label_311
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_311
	jmp	_Label_312
_Label_311:
! THEN...
	mov	450,r13		! source line 450
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	450,r13		! source line 450
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_312:
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=ch  sizeInBytes=1
	loadb	[r14+-10],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	452,r13		! source line 452
	mov	"\0\0CE",r10
	call	printChar
! ASSIGNMENT STATEMENT...
	mov	453,r13		! source line 453
	mov	"\0\0AS",r10
!   p = p + 1		(int)
	load	[r14+8],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! END WHILE...
	jmp	_Label_308
_Label_310:
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_25_printNullTerminatedString:
	.word	_sourceFileName
	.word	_Label_314
	.word	4		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_315
	.word	8
	.word	4
	.word	_Label_316
	.word	-9
	.word	1
	.word	_Label_317
	.word	-10
	.word	1
	.word	0
_Label_314:
	.ascii	"printNullTerminatedString\0"
	.align
_Label_315:
	.byte	'P'
	.ascii	"p\0"
	.align
_Label_316:
	.byte	'C'
	.ascii	"_temp_313\0"
	.align
_Label_317:
	.byte	'C'
	.ascii	"ch\0"
	.align
! 
! ===============  FUNCTION MemoryEqual  ===============
! 
_P_UserSystem_MemoryEqual:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_MemoryEqual,r1
	push	r1
	mov	4,r1
_Label_495:
	push	r0
	sub	r1,1,r1
	bne	_Label_495
	mov	459,r13		! source line 459
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! FOR STATEMENT...
	mov	464,r13		! source line 464
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_322 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-20]
!   Calculate and save the FOR-LOOP ending value
!   _temp_323 = len - 1		(int)
	load	[r14+16],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-16]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_322  (sizeInBytes=4)
	load	[r14+-20],r1
	store	r1,[r14+-24]
_Label_318:
!   Perform the FOR-LOOP termination test
!   if i > _temp_323 then goto _Label_321		
	load	[r14+-24],r1
	load	[r14+-16],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_321
_Label_319:
	mov	464,r13		! source line 464
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	465,r13		! source line 465
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_326 = *s1  (sizeInBytes=1)
	load	[r14+8],r1
	loadb	[r1],r1
	storeb	r1,[r14+-11]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_327 = *s2  (sizeInBytes=1)
	load	[r14+12],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
!   _temp_328 = _temp_326 XOR _temp_327		(bool)
	loadb	[r14+-11],r1
	loadb	[r14+-10],r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_328 then goto _Label_324 else goto _Label_325
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_325
	jmp	_Label_324
_Label_324:
! THEN...
	mov	466,r13		! source line 466
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	466,r13		! source line 466
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=1)
	mov	0,r1
	storeb	r1,[r14+8]
	add	r15,20,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_325:
! ASSIGNMENT STATEMENT...
	mov	468,r13		! source line 468
	mov	"\0\0AS",r10
!   s1 = s1 + 1		(int)
	load	[r14+8],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! ASSIGNMENT STATEMENT...
	mov	469,r13		! source line 469
	mov	"\0\0AS",r10
!   s2 = s2 + 1		(int)
	load	[r14+12],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+12]
!   Increment the FOR-LOOP index variable and jump back
_Label_320:
!   i = i + 1
	load	[r14+-24],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-24]
	jmp	_Label_318
! END FOR
_Label_321:
! RETURN STATEMENT...
	mov	471,r13		! source line 471
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=1)
	mov	1,r1
	storeb	r1,[r14+8]
	add	r15,20,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_MemoryEqual:
	.word	_sourceFileName
	.word	_Label_329
	.word	12		! total size of parameters
	.word	16		! frame size = 16
	.word	_Label_330
	.word	8
	.word	4
	.word	_Label_331
	.word	12
	.word	4
	.word	_Label_332
	.word	16
	.word	4
	.word	_Label_333
	.word	-9
	.word	1
	.word	_Label_334
	.word	-10
	.word	1
	.word	_Label_335
	.word	-11
	.word	1
	.word	_Label_336
	.word	-16
	.word	4
	.word	_Label_337
	.word	-20
	.word	4
	.word	_Label_338
	.word	-24
	.word	4
	.word	0
_Label_329:
	.ascii	"MemoryEqual\0"
	.align
_Label_330:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_331:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_332:
	.byte	'I'
	.ascii	"len\0"
	.align
_Label_333:
	.byte	'C'
	.ascii	"_temp_328\0"
	.align
_Label_334:
	.byte	'C'
	.ascii	"_temp_327\0"
	.align
_Label_335:
	.byte	'C'
	.ascii	"_temp_326\0"
	.align
_Label_336:
	.byte	'?'
	.ascii	"_temp_323\0"
	.align
_Label_337:
	.byte	'?'
	.ascii	"_temp_322\0"
	.align
_Label_338:
	.byte	'I'
	.ascii	"i\0"
	.align
! 
! ===============  FUNCTION KPLSystemInitialize  ===============
! 
_P_UserSystem_KPLSystemInitialize:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_KPLSystemInitialize,r1
	push	r1
	mov	1,r1
_Label_496:
	push	r0
	sub	r1,1,r1
	bne	_Label_496
	mov	497,r13		! source line 497
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! p
!   p = &_Global_memoryArea
	set	_Global_memoryArea,r1
	store	r1,[r14+-12]
! ASSIGNMENT STATEMENT...
	mov	502,r13		! source line 502
	mov	"\0\0AS",r10
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: *p = 20000  (sizeInBytes=4)
	mov	20000,r1
	load	[r14+-12],r2
	store	r1,[r2]
! RETURN STATEMENT...
	mov	502,r13		! source line 502
	mov	"\0\0RE",r10
	add	r15,8,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_KPLSystemInitialize:
	.word	_sourceFileName
	.word	_Label_339
	.word	0		! total size of parameters
	.word	4		! frame size = 4
	.word	_Label_340
	.word	-12
	.word	4
	.word	0
_Label_339:
	.ascii	"KPLSystemInitialize\0"
	.align
_Label_340:
	.byte	'P'
	.ascii	"p\0"
	.align
! 
! ===============  FUNCTION KPLMemoryAlloc  ===============
! 
_P_UserSystem_KPLMemoryAlloc:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_KPLMemoryAlloc,r1
	push	r1
	mov	13,r1
_Label_497:
	push	r0
	sub	r1,1,r1
	bne	_Label_497
	mov	507,r13		! source line 507
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	525,r13		! source line 525
	mov	"\0\0IF",r10
!   if _Global_alreadyInAlloc then goto _Label_341 else goto _Label_342
	set	_Global_alreadyInAlloc,r1
	loadb	[r1],r1
	cmp	r1,0
	be	_Label_342
	jmp	_Label_341
_Label_341:
! THEN...
	mov	526,r13		! source line 526
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_343 = _StringConst_7
	set	_StringConst_7,r1
	store	r1,[r14+-48]
!   Prepare Argument: offset=8  value=_temp_343  sizeInBytes=4
	load	[r14+-48],r1
	store	r1,[r15+0]
!   Call the function
	mov	526,r13		! source line 526
	mov	"\0\0CA",r10
	call	_P_UserSystem_KPLSystemError
! END IF...
_Label_342:
! ASSIGNMENT STATEMENT...
	mov	528,r13		! source line 528
	mov	"\0\0AS",r10
!   _Global_alreadyInAlloc = 1		(1 byte)
	mov	1,r1
	set	_Global_alreadyInAlloc,r2
	storeb	r1,[r2]
! ASSIGNMENT STATEMENT...
	mov	530,r13		! source line 530
	mov	"\0\0AS",r10
!   i = _Global_nextCharToUse		(4 bytes)
	set	_Global_nextCharToUse,r1
	load	[r1],r1
	store	r1,[r14+-52]
! IF STATEMENT...
	mov	531,r13		! source line 531
	mov	"\0\0IF",r10
!   if byteCount > 0 then goto _Label_345		(int)
	load	[r14+8],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_345
!	_Label_344	jmp	_Label_344
_Label_344:
! THEN...
	mov	532,r13		! source line 532
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_346 = _StringConst_8
	set	_StringConst_8,r1
	store	r1,[r14+-44]
!   Prepare Argument: offset=8  value=_temp_346  sizeInBytes=4
	load	[r14+-44],r1
	store	r1,[r15+0]
!   Call the function
	mov	532,r13		! source line 532
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=byteCount  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	533,r13		! source line 533
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   _temp_347 = _StringConst_9
	set	_StringConst_9,r1
	store	r1,[r14+-40]
!   Prepare Argument: offset=8  value=_temp_347  sizeInBytes=4
	load	[r14+-40],r1
	store	r1,[r15+0]
!   Call the function
	mov	534,r13		! source line 534
	mov	"\0\0CA",r10
	call	_P_UserSystem_KPLSystemError
! END IF...
_Label_345:
! ASSIGNMENT STATEMENT...
	mov	538,r13		! source line 538
	mov	"\0\0AS",r10
!   byteCount = byteCount + 4		(int)
	load	[r14+8],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! IF STATEMENT...
	mov	541,r13		! source line 541
	mov	"\0\0IF",r10
!   _temp_350 = byteCount rem 8		(int)
	load	[r14+8],r1
	mov	8,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-36]
!   if _temp_350 <= 0 then goto _Label_349		(int)
	load	[r14+-36],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_349
!	_Label_348	jmp	_Label_348
_Label_348:
! THEN...
	mov	542,r13		! source line 542
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	542,r13		! source line 542
	mov	"\0\0AS",r10
!   _temp_352 = byteCount div 8		(int)
	load	[r14+8],r1
	mov	8,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	div	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-28]
!   _temp_351 = _temp_352 + 1		(int)
	load	[r14+-28],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-32]
!   byteCount = _temp_351 * 8		(int)
	load	[r14+-32],r1
	mov	8,r2
	mul	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! END IF...
_Label_349:
! ASSIGNMENT STATEMENT...
	mov	556,r13		! source line 556
	mov	"\0\0AS",r10
!   _Global_nextCharToUse = _Global_nextCharToUse + byteCount		(int)
	set	_Global_nextCharToUse,r1
	load	[r1],r1
	load	[r14+8],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	set	_Global_nextCharToUse,r2
	store	r1,[r2]
! IF STATEMENT...
	mov	557,r13		! source line 557
	mov	"\0\0IF",r10
!   if _Global_nextCharToUse <= 20000 then goto _Label_354		(int)
	set	_Global_nextCharToUse,r1
	load	[r1],r1
	mov	20000,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_354
!	_Label_353	jmp	_Label_353
_Label_353:
! THEN...
	mov	558,r13		! source line 558
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_355 = _StringConst_10
	set	_StringConst_10,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_355  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	558,r13		! source line 558
	mov	"\0\0CA",r10
	call	_P_UserSystem_KPLSystemError
! END IF...
_Label_354:
! ASSIGNMENT STATEMENT...
	mov	560,r13		! source line 560
	mov	"\0\0AS",r10
!   _temp_356 = &_Global_memoryArea
	set	_Global_memoryArea,r1
	store	r1,[r14+-20]
!   Move address of _temp_356 [i ] into _temp_357
!     make sure index expr is >= 0
	load	[r14+-52],r2
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
	set	1,r3
	mul	r2,r3,r2
	add	r2,4,r2
	add	r2,r1,r2
	store	r2,[r14+-16]
!   p = _temp_357		(4 bytes)
	load	[r14+-16],r1
	store	r1,[r14+-56]
! ASSIGNMENT STATEMENT...
	mov	561,r13		! source line 561
	mov	"\0\0AS",r10
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: *p = byteCount  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r14+-56],r2
	store	r1,[r2]
! ASSIGNMENT STATEMENT...
	mov	563,r13		! source line 563
	mov	"\0\0AS",r10
!   _Global_alreadyInAlloc = 0		(1 byte)
	mov	0,r1
	set	_Global_alreadyInAlloc,r2
	storeb	r1,[r2]
! RETURN STATEMENT...
	mov	565,r13		! source line 565
	mov	"\0\0RE",r10
!   _temp_358 = p + 4		(int)
	load	[r14+-56],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-12]
!   ReturnResult: _temp_358  (sizeInBytes=4)
	load	[r14+-12],r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_KPLMemoryAlloc:
	.word	_sourceFileName
	.word	_Label_359
	.word	4		! total size of parameters
	.word	52		! frame size = 52
	.word	_Label_360
	.word	8
	.word	4
	.word	_Label_361
	.word	-12
	.word	4
	.word	_Label_362
	.word	-16
	.word	4
	.word	_Label_363
	.word	-20
	.word	4
	.word	_Label_364
	.word	-24
	.word	4
	.word	_Label_365
	.word	-28
	.word	4
	.word	_Label_366
	.word	-32
	.word	4
	.word	_Label_367
	.word	-36
	.word	4
	.word	_Label_368
	.word	-40
	.word	4
	.word	_Label_369
	.word	-44
	.word	4
	.word	_Label_370
	.word	-48
	.word	4
	.word	_Label_371
	.word	-52
	.word	4
	.word	_Label_372
	.word	-56
	.word	4
	.word	0
_Label_359:
	.ascii	"KPLMemoryAlloc\0"
	.align
_Label_360:
	.byte	'I'
	.ascii	"byteCount\0"
	.align
_Label_361:
	.byte	'?'
	.ascii	"_temp_358\0"
	.align
_Label_362:
	.byte	'?'
	.ascii	"_temp_357\0"
	.align
_Label_363:
	.byte	'?'
	.ascii	"_temp_356\0"
	.align
_Label_364:
	.byte	'?'
	.ascii	"_temp_355\0"
	.align
_Label_365:
	.byte	'?'
	.ascii	"_temp_352\0"
	.align
_Label_366:
	.byte	'?'
	.ascii	"_temp_351\0"
	.align
_Label_367:
	.byte	'?'
	.ascii	"_temp_350\0"
	.align
_Label_368:
	.byte	'?'
	.ascii	"_temp_347\0"
	.align
_Label_369:
	.byte	'?'
	.ascii	"_temp_346\0"
	.align
_Label_370:
	.byte	'?'
	.ascii	"_temp_343\0"
	.align
_Label_371:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_372:
	.byte	'P'
	.ascii	"p\0"
	.align
! 
! ===============  FUNCTION KPLMemoryFree  ===============
! 
_P_UserSystem_KPLMemoryFree:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_KPLMemoryFree,r1
	push	r1
	mov	571,r13		! source line 571
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	571,r13		! source line 571
	mov	"\0\0RE",r10
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_KPLMemoryFree:
	.word	_sourceFileName
	.word	_Label_373
	.word	4		! total size of parameters
	.word	0		! frame size = 0
	.word	_Label_374
	.word	8
	.word	4
	.word	0
_Label_373:
	.ascii	"KPLMemoryFree\0"
	.align
_Label_374:
	.byte	'P'
	.ascii	"p\0"
	.align
! 
! ===============  FUNCTION KPLSystemError  ===============
! 
_P_UserSystem_KPLSystemError:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_KPLSystemError,r1
	push	r1
	mov	2,r1
_Label_498:
	push	r0
	sub	r1,1,r1
	bne	_Label_498
	mov	585,r13		! source line 585
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   _temp_375 = _StringConst_11
	set	_StringConst_11,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_375  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	592,r13		! source line 592
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=message  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	593,r13		! source line 593
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Call the function
	mov	594,r13		! source line 594
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! CALL STATEMENT...
!   Call the function
	mov	595,r13		! source line 595
	mov	"\0\0CE",r10
	call	TerminateWithError
! RETURN STATEMENT...
	mov	595,r13		! source line 595
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_KPLSystemError:
	.word	_sourceFileName
	.word	_Label_376
	.word	4		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_377
	.word	8
	.word	4
	.word	_Label_378
	.word	-12
	.word	4
	.word	0
_Label_376:
	.ascii	"KPLSystemError\0"
	.align
_Label_377:
	.byte	'P'
	.ascii	"message\0"
	.align
_Label_378:
	.byte	'?'
	.ascii	"_temp_375\0"
	.align
! 
! ===============  FUNCTION KPLIsKindOf  ===============
! 
_P_UserSystem_KPLIsKindOf:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_KPLIsKindOf,r1
	push	r1
	mov	13,r1
_Label_499:
	push	r0
	sub	r1,1,r1
	bne	_Label_499
	mov	650,r13		! source line 650
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	664,r13		! source line 664
	mov	"\0\0IF",r10
!   if intIsZero (objPtr) then goto _Label_379
	load	[r14+8],r1
	cmp	r1,r0
	be	_Label_379
	jmp	_Label_380
_Label_379:
! THEN...
	mov	665,r13		! source line 665
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_381 = _StringConst_12
	set	_StringConst_12,r1
	store	r1,[r14+-44]
!   Prepare Argument: offset=8  value=_temp_381  sizeInBytes=4
	load	[r14+-44],r1
	store	r1,[r15+0]
!   Call the function
	mov	665,r13		! source line 665
	mov	"\0\0CA",r10
	call	_P_UserSystem_KPLSystemError
! END IF...
_Label_380:
! ASSIGNMENT STATEMENT...
	mov	669,r13		! source line 669
	mov	"\0\0AS",r10
!   if intIsZero (objPtr) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_382 = objPtr + 0
	load	[r14+8],r1
	add	r1,0,r1
	store	r1,[r14+-40]
!   Data Move: dispTable = *_temp_382  (sizeInBytes=4)
	load	[r14+-40],r1
	load	[r1],r1
	store	r1,[r14+-48]
! IF STATEMENT...
	mov	670,r13		! source line 670
	mov	"\0\0IF",r10
!   if intIsZero (dispTable) then goto _Label_383
	load	[r14+-48],r1
	cmp	r1,r0
	be	_Label_383
	jmp	_Label_384
_Label_383:
! THEN...
	mov	671,r13		! source line 671
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	671,r13		! source line 671
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=4)
	mov	0,r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_384:
! ASSIGNMENT STATEMENT...
	mov	674,r13		! source line 674
	mov	"\0\0AS",r10
!   if intIsZero (dispTable) then goto _runtimeErrorNullPointer
	load	[r14+-48],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_385 = dispTable + 0
	load	[r14+-48],r1
	add	r1,0,r1
	store	r1,[r14+-36]
!   Data Move: classDesc = *_temp_385  (sizeInBytes=4)
	load	[r14+-36],r1
	load	[r1],r1
	store	r1,[r14+-52]
! IF STATEMENT...
	mov	677,r13		! source line 677
	mov	"\0\0IF",r10
!   if intIsZero (classDesc) then goto _runtimeErrorNullPointer
	load	[r14+-52],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_389 = classDesc + 0
	load	[r14+-52],r1
	add	r1,0,r1
	store	r1,[r14+-28]
!   Data Move: _temp_388 = *_temp_389  (sizeInBytes=4)
	load	[r14+-28],r1
	load	[r1],r1
	store	r1,[r14+-32]
!   if _temp_388 == 1129070931 then goto _Label_387		(int)
	load	[r14+-32],r1
	set	1129070931,r2
	cmp	r1,r2
	be	_Label_387
!	_Label_386	jmp	_Label_386
_Label_386:
! THEN...
	mov	678,r13		! source line 678
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_390 = _StringConst_13
	set	_StringConst_13,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_390  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	678,r13		! source line 678
	mov	"\0\0CA",r10
	call	_P_UserSystem_KPLSystemError
! END IF...
_Label_387:
! ASSIGNMENT STATEMENT...
	mov	682,r13		! source line 682
	mov	"\0\0AS",r10
!   if intIsZero (classDesc) then goto _runtimeErrorNullPointer
	load	[r14+-52],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_391 = classDesc + 20
	load	[r14+-52],r1
	add	r1,20,r1
	store	r1,[r14+-20]
!   next = _temp_391		(4 bytes)
	load	[r14+-20],r1
	store	r1,[r14+-56]
! WHILE STATEMENT...
	mov	683,r13		! source line 683
	mov	"\0\0WH",r10
_Label_392:
!	_Label_393	jmp	_Label_393
_Label_393:
	mov	683,r13		! source line 683
	mov	"\0\0WB",r10
! IF STATEMENT...
	mov	684,r13		! source line 684
	mov	"\0\0IF",r10
!   if intIsZero (next) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_397 = *next  (sizeInBytes=4)
	load	[r14+-56],r1
	load	[r1],r1
	store	r1,[r14+-16]
!   if intIsZero (_temp_397) then goto _Label_395
	load	[r14+-16],r1
	cmp	r1,r0
	be	_Label_395
	jmp	_Label_396
_Label_395:
! THEN...
	mov	685,r13		! source line 685
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	685,r13		! source line 685
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=4)
	mov	0,r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_398
_Label_396:
! ELSE...
	mov	686,r13		! source line 686
	mov	"\0\0EL",r10
! IF STATEMENT...
	mov	686,r13		! source line 686
	mov	"\0\0IF",r10
!   if intIsZero (next) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_401 = *next  (sizeInBytes=4)
	load	[r14+-56],r1
	load	[r1],r1
	store	r1,[r14+-12]
!   if _temp_401 != typeDesc then goto _Label_400		(int)
	load	[r14+-12],r1
	load	[r14+12],r2
	cmp	r1,r2
	bne	_Label_400
!	_Label_399	jmp	_Label_399
_Label_399:
! THEN...
	mov	687,r13		! source line 687
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	687,r13		! source line 687
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=4)
	mov	1,r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_400:
! END IF...
_Label_398:
! ASSIGNMENT STATEMENT...
	mov	689,r13		! source line 689
	mov	"\0\0AS",r10
!   next = next + 4		(int)
	load	[r14+-56],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-56]
! END WHILE...
	jmp	_Label_392
_Label_394:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_KPLIsKindOf:
	.word	_sourceFileName
	.word	_Label_402
	.word	8		! total size of parameters
	.word	52		! frame size = 52
	.word	_Label_403
	.word	8
	.word	4
	.word	_Label_404
	.word	12
	.word	4
	.word	_Label_405
	.word	-12
	.word	4
	.word	_Label_406
	.word	-16
	.word	4
	.word	_Label_407
	.word	-20
	.word	4
	.word	_Label_408
	.word	-24
	.word	4
	.word	_Label_409
	.word	-28
	.word	4
	.word	_Label_410
	.word	-32
	.word	4
	.word	_Label_411
	.word	-36
	.word	4
	.word	_Label_412
	.word	-40
	.word	4
	.word	_Label_413
	.word	-44
	.word	4
	.word	_Label_414
	.word	-48
	.word	4
	.word	_Label_415
	.word	-52
	.word	4
	.word	_Label_416
	.word	-56
	.word	4
	.word	0
_Label_402:
	.ascii	"KPLIsKindOf\0"
	.align
_Label_403:
	.byte	'P'
	.ascii	"objPtr\0"
	.align
_Label_404:
	.byte	'P'
	.ascii	"typeDesc\0"
	.align
_Label_405:
	.byte	'?'
	.ascii	"_temp_401\0"
	.align
_Label_406:
	.byte	'?'
	.ascii	"_temp_397\0"
	.align
_Label_407:
	.byte	'?'
	.ascii	"_temp_391\0"
	.align
_Label_408:
	.byte	'?'
	.ascii	"_temp_390\0"
	.align
_Label_409:
	.byte	'?'
	.ascii	"_temp_389\0"
	.align
_Label_410:
	.byte	'?'
	.ascii	"_temp_388\0"
	.align
_Label_411:
	.byte	'?'
	.ascii	"_temp_385\0"
	.align
_Label_412:
	.byte	'?'
	.ascii	"_temp_382\0"
	.align
_Label_413:
	.byte	'?'
	.ascii	"_temp_381\0"
	.align
_Label_414:
	.byte	'P'
	.ascii	"dispTable\0"
	.align
_Label_415:
	.byte	'P'
	.ascii	"classDesc\0"
	.align
_Label_416:
	.byte	'P'
	.ascii	"next\0"
	.align
! 
! ===============  FUNCTION KPLUncaughtThrow  ===============
! 
_P_UserSystem_KPLUncaughtThrow:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_UserSystem_KPLUncaughtThrow,r1
	push	r1
	mov	10,r1
_Label_500:
	push	r0
	sub	r1,1,r1
	bne	_Label_500
	mov	695,r13		! source line 695
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   _temp_417 = _StringConst_14
	set	_StringConst_14,r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_417  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	706,r13		! source line 706
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_418 = _StringConst_15
	set	_StringConst_15,r1
	store	r1,[r14+-28]
!   Prepare Argument: offset=8  value=_temp_418  sizeInBytes=4
	load	[r14+-28],r1
	store	r1,[r15+0]
!   Call the function
	mov	707,r13		! source line 707
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=errorID  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	708,r13		! source line 708
	mov	"\0\0CA",r10
	call	_function_25_printNullTerminatedString
! CALL STATEMENT...
!   Call the function
	mov	709,r13		! source line 709
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! CALL STATEMENT...
!   _temp_419 = _StringConst_16
	set	_StringConst_16,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_419  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	710,r13		! source line 710
	mov	"\0\0CE",r10
	call	print
! ASSIGNMENT STATEMENT...
	mov	711,r13		! source line 711
	mov	"\0\0AS",r10
!   if intIsZero (rPtr) then goto _runtimeErrorNullPointer
	load	[r14+16],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: charPtr = *rPtr  (sizeInBytes=4)
	load	[r14+16],r1
	load	[r1],r1
	store	r1,[r14+-36]
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=charPtr  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Call the function
	mov	712,r13		! source line 712
	mov	"\0\0CA",r10
	call	_function_25_printNullTerminatedString
! CALL STATEMENT...
!   _temp_420 = _StringConst_17
	set	_StringConst_17,r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_420  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	713,r13		! source line 713
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=line  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+0]
!   Call the function
	mov	714,r13		! source line 714
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   Call the function
	mov	715,r13		! source line 715
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! CALL STATEMENT...
!   _temp_421 = _StringConst_18
	set	_StringConst_18,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_421  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	716,r13		! source line 716
	mov	"\0\0CE",r10
	call	print
! ASSIGNMENT STATEMENT...
	mov	717,r13		! source line 717
	mov	"\0\0AS",r10
!   rPtr = rPtr + 4		(int)
	load	[r14+16],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+16]
! ASSIGNMENT STATEMENT...
	mov	718,r13		! source line 718
	mov	"\0\0AS",r10
!   if intIsZero (rPtr) then goto _runtimeErrorNullPointer
	load	[r14+16],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: charPtr = *rPtr  (sizeInBytes=4)
	load	[r14+16],r1
	load	[r1],r1
	store	r1,[r14+-36]
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=charPtr  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Call the function
	mov	719,r13		! source line 719
	mov	"\0\0CA",r10
	call	_function_25_printNullTerminatedString
! CALL STATEMENT...
!   Call the function
	mov	720,r13		! source line 720
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! CALL STATEMENT...
!   Call the function
	mov	721,r13		! source line 721
	mov	"\0\0CA",r10
	call	_function_24_printCatchStack
! CALL STATEMENT...
!   _temp_422 = _StringConst_19
	set	_StringConst_19,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_422  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	722,r13		! source line 722
	mov	"\0\0CE",r10
	call	print
! THROW STATEMENT...
	mov	723,r13		! source line 723
	mov	"\0\0TH",r10
!   Prepare Argument: offset=8  value=errorID  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=line  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+4]
!   Prepare Argument: offset=16  value=rPtr  sizeInBytes=4
	load	[r14+16],r1
	store	r1,[r15+8]
!   Throw 'UncaughtThrowError'...
	set	_Error_P_UserSystem_UncaughtThrowError,r4
	jmp	_PerformThrow
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_UserSystem_KPLUncaughtThrow:
	.word	_sourceFileName
	.word	_Label_423
	.word	12		! total size of parameters
	.word	40		! frame size = 40
	.word	_Label_424
	.word	8
	.word	4
	.word	_Label_425
	.word	12
	.word	4
	.word	_Label_426
	.word	16
	.word	4
	.word	_Label_427
	.word	-12
	.word	4
	.word	_Label_428
	.word	-16
	.word	4
	.word	_Label_429
	.word	-20
	.word	4
	.word	_Label_430
	.word	-24
	.word	4
	.word	_Label_431
	.word	-28
	.word	4
	.word	_Label_432
	.word	-32
	.word	4
	.word	_Label_433
	.word	-36
	.word	4
	.word	0
_Label_423:
	.ascii	"KPLUncaughtThrow\0"
	.align
_Label_424:
	.byte	'P'
	.ascii	"errorID\0"
	.align
_Label_425:
	.byte	'I'
	.ascii	"line\0"
	.align
_Label_426:
	.byte	'I'
	.ascii	"rPtr\0"
	.align
_Label_427:
	.byte	'?'
	.ascii	"_temp_422\0"
	.align
_Label_428:
	.byte	'?'
	.ascii	"_temp_421\0"
	.align
_Label_429:
	.byte	'?'
	.ascii	"_temp_420\0"
	.align
_Label_430:
	.byte	'?'
	.ascii	"_temp_419\0"
	.align
_Label_431:
	.byte	'?'
	.ascii	"_temp_418\0"
	.align
_Label_432:
	.byte	'?'
	.ascii	"_temp_417\0"
	.align
_Label_433:
	.byte	'P'
	.ascii	"charPtr\0"
	.align
! 
! ===============  FUNCTION printCatchStack  ===============
! 
_function_24_printCatchStack:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_24_printCatchStack,r1
	push	r1
	mov	13,r1
_Label_501:
	push	r0
	sub	r1,1,r1
	bne	_Label_501
	mov	728,r13		! source line 728
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! p
!   Call the function
	mov	741,r13		! source line 741
	mov	"\0\0CE",r10
	call	getCatchStack
!   Retrieve Result: targetName=p  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-56]
! CALL STATEMENT...
!   _temp_434 = _StringConst_20
	set	_StringConst_20,r1
	store	r1,[r14+-52]
!   Prepare Argument: offset=8  value=_temp_434  sizeInBytes=4
	load	[r14+-52],r1
	store	r1,[r15+0]
!   Call the function
	mov	742,r13		! source line 742
	mov	"\0\0CE",r10
	call	print
! WHILE STATEMENT...
	mov	743,r13		! source line 743
	mov	"\0\0WH",r10
_Label_435:
!   if p == 0 then goto _Label_437		(int)
	load	[r14+-56],r1
	mov	0,r2
	cmp	r1,r2
	be	_Label_437
!	_Label_436	jmp	_Label_436
_Label_436:
	mov	743,r13		! source line 743
	mov	"\0\0WB",r10
! CALL STATEMENT...
!   _temp_438 = _StringConst_21
	set	_StringConst_21,r1
	store	r1,[r14+-48]
!   Prepare Argument: offset=8  value=_temp_438  sizeInBytes=4
	load	[r14+-48],r1
	store	r1,[r15+0]
!   Call the function
	mov	744,r13		! source line 744
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_440 = p + 20
	load	[r14+-56],r1
	add	r1,20,r1
	store	r1,[r14+-40]
!   Data Move: _temp_439 = *_temp_440  (sizeInBytes=4)
	load	[r14+-40],r1
	load	[r1],r1
	store	r1,[r14+-44]
!   Prepare Argument: offset=8  value=_temp_439  sizeInBytes=4
	load	[r14+-44],r1
	store	r1,[r15+0]
!   Call the function
	mov	745,r13		! source line 745
	mov	"\0\0CA",r10
	call	_function_25_printNullTerminatedString
! CALL STATEMENT...
!   _temp_441 = _StringConst_22
	set	_StringConst_22,r1
	store	r1,[r14+-36]
!   Prepare Argument: offset=8  value=_temp_441  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Call the function
	mov	746,r13		! source line 746
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_443 = p + 24
	load	[r14+-56],r1
	add	r1,24,r1
	store	r1,[r14+-28]
!   Data Move: _temp_442 = *_temp_443  (sizeInBytes=4)
	load	[r14+-28],r1
	load	[r1],r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_442  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	747,r13		! source line 747
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   _temp_444 = _StringConst_23
	set	_StringConst_23,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_444  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	748,r13		! source line 748
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_446 = p + 4
	load	[r14+-56],r1
	add	r1,4,r1
	store	r1,[r14+-16]
!   Data Move: _temp_445 = *_temp_446  (sizeInBytes=4)
	load	[r14+-16],r1
	load	[r1],r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_445  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	749,r13		! source line 749
	mov	"\0\0CA",r10
	call	_function_25_printNullTerminatedString
! CALL STATEMENT...
!   Call the function
	mov	753,r13		! source line 753
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! ASSIGNMENT STATEMENT...
	mov	771,r13		! source line 771
	mov	"\0\0AS",r10
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_447 = p + 0
	load	[r14+-56],r1
	add	r1,0,r1
	store	r1,[r14+-12]
!   Data Move: p = *_temp_447  (sizeInBytes=4)
	load	[r14+-12],r1
	load	[r1],r1
	store	r1,[r14+-56]
! END WHILE...
	jmp	_Label_435
_Label_437:
! RETURN STATEMENT...
	mov	743,r13		! source line 743
	mov	"\0\0RE",r10
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_24_printCatchStack:
	.word	_sourceFileName
	.word	_Label_448
	.word	0		! total size of parameters
	.word	52		! frame size = 52
	.word	_Label_449
	.word	-12
	.word	4
	.word	_Label_450
	.word	-16
	.word	4
	.word	_Label_451
	.word	-20
	.word	4
	.word	_Label_452
	.word	-24
	.word	4
	.word	_Label_453
	.word	-28
	.word	4
	.word	_Label_454
	.word	-32
	.word	4
	.word	_Label_455
	.word	-36
	.word	4
	.word	_Label_456
	.word	-40
	.word	4
	.word	_Label_457
	.word	-44
	.word	4
	.word	_Label_458
	.word	-48
	.word	4
	.word	_Label_459
	.word	-52
	.word	4
	.word	_Label_460
	.word	-56
	.word	4
	.word	0
_Label_448:
	.ascii	"printCatchStack\0"
	.align
_Label_449:
	.byte	'?'
	.ascii	"_temp_447\0"
	.align
_Label_450:
	.byte	'?'
	.ascii	"_temp_446\0"
	.align
_Label_451:
	.byte	'?'
	.ascii	"_temp_445\0"
	.align
_Label_452:
	.byte	'?'
	.ascii	"_temp_444\0"
	.align
_Label_453:
	.byte	'?'
	.ascii	"_temp_443\0"
	.align
_Label_454:
	.byte	'?'
	.ascii	"_temp_442\0"
	.align
_Label_455:
	.byte	'?'
	.ascii	"_temp_441\0"
	.align
_Label_456:
	.byte	'?'
	.ascii	"_temp_440\0"
	.align
_Label_457:
	.byte	'?'
	.ascii	"_temp_439\0"
	.align
_Label_458:
	.byte	'?'
	.ascii	"_temp_438\0"
	.align
_Label_459:
	.byte	'?'
	.ascii	"_temp_434\0"
	.align
_Label_460:
	.byte	'P'
	.ascii	"p\0"
	.align
! 
! ===============  CLASS Object  ===============
! 
! Dispatch Table:
! 
_P_UserSystem_Object:
	.word	_Label_461
	.word	0
! 
! Class descriptor:
! 
_Label_461:
	.word	1129070931		! Magic number 0x434c4153 == 'CLAS'
	.word	_Label_462
	.word	_sourceFileName
	.word	106		! line number
	.word	4		! size of instances, in bytes
	.word	_P_UserSystem_Object
	.word	0
_Label_462:
	.ascii	"Object\0"
	.align
