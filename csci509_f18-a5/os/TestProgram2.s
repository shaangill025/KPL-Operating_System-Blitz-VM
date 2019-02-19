! Name of package being compiled: TestProgram2
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
	.import	_Error_P_UserSystem_UncaughtThrowError
	.align
! Functions imported from other packages
	.import	_P_Syscall_entSize
	.import	_P_UserSystem_Sys_Exit
	.import	_P_UserSystem_Sys_Shutdown
	.import	_P_UserSystem_Sys_Yield
	.import	_P_UserSystem_Sys_Fork
	.import	_P_UserSystem_Sys_Join
	.import	_P_UserSystem_Sys_Exec
	.import	_P_UserSystem_Sys_Open
	.import	_P_UserSystem_Sys_Read
	.import	_P_UserSystem_Sys_Write
	.import	_P_UserSystem_Sys_Seek
	.import	_P_UserSystem_Sys_Close
	.import	_P_UserSystem_Sys_GetPid
	.import	_P_UserSystem_Sys_GetPPid
	.import	_P_UserSystem_Sys_Stat
	.import	_P_UserSystem_Sys_ChMode
	.import	_P_UserSystem_Sys_Link
	.import	_P_UserSystem_Sys_Unlink
	.import	_P_UserSystem_Sys_Mkdir
	.import	_P_UserSystem_Sys_Rmdir
	.import	_P_UserSystem_Sys_Chdir
	.import	_P_UserSystem_Sys_Opendir
	.import	_P_UserSystem_Sys_Readdir
	.import	DoSyscall
	.import	TerminateWithError
	.import	print
	.import	printInt
	.import	printHex
	.import	printChar
	.import	printBool
	.import	printDouble
	.import	_P_UserSystem_StrEqual
	.import	_P_UserSystem_StrCopy
	.import	_P_UserSystem_StrCmp
	.import	_P_UserSystem_Min
	.import	_P_UserSystem_Max
	.import	_P_UserSystem_printIntVar
	.import	_P_UserSystem_printHexVar
	.import	_P_UserSystem_printBoolVar
	.import	_P_UserSystem_printCharVar
	.import	_P_UserSystem_printPtr
	.import	_P_UserSystem_nl
	.import	_P_UserSystem_MemoryEqual
	.import	getCatchStack
	.import	MemoryZero
	.import	MemoryCopy
	.import	_P_UserSystem_KPLSystemInitialize
	.import	_P_UserSystem_KPLMemoryAlloc
	.import	_P_UserSystem_KPLMemoryFree
	.import	_P_UserSystem_KPLUncaughtThrow
	.import	_P_UserSystem_KPLIsKindOf
	.import	_P_UserSystem_KPLSystemError
! Externally visible functions in this package
	.export	_mainEntry
	.export	main
! The following class and its methods are from other packages
	.import	_P_UserSystem_Object
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
	.import	_P_UserSystem_cmdArgs
! Global variables in this package
	.data
	.align
! String constants
_StringConst_9:
	.word	69			! length
	.ascii	"\n*************** ERROR: Execution should not continue after Shutdown\n"
	.align
_StringConst_8:
	.word	104			! length
	.ascii	"*****     FATAL ERROR in UserProgram: \"Syscall \'Shutdown\' was invoked by a user thread\" -- TERMINATING!\n"
	.align
_StringConst_7:
	.word	20			! length
	.ascii	"***** Should print:\n"
	.align
_StringConst_6:
	.word	37			! length
	.ascii	"\n***** About to call Sys_Shutdown...\n"
	.align
_StringConst_5:
	.word	5			! length
	.ascii	"] is "
	.align
_StringConst_4:
	.word	7			! length
	.ascii	"   arg["
	.align
_StringConst_3:
	.word	18			! length
	.ascii	"   None provided.\n"
	.align
_StringConst_2:
	.word	24			! length
	.ascii	"Command line arguments:\n"
	.align
_StringConst_1:
	.word	46			! length
	.ascii	"User-level program \'TestProgram2\' is running!\n"
	.align
	.text
! 
! =====  MAIN ENTRY POINT  =====
! 
_mainEntry:
	set	_packageName,r2		! Get CheckVersion started
	set	0x9ba9d27c,r3		! .  hashVal = -1683369348
	call	_CheckVersion_P_TestProgram2_	! .
	cmp	r1,0			! .
	be	_Label_10		! .
	ret				! .
_Label_10:				! .
	call	_heapInitialize
	jmp	main
! 
! Source Filename and Package Name
! 
_sourceFileName:
	.ascii	"TestProgram2.k\0"
_packageName:
	.ascii	"TestProgram2\0"
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
_CheckVersion_P_TestProgram2_:
	.export	_CheckVersion_P_TestProgram2_
	set	0x9ba9d27c,r4		! myHashVal = -1683369348
	cmp	r3,r4
	be	_Label_11
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
_Label_11:
	mov	0,r1
! Make sure _P_Syscall_ has hash value 0x73d5af34 (decimal 1943383860)
	set	_packageName,r2
	set	0x73d5af34,r3
	call	_CheckVersion_P_Syscall_
	.import	_CheckVersion_P_Syscall_
	cmp	r1,0
	bne	_Label_12
! Make sure _P_UserSystem_ has hash value 0x0234a765 (decimal 37005157)
	set	_packageName,r2
	set	0x0234a765,r3
	call	_CheckVersion_P_UserSystem_
	.import	_CheckVersion_P_UserSystem_
	cmp	r1,0
	bne	_Label_12
_Label_12:
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
	mov	16,r1
_Label_50:
	push	r0
	sub	r1,1,r1
	bne	_Label_50
	mov	5,r13		! source line 5
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   _temp_13 = _StringConst_1
	set	_StringConst_1,r1
	store	r1,[r14+-64]
!   Prepare Argument: offset=8  value=_temp_13  sizeInBytes=4
	load	[r14+-64],r1
	store	r1,[r15+0]
!   Call the function
	mov	9,r13		! source line 9
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_14 = _StringConst_2
	set	_StringConst_2,r1
	store	r1,[r14+-60]
!   Prepare Argument: offset=8  value=_temp_14  sizeInBytes=4
	load	[r14+-60],r1
	store	r1,[r15+0]
!   Call the function
	mov	11,r13		! source line 11
	mov	"\0\0CE",r10
	call	print
! IF STATEMENT...
	mov	12,r13		! source line 12
	mov	"\0\0IF",r10
!   if intIsZero (_P_UserSystem_cmdArgs) then goto _Label_15
	set	_P_UserSystem_cmdArgs,r1
	load	[r1],r1
	cmp	r1,r0
	be	_Label_15
	jmp	_Label_16
_Label_15:
! THEN...
	mov	13,r13		! source line 13
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_17 = _StringConst_3
	set	_StringConst_3,r1
	store	r1,[r14+-56]
!   Prepare Argument: offset=8  value=_temp_17  sizeInBytes=4
	load	[r14+-56],r1
	store	r1,[r15+0]
!   Call the function
	mov	13,r13		! source line 13
	mov	"\0\0CE",r10
	call	print
	jmp	_Label_18
_Label_16:
! ELSE...
	mov	15,r13		! source line 15
	mov	"\0\0EL",r10
! FOR STATEMENT...
	mov	15,r13		! source line 15
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_23 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-52]
!   Calculate and save the FOR-LOOP ending value
!   if intIsZero (_P_UserSystem_cmdArgs) then goto _runtimeErrorNullPointer
	set	_P_UserSystem_cmdArgs,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_25 = *_P_UserSystem_cmdArgs  (sizeInBytes=4)
	set	_P_UserSystem_cmdArgs,r1
	load	[r1],r1
	load	[r1],r1
	store	r1,[r14+-44]
!   _temp_24 = _temp_25 - 1		(int)
	load	[r14+-44],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-48]
!   Initialize FOR-LOOP index variable
!   Data Move: ix = _temp_23  (sizeInBytes=4)
	load	[r14+-52],r1
	store	r1,[r14+-68]
_Label_19:
!   Perform the FOR-LOOP termination test
!   if ix > _temp_24 then goto _Label_22		
	load	[r14+-68],r1
	load	[r14+-48],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_22
_Label_20:
	mov	15,r13		! source line 15
	mov	"\0\0FB",r10
! CALL STATEMENT...
!   _temp_26 = _StringConst_4
	set	_StringConst_4,r1
	store	r1,[r14+-40]
!   Prepare Argument: offset=8  value=_temp_26  sizeInBytes=4
	load	[r14+-40],r1
	store	r1,[r15+0]
!   Call the function
	mov	16,r13		! source line 16
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=ix  sizeInBytes=4
	load	[r14+-68],r1
	store	r1,[r15+0]
!   Call the function
	mov	16,r13		! source line 16
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   _temp_27 = _StringConst_5
	set	_StringConst_5,r1
	store	r1,[r14+-36]
!   Prepare Argument: offset=8  value=_temp_27  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Call the function
	mov	16,r13		! source line 16
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   if intIsZero (_P_UserSystem_cmdArgs) then goto _runtimeErrorNullPointer
	set	_P_UserSystem_cmdArgs,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of _P_UserSystem_cmdArgs [ix ] into _temp_29
!     make sure index expr is >= 0
	load	[r14+-68],r2
	cmp	r2,0
	bl	_runtimeErrorBadArrayIndex
!     make sure index expr is < array size
	set	_P_UserSystem_cmdArgs,r1
	load	[r1],r1
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
!   Data Move: _temp_28 = *_temp_29  (sizeInBytes=4)
	load	[r14+-28],r1
	load	[r1],r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_28  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	16,r13		! source line 16
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Call the function
	mov	16,r13		! source line 16
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
!   Increment the FOR-LOOP index variable and jump back
_Label_21:
!   ix = ix + 1
	load	[r14+-68],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-68]
	jmp	_Label_19
! END FOR
_Label_22:
! CALL STATEMENT...
!   Call the function
	mov	18,r13		! source line 18
	mov	"\0\0CA",r10
	call	_P_UserSystem_nl
! END IF...
_Label_18:
! CALL STATEMENT...
!   _temp_30 = _StringConst_6
	set	_StringConst_6,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_30  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	21,r13		! source line 21
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_31 = _StringConst_7
	set	_StringConst_7,r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_31  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	22,r13		! source line 22
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_32 = _StringConst_8
	set	_StringConst_8,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_32  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	23,r13		! source line 23
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Call the function
	mov	25,r13		! source line 25
	mov	"\0\0CA",r10
	call	_P_UserSystem_Sys_Shutdown
! CALL STATEMENT...
!   _temp_33 = _StringConst_9
	set	_StringConst_9,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_33  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	27,r13		! source line 27
	mov	"\0\0CE",r10
	call	print
! RETURN STATEMENT...
	mov	27,r13		! source line 27
	mov	"\0\0RE",r10
	add	r15,68,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor_main:
	.word	_sourceFileName
	.word	_Label_34
	.word	0		! total size of parameters
	.word	64		! frame size = 64
	.word	_Label_35
	.word	-12
	.word	4
	.word	_Label_36
	.word	-16
	.word	4
	.word	_Label_37
	.word	-20
	.word	4
	.word	_Label_38
	.word	-24
	.word	4
	.word	_Label_39
	.word	-28
	.word	4
	.word	_Label_40
	.word	-32
	.word	4
	.word	_Label_41
	.word	-36
	.word	4
	.word	_Label_42
	.word	-40
	.word	4
	.word	_Label_43
	.word	-44
	.word	4
	.word	_Label_44
	.word	-48
	.word	4
	.word	_Label_45
	.word	-52
	.word	4
	.word	_Label_46
	.word	-56
	.word	4
	.word	_Label_47
	.word	-60
	.word	4
	.word	_Label_48
	.word	-64
	.word	4
	.word	_Label_49
	.word	-68
	.word	4
	.word	0
_Label_34:
	.ascii	"main\0"
	.align
_Label_35:
	.byte	'?'
	.ascii	"_temp_33\0"
	.align
_Label_36:
	.byte	'?'
	.ascii	"_temp_32\0"
	.align
_Label_37:
	.byte	'?'
	.ascii	"_temp_31\0"
	.align
_Label_38:
	.byte	'?'
	.ascii	"_temp_30\0"
	.align
_Label_39:
	.byte	'?'
	.ascii	"_temp_29\0"
	.align
_Label_40:
	.byte	'?'
	.ascii	"_temp_28\0"
	.align
_Label_41:
	.byte	'?'
	.ascii	"_temp_27\0"
	.align
_Label_42:
	.byte	'?'
	.ascii	"_temp_26\0"
	.align
_Label_43:
	.byte	'?'
	.ascii	"_temp_25\0"
	.align
_Label_44:
	.byte	'?'
	.ascii	"_temp_24\0"
	.align
_Label_45:
	.byte	'?'
	.ascii	"_temp_23\0"
	.align
_Label_46:
	.byte	'?'
	.ascii	"_temp_17\0"
	.align
_Label_47:
	.byte	'?'
	.ascii	"_temp_14\0"
	.align
_Label_48:
	.byte	'?'
	.ascii	"_temp_13\0"
	.align
_Label_49:
	.byte	'I'
	.ascii	"ix\0"
	.align
