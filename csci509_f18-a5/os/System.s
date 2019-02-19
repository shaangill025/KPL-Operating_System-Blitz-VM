! Name of package being compiled: System
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
	.export	_Error_P_System_UncaughtThrowError
_Error_P_System_UncaughtThrowError:
	.ascii	"_Error_P_System_UncaughtThrowError\0"
	.align
! Functions imported from other packages
! Externally visible functions in this package
	.import	print
	.import	printInt
	.import	printHex
	.import	printChar
	.import	printBool
	.export	_P_System_MemoryEqual
	.export	_P_System_StrEqual
	.export	_P_System_StrCopy
	.export	_P_System_StrCmp
	.export	_P_System_StrChr
	.export	_P_System_Min
	.export	_P_System_Max
	.export	_P_System_printIntVar
	.export	_P_System_printHexVar
	.export	_P_System_printBoolVar
	.export	_P_System_printCharVar
	.export	_P_System_printPtr
	.export	_P_System_nl
	.export	_P_System_PrintMemory
	.import	Cleari
	.import	Seti
	.import	Wait
	.import	RuntimeExit
	.import	getCatchStack
	.import	MemoryZero
	.import	MemoryCopy
	.export	_P_System_KPLSystemInitialize
	.export	_P_System_KPLMemoryAlloc
	.export	_P_System_KPLMemoryFree
	.export	_P_System_KPLUncaughtThrow
	.export	_P_System_KPLIsKindOf
	.export	_P_System_KPLSystemError
! The following class and its methods are from this package
	.export	_P_System_Object
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
! Global variables in this package
	.data
	.export	_P_System_FatalError
_P_System_FatalError:
	.skip	4
_Global_memoryArea:
	.skip	20004
_Global_nextCharToUse:
	.word	0
_Global_alreadyInAlloc:
	.byte	0
	.align
! String constants
_StringConst_28:
	.word	2			! length
	.ascii	":\t"
	.align
_StringConst_27:
	.word	1			! length
	.ascii	":"
	.align
_StringConst_26:
	.word	5			! length
	.ascii	"     "
	.align
_StringConst_25:
	.word	28			! length
	.ascii	"   Here is the CATCH STACK:\n"
	.align
_StringConst_24:
	.word	63			! length
	.ascii	"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n"
	.align
_StringConst_23:
	.word	41			! length
	.ascii	"   Currently active method or function = "
	.align
_StringConst_22:
	.word	1			! length
	.ascii	":"
	.align
_StringConst_21:
	.word	31			! length
	.ascii	"   Location at time of THROW = "
	.align
_StringConst_20:
	.word	16			! length
	.ascii	"   Error Name = "
	.align
_StringConst_19:
	.word	64			! length
	.ascii	"\n\n++++++++++ An error has been thrown but not caught ++++++++++\n"
	.align
_StringConst_18:
	.word	36			! length
	.ascii	"WITHIN KPLIsKindOf: Bad Magic Number"
	.align
_StringConst_17:
	.word	34			! length
	.ascii	"WITHIN KPLIsKindOf: objPtr is NULL"
	.align
_StringConst_16:
	.word	27			! length
	.ascii	"\n\nFATAL KPL RUNTIME ERROR: "
	.align
_StringConst_15:
	.word	36			! length
	.ascii	"WITHIN KPLMemoryAlloc: Out of memory"
	.align
_StringConst_14:
	.word	49			! length
	.ascii	"WITHIN KPLMemoryAlloc: byte count is not positive"
	.align
_StringConst_13:
	.word	18			! length
	.ascii	"\n\nBad byteCount = "
	.align
_StringConst_12:
	.word	32			! length
	.ascii	"WITHIN KPLMemoryAlloc: Reentered"
	.align
_StringConst_11:
	.word	18			! length
	.ascii	"\" -- TERMINATING!\n"
	.align
_StringConst_10:
	.word	15			! length
	.ascii	"\nFATAL ERROR: \""
	.align
_StringConst_9:
	.word	59			! length
	.ascii	"\n\n--------------------------------------------------------\n"
	.align
_StringConst_8:
	.word	3			! length
	.ascii	":  "
	.align
_StringConst_7:
	.word	59			! length
	.ascii	"\n\n--------------------------------------------------------\n"
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
	.ascii	"System.k\0"
_packageName:
	.ascii	"System\0"
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
_CheckVersion_P_System_:
	.export	_CheckVersion_P_System_
	set	0xba42d652,r4		! myHashVal = -1170024878
	cmp	r3,r4
	be	_Label_32
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
_Label_32:
	mov	0,r1
_Label_33:
	ret
_CVMess1:	.ascii	"\nVERSION CONSISTENCY ERROR: Package '\0"
_CVMess2:	.ascii	"' uses package '\0"
_CVMess3:	.ascii	"'.  Whenever a header file is modified, all packages that use that package (directly or indirectly) must be recompiled.  The header file for '\0"
_CVMess4:	.ascii	"' has been changed since '\0"
_CVMess5:	.ascii	"' was compiled last.  Please recompile all packages that depend on '\0"
_CVMess6:	.ascii	"'.\n\n\0"
	.align
! 
! ===============  FUNCTION MemoryEqual  ===============
! 
_P_System_MemoryEqual:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_MemoryEqual,r1
	push	r1
	mov	4,r1
_Label_421:
	push	r0
	sub	r1,1,r1
	bne	_Label_421
	mov	12,r13		! source line 12
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! FOR STATEMENT...
	mov	17,r13		! source line 17
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_38 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-20]
!   Calculate and save the FOR-LOOP ending value
!   _temp_39 = len - 1		(int)
	load	[r14+16],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-16]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_38  (sizeInBytes=4)
	load	[r14+-20],r1
	store	r1,[r14+-24]
_Label_34:
!   Perform the FOR-LOOP termination test
!   if i > _temp_39 then goto _Label_37		
	load	[r14+-24],r1
	load	[r14+-16],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_37
_Label_35:
	mov	17,r13		! source line 17
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	18,r13		! source line 18
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_42 = *s1  (sizeInBytes=1)
	load	[r14+8],r1
	loadb	[r1],r1
	storeb	r1,[r14+-11]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_43 = *s2  (sizeInBytes=1)
	load	[r14+12],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
!   _temp_44 = _temp_42 XOR _temp_43		(bool)
	loadb	[r14+-11],r1
	loadb	[r14+-10],r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_44 then goto _Label_40 else goto _Label_41
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_41
	jmp	_Label_40
_Label_40:
! THEN...
	mov	19,r13		! source line 19
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	19,r13		! source line 19
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=1)
	mov	0,r1
	storeb	r1,[r14+8]
	add	r15,20,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_41:
! ASSIGNMENT STATEMENT...
	mov	21,r13		! source line 21
	mov	"\0\0AS",r10
!   s1 = s1 + 1		(int)
	load	[r14+8],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! ASSIGNMENT STATEMENT...
	mov	22,r13		! source line 22
	mov	"\0\0AS",r10
!   s2 = s2 + 1		(int)
	load	[r14+12],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+12]
!   Increment the FOR-LOOP index variable and jump back
_Label_36:
!   i = i + 1
	load	[r14+-24],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-24]
	jmp	_Label_34
! END FOR
_Label_37:
! RETURN STATEMENT...
	mov	24,r13		! source line 24
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
_RoutineDescriptor__P_System_MemoryEqual:
	.word	_sourceFileName
	.word	_Label_45
	.word	12		! total size of parameters
	.word	16		! frame size = 16
	.word	_Label_46
	.word	8
	.word	4
	.word	_Label_47
	.word	12
	.word	4
	.word	_Label_48
	.word	16
	.word	4
	.word	_Label_49
	.word	-9
	.word	1
	.word	_Label_50
	.word	-10
	.word	1
	.word	_Label_51
	.word	-11
	.word	1
	.word	_Label_52
	.word	-16
	.word	4
	.word	_Label_53
	.word	-20
	.word	4
	.word	_Label_54
	.word	-24
	.word	4
	.word	0
_Label_45:
	.ascii	"MemoryEqual\0"
	.align
_Label_46:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_47:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_48:
	.byte	'I'
	.ascii	"len\0"
	.align
_Label_49:
	.byte	'C'
	.ascii	"_temp_44\0"
	.align
_Label_50:
	.byte	'C'
	.ascii	"_temp_43\0"
	.align
_Label_51:
	.byte	'C'
	.ascii	"_temp_42\0"
	.align
_Label_52:
	.byte	'?'
	.ascii	"_temp_39\0"
	.align
_Label_53:
	.byte	'?'
	.ascii	"_temp_38\0"
	.align
_Label_54:
	.byte	'I'
	.ascii	"i\0"
	.align
! 
! ===============  FUNCTION StrEqual  ===============
! 
_P_System_StrEqual:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_StrEqual,r1
	push	r1
	mov	9,r1
_Label_422:
	push	r0
	sub	r1,1,r1
	bne	_Label_422
	mov	29,r13		! source line 29
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	35,r13		! source line 35
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_57 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-40]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_58 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-36]
!   if _temp_57 == _temp_58 then goto _Label_56		(int)
	load	[r14+-40],r1
	load	[r14+-36],r2
	cmp	r1,r2
	be	_Label_56
!	_Label_55	jmp	_Label_55
_Label_55:
! THEN...
	mov	36,r13		! source line 36
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	36,r13		! source line 36
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=1)
	mov	0,r1
	storeb	r1,[r14+8]
	add	r15,40,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_56:
! FOR STATEMENT...
	mov	38,r13		! source line 38
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_63 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-32]
!   Calculate and save the FOR-LOOP ending value
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_65 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-24]
!   _temp_64 = _temp_65 - 1		(int)
	load	[r14+-24],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-28]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_63  (sizeInBytes=4)
	load	[r14+-32],r1
	store	r1,[r14+-44]
_Label_59:
!   Perform the FOR-LOOP termination test
!   if i > _temp_64 then goto _Label_62		
	load	[r14+-44],r1
	load	[r14+-28],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_62
_Label_60:
	mov	38,r13		! source line 38
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	39,r13		! source line 39
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_69
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
!   Data Move: _temp_68 = *_temp_69  (sizeInBytes=1)
	load	[r14+-20],r1
	loadb	[r1],r1
	storeb	r1,[r14+-11]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s2 [i ] into _temp_71
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
!   Data Move: _temp_70 = *_temp_71  (sizeInBytes=1)
	load	[r14+-16],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
!   _temp_72 = _temp_68 XOR _temp_70		(bool)
	loadb	[r14+-11],r1
	loadb	[r14+-10],r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_72 then goto _Label_66 else goto _Label_67
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_67
	jmp	_Label_66
_Label_66:
! THEN...
	mov	40,r13		! source line 40
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	40,r13		! source line 40
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=1)
	mov	0,r1
	storeb	r1,[r14+8]
	add	r15,40,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_67:
!   Increment the FOR-LOOP index variable and jump back
_Label_61:
!   i = i + 1
	load	[r14+-44],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-44]
	jmp	_Label_59
! END FOR
_Label_62:
! RETURN STATEMENT...
	mov	43,r13		! source line 43
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
_RoutineDescriptor__P_System_StrEqual:
	.word	_sourceFileName
	.word	_Label_73
	.word	8		! total size of parameters
	.word	36		! frame size = 36
	.word	_Label_74
	.word	8
	.word	4
	.word	_Label_75
	.word	12
	.word	4
	.word	_Label_76
	.word	-9
	.word	1
	.word	_Label_77
	.word	-16
	.word	4
	.word	_Label_78
	.word	-10
	.word	1
	.word	_Label_79
	.word	-20
	.word	4
	.word	_Label_80
	.word	-11
	.word	1
	.word	_Label_81
	.word	-24
	.word	4
	.word	_Label_82
	.word	-28
	.word	4
	.word	_Label_83
	.word	-32
	.word	4
	.word	_Label_84
	.word	-36
	.word	4
	.word	_Label_85
	.word	-40
	.word	4
	.word	_Label_86
	.word	-44
	.word	4
	.word	0
_Label_73:
	.ascii	"StrEqual\0"
	.align
_Label_74:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_75:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_76:
	.byte	'C'
	.ascii	"_temp_72\0"
	.align
_Label_77:
	.byte	'?'
	.ascii	"_temp_71\0"
	.align
_Label_78:
	.byte	'C'
	.ascii	"_temp_70\0"
	.align
_Label_79:
	.byte	'?'
	.ascii	"_temp_69\0"
	.align
_Label_80:
	.byte	'C'
	.ascii	"_temp_68\0"
	.align
_Label_81:
	.byte	'?'
	.ascii	"_temp_65\0"
	.align
_Label_82:
	.byte	'?'
	.ascii	"_temp_64\0"
	.align
_Label_83:
	.byte	'?'
	.ascii	"_temp_63\0"
	.align
_Label_84:
	.byte	'?'
	.ascii	"_temp_58\0"
	.align
_Label_85:
	.byte	'?'
	.ascii	"_temp_57\0"
	.align
_Label_86:
	.byte	'I'
	.ascii	"i\0"
	.align
! 
! ===============  FUNCTION StrCopy  ===============
! 
_P_System_StrCopy:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_StrCopy,r1
	push	r1
	mov	11,r1
_Label_423:
	push	r0
	sub	r1,1,r1
	bne	_Label_423
	mov	48,r13		! source line 48
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	62,r13		! source line 62
	mov	"\0\0AS",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_87 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-36]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_88 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_87  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_88  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+4]
!   Call the function
	mov	62,r13		! source line 62
	mov	"\0\0CA",r10
	call	_P_System_Min
!   Retrieve Result: targetName=sz  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-44]
! FOR STATEMENT...
	mov	63,r13		! source line 63
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_93 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-28]
!   Calculate and save the FOR-LOOP ending value
!   _temp_94 = sz - 1		(int)
	load	[r14+-44],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-24]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_93  (sizeInBytes=4)
	load	[r14+-28],r1
	store	r1,[r14+-40]
_Label_89:
!   Perform the FOR-LOOP termination test
!   if i > _temp_94 then goto _Label_92		
	load	[r14+-40],r1
	load	[r14+-24],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_92
_Label_90:
	mov	63,r13		! source line 63
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	64,r13		! source line 64
	mov	"\0\0AS",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_95
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
!   Move address of s2 [i ] into _temp_97
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
!   Data Move: _temp_96 = *_temp_97  (sizeInBytes=1)
	load	[r14+-16],r1
	loadb	[r1],r1
	storeb	r1,[r14+-9]
!   Data Move: *_temp_95 = _temp_96  (sizeInBytes=1)
	loadb	[r14+-9],r1
	load	[r14+-20],r2
	storeb	r1,[r2]
!   Increment the FOR-LOOP index variable and jump back
_Label_91:
!   i = i + 1
	load	[r14+-40],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-40]
	jmp	_Label_89
! END FOR
_Label_92:
! RETURN STATEMENT...
	mov	63,r13		! source line 63
	mov	"\0\0RE",r10
	add	r15,48,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_StrCopy:
	.word	_sourceFileName
	.word	_Label_98
	.word	8		! total size of parameters
	.word	44		! frame size = 44
	.word	_Label_99
	.word	8
	.word	4
	.word	_Label_100
	.word	12
	.word	4
	.word	_Label_101
	.word	-16
	.word	4
	.word	_Label_102
	.word	-9
	.word	1
	.word	_Label_103
	.word	-20
	.word	4
	.word	_Label_104
	.word	-24
	.word	4
	.word	_Label_105
	.word	-28
	.word	4
	.word	_Label_106
	.word	-32
	.word	4
	.word	_Label_107
	.word	-36
	.word	4
	.word	_Label_108
	.word	-40
	.word	4
	.word	_Label_109
	.word	-44
	.word	4
	.word	0
_Label_98:
	.ascii	"StrCopy\0"
	.align
_Label_99:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_100:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_101:
	.byte	'?'
	.ascii	"_temp_97\0"
	.align
_Label_102:
	.byte	'C'
	.ascii	"_temp_96\0"
	.align
_Label_103:
	.byte	'?'
	.ascii	"_temp_95\0"
	.align
_Label_104:
	.byte	'?'
	.ascii	"_temp_94\0"
	.align
_Label_105:
	.byte	'?'
	.ascii	"_temp_93\0"
	.align
_Label_106:
	.byte	'?'
	.ascii	"_temp_88\0"
	.align
_Label_107:
	.byte	'?'
	.ascii	"_temp_87\0"
	.align
_Label_108:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_109:
	.byte	'I'
	.ascii	"sz\0"
	.align
! 
! ===============  FUNCTION StrCmp  ===============
! 
_P_System_StrCmp:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_StrCmp,r1
	push	r1
	mov	21,r1
_Label_424:
	push	r0
	sub	r1,1,r1
	bne	_Label_424
	mov	70,r13		! source line 70
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! sz
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_110 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-76]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_111 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-72]
!   Prepare Argument: offset=8  value=_temp_110  sizeInBytes=4
	load	[r14+-76],r1
	store	r1,[r15+0]
!   Prepare Argument: offset=12  value=_temp_111  sizeInBytes=4
	load	[r14+-72],r1
	store	r1,[r15+4]
!   Call the function
	mov	79,r13		! source line 79
	mov	"\0\0CA",r10
	call	_P_System_Min
!   Retrieve Result: targetName=sz  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-80]
! FOR STATEMENT...
	mov	81,r13		! source line 81
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_116 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-68]
!   Calculate and save the FOR-LOOP ending value
!   _temp_117 = sz - 1		(int)
	load	[r14+-80],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-64]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_116  (sizeInBytes=4)
	load	[r14+-68],r1
	store	r1,[r14+-84]
_Label_112:
!   Perform the FOR-LOOP termination test
!   if i > _temp_117 then goto _Label_115		
	load	[r14+-84],r1
	load	[r14+-64],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_115
_Label_113:
	mov	81,r13		! source line 81
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	82,r13		! source line 82
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_122
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
!   Data Move: _temp_121 = *_temp_122  (sizeInBytes=1)
	load	[r14+-56],r1
	loadb	[r1],r1
	storeb	r1,[r14+-12]
!   _temp_120 = charToInt (_temp_121)
	loadb	[r14+-12],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-60]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s2 [i ] into _temp_125
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
!   Data Move: _temp_124 = *_temp_125  (sizeInBytes=1)
	load	[r14+-48],r1
	loadb	[r1],r1
	storeb	r1,[r14+-11]
!   _temp_123 = charToInt (_temp_124)
	loadb	[r14+-11],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-52]
!   if _temp_120 >= _temp_123 then goto _Label_119		(int)
	load	[r14+-60],r1
	load	[r14+-52],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_119
!	_Label_118	jmp	_Label_118
_Label_118:
! THEN...
	mov	83,r13		! source line 83
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	83,r13		! source line 83
	mov	"\0\0RE",r10
!   ReturnResult: -1  (sizeInBytes=4)
	mov	-1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_126
_Label_119:
! ELSE...
	mov	84,r13		! source line 84
	mov	"\0\0EL",r10
! IF STATEMENT...
	mov	84,r13		! source line 84
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s1 [i ] into _temp_131
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
!   Data Move: _temp_130 = *_temp_131  (sizeInBytes=1)
	load	[r14+-40],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
!   _temp_129 = charToInt (_temp_130)
	loadb	[r14+-10],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-44]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of s2 [i ] into _temp_134
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
!   Data Move: _temp_133 = *_temp_134  (sizeInBytes=1)
	load	[r14+-32],r1
	loadb	[r1],r1
	storeb	r1,[r14+-9]
!   _temp_132 = charToInt (_temp_133)
	loadb	[r14+-9],r1
	sll	r1,24,r1
	sra	r1,24,r1
	store	r1,[r14+-36]
!   if _temp_129 <= _temp_132 then goto _Label_128		(int)
	load	[r14+-44],r1
	load	[r14+-36],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_128
!	_Label_127	jmp	_Label_127
_Label_127:
! THEN...
	mov	85,r13		! source line 85
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	85,r13		! source line 85
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=4)
	mov	1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_128:
! END IF...
_Label_126:
!   Increment the FOR-LOOP index variable and jump back
_Label_114:
!   i = i + 1
	load	[r14+-84],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-84]
	jmp	_Label_112
! END FOR
_Label_115:
! IF STATEMENT...
	mov	88,r13		! source line 88
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_137 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-28]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_138 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-24]
!   if _temp_137 >= _temp_138 then goto _Label_136		(int)
	load	[r14+-28],r1
	load	[r14+-24],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_136
!	_Label_135	jmp	_Label_135
_Label_135:
! THEN...
	mov	89,r13		! source line 89
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	89,r13		! source line 89
	mov	"\0\0RE",r10
!   ReturnResult: -1  (sizeInBytes=4)
	mov	-1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_139
_Label_136:
! ELSE...
	mov	90,r13		! source line 90
	mov	"\0\0EL",r10
! IF STATEMENT...
	mov	90,r13		! source line 90
	mov	"\0\0IF",r10
!   if intIsZero (s1) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_142 = *s1  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-20]
!   if intIsZero (s2) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_143 = *s2  (sizeInBytes=4)
	load	[r14+12],r1
	load	[r1],r1
	store	r1,[r14+-16]
!   if _temp_142 <= _temp_143 then goto _Label_141		(int)
	load	[r14+-20],r1
	load	[r14+-16],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_141
!	_Label_140	jmp	_Label_140
_Label_140:
! THEN...
	mov	91,r13		! source line 91
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	91,r13		! source line 91
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=4)
	mov	1,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_144
_Label_141:
! ELSE...
	mov	93,r13		! source line 93
	mov	"\0\0EL",r10
! RETURN STATEMENT...
	mov	93,r13		! source line 93
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=4)
	mov	0,r1
	store	r1,[r14+8]
	add	r15,88,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_144:
! END IF...
_Label_139:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_StrCmp:
	.word	_sourceFileName
	.word	_Label_145
	.word	8		! total size of parameters
	.word	84		! frame size = 84
	.word	_Label_146
	.word	8
	.word	4
	.word	_Label_147
	.word	12
	.word	4
	.word	_Label_148
	.word	-16
	.word	4
	.word	_Label_149
	.word	-20
	.word	4
	.word	_Label_150
	.word	-24
	.word	4
	.word	_Label_151
	.word	-28
	.word	4
	.word	_Label_152
	.word	-32
	.word	4
	.word	_Label_153
	.word	-9
	.word	1
	.word	_Label_154
	.word	-36
	.word	4
	.word	_Label_155
	.word	-40
	.word	4
	.word	_Label_156
	.word	-10
	.word	1
	.word	_Label_157
	.word	-44
	.word	4
	.word	_Label_158
	.word	-48
	.word	4
	.word	_Label_159
	.word	-11
	.word	1
	.word	_Label_160
	.word	-52
	.word	4
	.word	_Label_161
	.word	-56
	.word	4
	.word	_Label_162
	.word	-12
	.word	1
	.word	_Label_163
	.word	-60
	.word	4
	.word	_Label_164
	.word	-64
	.word	4
	.word	_Label_165
	.word	-68
	.word	4
	.word	_Label_166
	.word	-72
	.word	4
	.word	_Label_167
	.word	-76
	.word	4
	.word	_Label_168
	.word	-80
	.word	4
	.word	_Label_169
	.word	-84
	.word	4
	.word	0
_Label_145:
	.ascii	"StrCmp\0"
	.align
_Label_146:
	.byte	'P'
	.ascii	"s1\0"
	.align
_Label_147:
	.byte	'P'
	.ascii	"s2\0"
	.align
_Label_148:
	.byte	'?'
	.ascii	"_temp_143\0"
	.align
_Label_149:
	.byte	'?'
	.ascii	"_temp_142\0"
	.align
_Label_150:
	.byte	'?'
	.ascii	"_temp_138\0"
	.align
_Label_151:
	.byte	'?'
	.ascii	"_temp_137\0"
	.align
_Label_152:
	.byte	'?'
	.ascii	"_temp_134\0"
	.align
_Label_153:
	.byte	'C'
	.ascii	"_temp_133\0"
	.align
_Label_154:
	.byte	'?'
	.ascii	"_temp_132\0"
	.align
_Label_155:
	.byte	'?'
	.ascii	"_temp_131\0"
	.align
_Label_156:
	.byte	'C'
	.ascii	"_temp_130\0"
	.align
_Label_157:
	.byte	'?'
	.ascii	"_temp_129\0"
	.align
_Label_158:
	.byte	'?'
	.ascii	"_temp_125\0"
	.align
_Label_159:
	.byte	'C'
	.ascii	"_temp_124\0"
	.align
_Label_160:
	.byte	'?'
	.ascii	"_temp_123\0"
	.align
_Label_161:
	.byte	'?'
	.ascii	"_temp_122\0"
	.align
_Label_162:
	.byte	'C'
	.ascii	"_temp_121\0"
	.align
_Label_163:
	.byte	'?'
	.ascii	"_temp_120\0"
	.align
_Label_164:
	.byte	'?'
	.ascii	"_temp_117\0"
	.align
_Label_165:
	.byte	'?'
	.ascii	"_temp_116\0"
	.align
_Label_166:
	.byte	'?'
	.ascii	"_temp_111\0"
	.align
_Label_167:
	.byte	'?'
	.ascii	"_temp_110\0"
	.align
_Label_168:
	.byte	'I'
	.ascii	"sz\0"
	.align
_Label_169:
	.byte	'I'
	.ascii	"i\0"
	.align
! 
! ===============  FUNCTION StrChr  ===============
! 
_P_System_StrChr:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_StrChr,r1
	push	r1
	mov	6,r1
_Label_425:
	push	r0
	sub	r1,1,r1
	bne	_Label_425
	mov	99,r13		! source line 99
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! FOR STATEMENT...
	mov	102,r13		! source line 102
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_174 = startLoc		(4 bytes)
	load	[r14+16],r1
	store	r1,[r14+-28]
!   Calculate and save the FOR-LOOP ending value
!   if intIsZero (str) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_176 = *str  (sizeInBytes=4)
	load	[r14+8],r1
	load	[r1],r1
	store	r1,[r14+-20]
!   _temp_175 = _temp_176 - 1		(int)
	load	[r14+-20],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-24]
!   Initialize FOR-LOOP index variable
!   Data Move: ix = _temp_174  (sizeInBytes=4)
	load	[r14+-28],r1
	store	r1,[r14+-32]
_Label_170:
!   Perform the FOR-LOOP termination test
!   if ix > _temp_175 then goto _Label_173		
	load	[r14+-32],r1
	load	[r14+-24],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_173
_Label_171:
	mov	102,r13		! source line 102
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	103,r13		! source line 103
	mov	"\0\0IF",r10
!   if intIsZero (str) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Move address of str [ix ] into _temp_180
!     make sure index expr is >= 0
	load	[r14+-32],r2
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
	store	r2,[r14+-16]
!   Data Move: _temp_179 = *_temp_180  (sizeInBytes=1)
	load	[r14+-16],r1
	loadb	[r1],r1
	storeb	r1,[r14+-10]
!   _temp_181 = _temp_179 XOR ch		(bool)
	loadb	[r14+-10],r1
	loadb	[r14+12],r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_181 then goto _Label_178 else goto _Label_177
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_177
	jmp	_Label_178
_Label_177:
! THEN...
	mov	104,r13		! source line 104
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	104,r13		! source line 104
	mov	"\0\0RE",r10
!   ReturnResult: ix  (sizeInBytes=4)
	load	[r14+-32],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_178:
!   Increment the FOR-LOOP index variable and jump back
_Label_172:
!   ix = ix + 1
	load	[r14+-32],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-32]
	jmp	_Label_170
! END FOR
_Label_173:
! RETURN STATEMENT...
	mov	108,r13		! source line 108
	mov	"\0\0RE",r10
!   ReturnResult: -1  (sizeInBytes=4)
	mov	-1,r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_StrChr:
	.word	_sourceFileName
	.word	_Label_182
	.word	12		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_183
	.word	8
	.word	4
	.word	_Label_184
	.word	12
	.word	1
	.word	_Label_185
	.word	16
	.word	4
	.word	_Label_186
	.word	-9
	.word	1
	.word	_Label_187
	.word	-16
	.word	4
	.word	_Label_188
	.word	-10
	.word	1
	.word	_Label_189
	.word	-20
	.word	4
	.word	_Label_190
	.word	-24
	.word	4
	.word	_Label_191
	.word	-28
	.word	4
	.word	_Label_192
	.word	-32
	.word	4
	.word	0
_Label_182:
	.ascii	"StrChr\0"
	.align
_Label_183:
	.byte	'P'
	.ascii	"str\0"
	.align
_Label_184:
	.byte	'C'
	.ascii	"ch\0"
	.align
_Label_185:
	.byte	'I'
	.ascii	"startLoc\0"
	.align
_Label_186:
	.byte	'C'
	.ascii	"_temp_181\0"
	.align
_Label_187:
	.byte	'?'
	.ascii	"_temp_180\0"
	.align
_Label_188:
	.byte	'C'
	.ascii	"_temp_179\0"
	.align
_Label_189:
	.byte	'?'
	.ascii	"_temp_176\0"
	.align
_Label_190:
	.byte	'?'
	.ascii	"_temp_175\0"
	.align
_Label_191:
	.byte	'?'
	.ascii	"_temp_174\0"
	.align
_Label_192:
	.byte	'I'
	.ascii	"ix\0"
	.align
! 
! ===============  FUNCTION Min  ===============
! 
_P_System_Min:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_Min,r1
	push	r1
	mov	115,r13		! source line 115
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	119,r13		! source line 119
	mov	"\0\0IF",r10
!   if i >= j then goto _Label_194		(int)
	load	[r14+8],r1
	load	[r14+12],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_194
!	_Label_193	jmp	_Label_193
_Label_193:
! THEN...
	mov	120,r13		! source line 120
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	120,r13		! source line 120
	mov	"\0\0RE",r10
!   ReturnResult: i  (sizeInBytes=4)
	load	[r14+8],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_195
_Label_194:
! ELSE...
	mov	122,r13		! source line 122
	mov	"\0\0EL",r10
! RETURN STATEMENT...
	mov	122,r13		! source line 122
	mov	"\0\0RE",r10
!   ReturnResult: j  (sizeInBytes=4)
	load	[r14+12],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_195:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_Min:
	.word	_sourceFileName
	.word	_Label_196
	.word	8		! total size of parameters
	.word	0		! frame size = 0
	.word	_Label_197
	.word	8
	.word	4
	.word	_Label_198
	.word	12
	.word	4
	.word	0
_Label_196:
	.ascii	"Min\0"
	.align
_Label_197:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_198:
	.byte	'I'
	.ascii	"j\0"
	.align
! 
! ===============  FUNCTION Max  ===============
! 
_P_System_Max:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_Max,r1
	push	r1
	mov	128,r13		! source line 128
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	132,r13		! source line 132
	mov	"\0\0IF",r10
!   if i <= j then goto _Label_200		(int)
	load	[r14+8],r1
	load	[r14+12],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_200
!	_Label_199	jmp	_Label_199
_Label_199:
! THEN...
	mov	133,r13		! source line 133
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	133,r13		! source line 133
	mov	"\0\0RE",r10
!   ReturnResult: i  (sizeInBytes=4)
	load	[r14+8],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_201
_Label_200:
! ELSE...
	mov	135,r13		! source line 135
	mov	"\0\0EL",r10
! RETURN STATEMENT...
	mov	135,r13		! source line 135
	mov	"\0\0RE",r10
!   ReturnResult: j  (sizeInBytes=4)
	load	[r14+12],r1
	store	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_201:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_Max:
	.word	_sourceFileName
	.word	_Label_202
	.word	8		! total size of parameters
	.word	0		! frame size = 0
	.word	_Label_203
	.word	8
	.word	4
	.word	_Label_204
	.word	12
	.word	4
	.word	0
_Label_202:
	.ascii	"Max\0"
	.align
_Label_203:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_204:
	.byte	'I'
	.ascii	"j\0"
	.align
! 
! ===============  FUNCTION printIntVar  ===============
! 
_P_System_printIntVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_printIntVar,r1
	push	r1
	mov	2,r1
_Label_426:
	push	r0
	sub	r1,1,r1
	bne	_Label_426
	mov	141,r13		! source line 141
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	149,r13		! source line 149
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_205 = _StringConst_1
	set	_StringConst_1,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_205  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	150,r13		! source line 150
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=i  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+0]
!   Call the function
	mov	151,r13		! source line 151
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   Call the function
	mov	152,r13		! source line 152
	mov	"\0\0CA",r10
	call	_P_System_nl
! RETURN STATEMENT...
	mov	152,r13		! source line 152
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_printIntVar:
	.word	_sourceFileName
	.word	_Label_206
	.word	8		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_207
	.word	8
	.word	4
	.word	_Label_208
	.word	12
	.word	4
	.word	_Label_209
	.word	-12
	.word	4
	.word	0
_Label_206:
	.ascii	"printIntVar\0"
	.align
_Label_207:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_208:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_209:
	.byte	'?'
	.ascii	"_temp_205\0"
	.align
! 
! ===============  FUNCTION printHexVar  ===============
! 
_P_System_printHexVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_printHexVar,r1
	push	r1
	mov	2,r1
_Label_427:
	push	r0
	sub	r1,1,r1
	bne	_Label_427
	mov	157,r13		! source line 157
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	165,r13		! source line 165
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_210 = _StringConst_2
	set	_StringConst_2,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_210  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	166,r13		! source line 166
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=i  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+0]
!   Call the function
	mov	167,r13		! source line 167
	mov	"\0\0CE",r10
	call	printHex
! CALL STATEMENT...
!   Call the function
	mov	168,r13		! source line 168
	mov	"\0\0CA",r10
	call	_P_System_nl
! RETURN STATEMENT...
	mov	168,r13		! source line 168
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_printHexVar:
	.word	_sourceFileName
	.word	_Label_211
	.word	8		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_212
	.word	8
	.word	4
	.word	_Label_213
	.word	12
	.word	4
	.word	_Label_214
	.word	-12
	.word	4
	.word	0
_Label_211:
	.ascii	"printHexVar\0"
	.align
_Label_212:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_213:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_214:
	.byte	'?'
	.ascii	"_temp_210\0"
	.align
! 
! ===============  FUNCTION printBoolVar  ===============
! 
_P_System_printBoolVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_printBoolVar,r1
	push	r1
	mov	2,r1
_Label_428:
	push	r0
	sub	r1,1,r1
	bne	_Label_428
	mov	173,r13		! source line 173
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	181,r13		! source line 181
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_215 = _StringConst_3
	set	_StringConst_3,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_215  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	182,r13		! source line 182
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=b  sizeInBytes=1
	loadb	[r14+12],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	183,r13		! source line 183
	mov	"\0\0CE",r10
	call	printBool
! CALL STATEMENT...
!   Call the function
	mov	184,r13		! source line 184
	mov	"\0\0CA",r10
	call	_P_System_nl
! RETURN STATEMENT...
	mov	184,r13		! source line 184
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_printBoolVar:
	.word	_sourceFileName
	.word	_Label_216
	.word	8		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_217
	.word	8
	.word	4
	.word	_Label_218
	.word	12
	.word	1
	.word	_Label_219
	.word	-12
	.word	4
	.word	0
_Label_216:
	.ascii	"printBoolVar\0"
	.align
_Label_217:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_218:
	.byte	'B'
	.ascii	"b\0"
	.align
_Label_219:
	.byte	'?'
	.ascii	"_temp_215\0"
	.align
! 
! ===============  FUNCTION printCharVar  ===============
! 
_P_System_printCharVar:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_printCharVar,r1
	push	r1
	mov	3,r1
_Label_429:
	push	r0
	sub	r1,1,r1
	bne	_Label_429
	mov	189,r13		! source line 189
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	197,r13		! source line 197
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_220 = _StringConst_4
	set	_StringConst_4,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_220  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	198,r13		! source line 198
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=c  sizeInBytes=1
	loadb	[r14+12],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	199,r13		! source line 199
	mov	"\0\0CE",r10
	call	printChar
! CALL STATEMENT...
!   _temp_221 = _StringConst_5
	set	_StringConst_5,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_221  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	200,r13		! source line 200
	mov	"\0\0CE",r10
	call	print
! RETURN STATEMENT...
	mov	200,r13		! source line 200
	mov	"\0\0RE",r10
	add	r15,16,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_printCharVar:
	.word	_sourceFileName
	.word	_Label_222
	.word	8		! total size of parameters
	.word	12		! frame size = 12
	.word	_Label_223
	.word	8
	.word	4
	.word	_Label_224
	.word	12
	.word	1
	.word	_Label_225
	.word	-12
	.word	4
	.word	_Label_226
	.word	-16
	.word	4
	.word	0
_Label_222:
	.ascii	"printCharVar\0"
	.align
_Label_223:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_224:
	.byte	'C'
	.ascii	"c\0"
	.align
_Label_225:
	.byte	'?'
	.ascii	"_temp_221\0"
	.align
_Label_226:
	.byte	'?'
	.ascii	"_temp_220\0"
	.align
! 
! ===============  FUNCTION printPtr  ===============
! 
_P_System_printPtr:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_printPtr,r1
	push	r1
	mov	3,r1
_Label_430:
	push	r0
	sub	r1,1,r1
	bne	_Label_430
	mov	205,r13		! source line 205
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=s  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	213,r13		! source line 213
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_227 = _StringConst_6
	set	_StringConst_6,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_227  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	214,r13		! source line 214
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_228 = p		(4 bytes)
	load	[r14+12],r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_228  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	215,r13		! source line 215
	mov	"\0\0CE",r10
	call	printHex
! CALL STATEMENT...
!   Call the function
	mov	216,r13		! source line 216
	mov	"\0\0CA",r10
	call	_P_System_nl
! RETURN STATEMENT...
	mov	216,r13		! source line 216
	mov	"\0\0RE",r10
	add	r15,16,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_printPtr:
	.word	_sourceFileName
	.word	_Label_229
	.word	8		! total size of parameters
	.word	12		! frame size = 12
	.word	_Label_230
	.word	8
	.word	4
	.word	_Label_231
	.word	12
	.word	4
	.word	_Label_232
	.word	-12
	.word	4
	.word	_Label_233
	.word	-16
	.word	4
	.word	0
_Label_229:
	.ascii	"printPtr\0"
	.align
_Label_230:
	.byte	'P'
	.ascii	"s\0"
	.align
_Label_231:
	.byte	'P'
	.ascii	"p\0"
	.align
_Label_232:
	.byte	'?'
	.ascii	"_temp_228\0"
	.align
_Label_233:
	.byte	'?'
	.ascii	"_temp_227\0"
	.align
! 
! ===============  FUNCTION nl  ===============
! 
_P_System_nl:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_nl,r1
	push	r1
	mov	1,r1
_Label_431:
	push	r0
	sub	r1,1,r1
	bne	_Label_431
	mov	221,r13		! source line 221
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=10  sizeInBytes=1
	mov	10,r1
	storeb	r1,[r15+0]
!   Call the function
	mov	222,r13		! source line 222
	mov	"\0\0CE",r10
	call	printChar
! RETURN STATEMENT...
	mov	222,r13		! source line 222
	mov	"\0\0RE",r10
	add	r15,8,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_nl:
	.word	_sourceFileName
	.word	_Label_234
	.word	0		! total size of parameters
	.word	4		! frame size = 4
	.word	0
_Label_234:
	.ascii	"nl\0"
	.align
! 
! ===============  FUNCTION printNullTerminatedString  ===============
! 
_function_31_printNullTerminatedString:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_31_printNullTerminatedString,r1
	push	r1
	mov	2,r1
_Label_432:
	push	r0
	sub	r1,1,r1
	bne	_Label_432
	mov	227,r13		! source line 227
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! WHILE STATEMENT...
	mov	233,r13		! source line 233
	mov	"\0\0WH",r10
_Label_235:
!	_Label_236	jmp	_Label_236
_Label_236:
	mov	233,r13		! source line 233
	mov	"\0\0WB",r10
! ASSIGNMENT STATEMENT...
	mov	234,r13		! source line 234
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
	mov	235,r13		! source line 235
	mov	"\0\0IF",r10
!   _temp_240 = ch XOR 0		(bool)
	loadb	[r14+-10],r1
	mov	0,r2
	xor	r1,r2,r1
	storeb	r1,[r14+-9]
!   if _temp_240 then goto _Label_239 else goto _Label_238
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_238
	jmp	_Label_239
_Label_238:
! THEN...
	mov	236,r13		! source line 236
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	236,r13		! source line 236
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_239:
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=ch  sizeInBytes=1
	loadb	[r14+-10],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	238,r13		! source line 238
	mov	"\0\0CE",r10
	call	printChar
! ASSIGNMENT STATEMENT...
	mov	239,r13		! source line 239
	mov	"\0\0AS",r10
!   p = p + 1		(int)
	load	[r14+8],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! END WHILE...
	jmp	_Label_235
_Label_237:
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_31_printNullTerminatedString:
	.word	_sourceFileName
	.word	_Label_241
	.word	4		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_242
	.word	8
	.word	4
	.word	_Label_243
	.word	-9
	.word	1
	.word	_Label_244
	.word	-10
	.word	1
	.word	0
_Label_241:
	.ascii	"printNullTerminatedString\0"
	.align
_Label_242:
	.byte	'P'
	.ascii	"p\0"
	.align
_Label_243:
	.byte	'C'
	.ascii	"_temp_240\0"
	.align
_Label_244:
	.byte	'C'
	.ascii	"ch\0"
	.align
! 
! ===============  FUNCTION PrintMemory  ===============
! 
_P_System_PrintMemory:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_PrintMemory,r1
	push	r1
	mov	13,r1
_Label_433:
	push	r0
	sub	r1,1,r1
	bne	_Label_433
	mov	245,r13		! source line 245
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	252,r13		! source line 252
	mov	"\0\0AS",r10
!   _temp_245 = startingAddr div 32		(int)
	load	[r14+8],r1
	mov	32,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	div	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-48]
!   charPtr = _temp_245 * 32		(int)
	load	[r14+-48],r1
	mov	32,r2
	mul	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-56]
! FOR STATEMENT...
	mov	253,r13		! source line 253
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_250 = 0		(4 bytes)
	mov	0,r1
	store	r1,[r14+-44]
!   Calculate and save the FOR-LOOP ending value
!   _temp_251 = numBytes + 31		(int)
	load	[r14+12],r1
	mov	31,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-40]
!   Initialize FOR-LOOP index variable
!   Data Move: i = _temp_250  (sizeInBytes=4)
	load	[r14+-44],r1
	store	r1,[r14+-52]
_Label_246:
!   Perform the FOR-LOOP termination test
!   if i > _temp_251 then goto _Label_249		
	load	[r14+-52],r1
	load	[r14+-40],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_249
_Label_247:
	mov	253,r13		! source line 253
	mov	"\0\0FB",r10
! IF STATEMENT...
	mov	255,r13		! source line 255
	mov	"\0\0IF",r10
!   _temp_254 = i rem 8192		(int)
	load	[r14+-52],r1
	mov	8192,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-36]
!   if intIsZero (_temp_254) then goto _Label_252
	load	[r14+-36],r1
	cmp	r1,r0
	be	_Label_252
	jmp	_Label_253
_Label_252:
! THEN...
	mov	256,r13		! source line 256
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_255 = _StringConst_7
	set	_StringConst_7,r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_255  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	256,r13		! source line 256
	mov	"\0\0CE",r10
	call	print
! END IF...
_Label_253:
! IF STATEMENT...
	mov	258,r13		! source line 258
	mov	"\0\0IF",r10
!   _temp_258 = i rem 32		(int)
	load	[r14+-52],r1
	mov	32,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-28]
!   if intIsZero (_temp_258) then goto _Label_256
	load	[r14+-28],r1
	cmp	r1,r0
	be	_Label_256
	jmp	_Label_257
_Label_256:
! THEN...
	mov	259,r13		! source line 259
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   Call the function
	mov	259,r13		! source line 259
	mov	"\0\0CA",r10
	call	_P_System_nl
! CALL STATEMENT...
!   _temp_259 = charPtr		(4 bytes)
	load	[r14+-56],r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_259  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	260,r13		! source line 260
	mov	"\0\0CE",r10
	call	printHex
! CALL STATEMENT...
!   _temp_260 = _StringConst_8
	set	_StringConst_8,r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_260  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	261,r13		! source line 261
	mov	"\0\0CE",r10
	call	print
! END IF...
_Label_257:
! CALL STATEMENT...
!   if intIsZero (charPtr) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_261 = *charPtr  (sizeInBytes=1)
	load	[r14+-56],r1
	loadb	[r1],r1
	storeb	r1,[r14+-9]
!   Prepare Argument: offset=8  value=_temp_261  sizeInBytes=1
	loadb	[r14+-9],r1
	storeb	r1,[r15+0]
!   Call the function
	mov	266,r13		! source line 266
	mov	"\0\0CE",r10
	call	printChar
! ASSIGNMENT STATEMENT...
	mov	267,r13		! source line 267
	mov	"\0\0AS",r10
!   charPtr = charPtr + 1		(int)
	load	[r14+-56],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-56]
!   Increment the FOR-LOOP index variable and jump back
_Label_248:
!   i = i + 1
	load	[r14+-52],r1
	add	r1,1,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-52]
	jmp	_Label_246
! END FOR
_Label_249:
! CALL STATEMENT...
!   _temp_262 = _StringConst_9
	set	_StringConst_9,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_262  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	269,r13		! source line 269
	mov	"\0\0CE",r10
	call	print
! RETURN STATEMENT...
	mov	269,r13		! source line 269
	mov	"\0\0RE",r10
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_PrintMemory:
	.word	_sourceFileName
	.word	_Label_263
	.word	8		! total size of parameters
	.word	52		! frame size = 52
	.word	_Label_264
	.word	8
	.word	4
	.word	_Label_265
	.word	12
	.word	4
	.word	_Label_266
	.word	-16
	.word	4
	.word	_Label_267
	.word	-9
	.word	1
	.word	_Label_268
	.word	-20
	.word	4
	.word	_Label_269
	.word	-24
	.word	4
	.word	_Label_270
	.word	-28
	.word	4
	.word	_Label_271
	.word	-32
	.word	4
	.word	_Label_272
	.word	-36
	.word	4
	.word	_Label_273
	.word	-40
	.word	4
	.word	_Label_274
	.word	-44
	.word	4
	.word	_Label_275
	.word	-48
	.word	4
	.word	_Label_276
	.word	-52
	.word	4
	.word	_Label_277
	.word	-56
	.word	4
	.word	0
_Label_263:
	.ascii	"PrintMemory\0"
	.align
_Label_264:
	.byte	'I'
	.ascii	"startingAddr\0"
	.align
_Label_265:
	.byte	'I'
	.ascii	"numBytes\0"
	.align
_Label_266:
	.byte	'?'
	.ascii	"_temp_262\0"
	.align
_Label_267:
	.byte	'C'
	.ascii	"_temp_261\0"
	.align
_Label_268:
	.byte	'?'
	.ascii	"_temp_260\0"
	.align
_Label_269:
	.byte	'?'
	.ascii	"_temp_259\0"
	.align
_Label_270:
	.byte	'?'
	.ascii	"_temp_258\0"
	.align
_Label_271:
	.byte	'?'
	.ascii	"_temp_255\0"
	.align
_Label_272:
	.byte	'?'
	.ascii	"_temp_254\0"
	.align
_Label_273:
	.byte	'?'
	.ascii	"_temp_251\0"
	.align
_Label_274:
	.byte	'?'
	.ascii	"_temp_250\0"
	.align
_Label_275:
	.byte	'?'
	.ascii	"_temp_245\0"
	.align
_Label_276:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_277:
	.byte	'P'
	.ascii	"charPtr\0"
	.align
! 
! ===============  FUNCTION KPLSystemInitialize  ===============
! 
_P_System_KPLSystemInitialize:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_KPLSystemInitialize,r1
	push	r1
	mov	6,r1
_Label_434:
	push	r0
	sub	r1,1,r1
	bne	_Label_434
	mov	295,r13		! source line 295
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! p
!   p = &_Global_memoryArea
	set	_Global_memoryArea,r1
	store	r1,[r14+-28]
! ASSIGNMENT STATEMENT...
	mov	308,r13		! source line 308
	mov	"\0\0AS",r10
!   _P_System_FatalError = _function_30_FatalError_SimpleVersion
	set	_function_30_FatalError_SimpleVersion,r1
	set	_P_System_FatalError,r2
	store	r1,[r2]
! ASSIGNMENT STATEMENT...
	mov	309,r13		! source line 309
	mov	"\0\0AS",r10
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-28],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: *p = 20000  (sizeInBytes=4)
	mov	20000,r1
	load	[r14+-28],r2
	store	r1,[r2]
! FOR STATEMENT...
	mov	310,r13		! source line 310
	mov	"\0\0FO",r10
!   Calculate and save the FOR-LOOP starting value
!   _temp_282 = p + 4		(int)
	load	[r14+-28],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-24]
!   Calculate and save the FOR-LOOP ending value
!   _temp_285 = p + 4		(int)
	load	[r14+-28],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-12]
!   _temp_284 = _temp_285 + 20000		(int)
	load	[r14+-12],r1
	mov	20000,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-16]
!   _temp_283 = _temp_284 - 1		(int)
	load	[r14+-16],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-20]
!   Initialize FOR-LOOP index variable
!   Data Move: p2 = _temp_282  (sizeInBytes=4)
	load	[r14+-24],r1
	store	r1,[r14+-32]
_Label_278:
!   Perform the FOR-LOOP termination test
!   if p2 > _temp_283 then goto _Label_281		
	load	[r14+-32],r1
	load	[r14+-20],r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_281
_Label_279:
	mov	310,r13		! source line 310
	mov	"\0\0FB",r10
! ASSIGNMENT STATEMENT...
	mov	311,r13		! source line 311
	mov	"\0\0AS",r10
!   if intIsZero (p2) then goto _runtimeErrorNullPointer
	load	[r14+-32],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: *p2 = 1212498256  (sizeInBytes=4)
	set	1212498256,r1
	load	[r14+-32],r2
	store	r1,[r2]
!   Increment the FOR-LOOP index variable and jump back
_Label_280:
!   p2 = p2 + 100
	load	[r14+-32],r1
	add	r1,100,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-32]
	jmp	_Label_278
! END FOR
_Label_281:
! RETURN STATEMENT...
	mov	310,r13		! source line 310
	mov	"\0\0RE",r10
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_KPLSystemInitialize:
	.word	_sourceFileName
	.word	_Label_286
	.word	0		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_287
	.word	-12
	.word	4
	.word	_Label_288
	.word	-16
	.word	4
	.word	_Label_289
	.word	-20
	.word	4
	.word	_Label_290
	.word	-24
	.word	4
	.word	_Label_291
	.word	-28
	.word	4
	.word	_Label_292
	.word	-32
	.word	4
	.word	0
_Label_286:
	.ascii	"KPLSystemInitialize\0"
	.align
_Label_287:
	.byte	'?'
	.ascii	"_temp_285\0"
	.align
_Label_288:
	.byte	'?'
	.ascii	"_temp_284\0"
	.align
_Label_289:
	.byte	'?'
	.ascii	"_temp_283\0"
	.align
_Label_290:
	.byte	'?'
	.ascii	"_temp_282\0"
	.align
_Label_291:
	.byte	'P'
	.ascii	"p\0"
	.align
_Label_292:
	.byte	'P'
	.ascii	"p2\0"
	.align
! 
! ===============  FUNCTION FatalError_SimpleVersion  ===============
! 
_function_30_FatalError_SimpleVersion:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_30_FatalError_SimpleVersion,r1
	push	r1
	mov	3,r1
_Label_435:
	push	r0
	sub	r1,1,r1
	bne	_Label_435
	mov	317,r13		! source line 317
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   _temp_293 = _StringConst_10
	set	_StringConst_10,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_293  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	318,r13		! source line 318
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=errorMessage  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	319,r13		! source line 319
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_294 = _StringConst_11
	set	_StringConst_11,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_294  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	320,r13		! source line 320
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Call the function
	mov	321,r13		! source line 321
	mov	"\0\0CE",r10
	call	RuntimeExit
! RETURN STATEMENT...
	mov	321,r13		! source line 321
	mov	"\0\0RE",r10
	add	r15,16,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_30_FatalError_SimpleVersion:
	.word	_sourceFileName
	.word	_Label_295
	.word	4		! total size of parameters
	.word	12		! frame size = 12
	.word	_Label_296
	.word	8
	.word	4
	.word	_Label_297
	.word	-12
	.word	4
	.word	_Label_298
	.word	-16
	.word	4
	.word	0
_Label_295:
	.ascii	"FatalError_SimpleVersion\0"
	.align
_Label_296:
	.byte	'P'
	.ascii	"errorMessage\0"
	.align
_Label_297:
	.byte	'?'
	.ascii	"_temp_294\0"
	.align
_Label_298:
	.byte	'?'
	.ascii	"_temp_293\0"
	.align
! 
! ===============  FUNCTION KPLMemoryAlloc  ===============
! 
_P_System_KPLMemoryAlloc:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_KPLMemoryAlloc,r1
	push	r1
	mov	13,r1
_Label_436:
	push	r0
	sub	r1,1,r1
	bne	_Label_436
	mov	326,r13		! source line 326
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	344,r13		! source line 344
	mov	"\0\0IF",r10
!   if _Global_alreadyInAlloc then goto _Label_299 else goto _Label_300
	set	_Global_alreadyInAlloc,r1
	loadb	[r1],r1
	cmp	r1,0
	be	_Label_300
	jmp	_Label_299
_Label_299:
! THEN...
	mov	345,r13		! source line 345
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_301 = _StringConst_12
	set	_StringConst_12,r1
	store	r1,[r14+-48]
!   Prepare Argument: offset=8  value=_temp_301  sizeInBytes=4
	load	[r14+-48],r1
	store	r1,[r15+0]
!   Call the function
	mov	345,r13		! source line 345
	mov	"\0\0CA",r10
	call	_P_System_KPLSystemError
! END IF...
_Label_300:
! ASSIGNMENT STATEMENT...
	mov	347,r13		! source line 347
	mov	"\0\0AS",r10
!   _Global_alreadyInAlloc = 1		(1 byte)
	mov	1,r1
	set	_Global_alreadyInAlloc,r2
	storeb	r1,[r2]
! ASSIGNMENT STATEMENT...
	mov	349,r13		! source line 349
	mov	"\0\0AS",r10
!   i = _Global_nextCharToUse		(4 bytes)
	set	_Global_nextCharToUse,r1
	load	[r1],r1
	store	r1,[r14+-52]
! IF STATEMENT...
	mov	350,r13		! source line 350
	mov	"\0\0IF",r10
!   if byteCount > 0 then goto _Label_303		(int)
	load	[r14+8],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_303
!	_Label_302	jmp	_Label_302
_Label_302:
! THEN...
	mov	351,r13		! source line 351
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_304 = _StringConst_13
	set	_StringConst_13,r1
	store	r1,[r14+-44]
!   Prepare Argument: offset=8  value=_temp_304  sizeInBytes=4
	load	[r14+-44],r1
	store	r1,[r15+0]
!   Call the function
	mov	351,r13		! source line 351
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=byteCount  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	352,r13		! source line 352
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   _temp_305 = _StringConst_14
	set	_StringConst_14,r1
	store	r1,[r14+-40]
!   Prepare Argument: offset=8  value=_temp_305  sizeInBytes=4
	load	[r14+-40],r1
	store	r1,[r15+0]
!   Call the function
	mov	353,r13		! source line 353
	mov	"\0\0CA",r10
	call	_P_System_KPLSystemError
! END IF...
_Label_303:
! ASSIGNMENT STATEMENT...
	mov	357,r13		! source line 357
	mov	"\0\0AS",r10
!   byteCount = byteCount + 4		(int)
	load	[r14+8],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! IF STATEMENT...
	mov	360,r13		! source line 360
	mov	"\0\0IF",r10
!   _temp_308 = byteCount rem 8		(int)
	load	[r14+8],r1
	mov	8,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-36]
!   if _temp_308 <= 0 then goto _Label_307		(int)
	load	[r14+-36],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_307
!	_Label_306	jmp	_Label_306
_Label_306:
! THEN...
	mov	361,r13		! source line 361
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	361,r13		! source line 361
	mov	"\0\0AS",r10
!   _temp_310 = byteCount div 8		(int)
	load	[r14+8],r1
	mov	8,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	div	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-28]
!   _temp_309 = _temp_310 + 1		(int)
	load	[r14+-28],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-32]
!   byteCount = _temp_309 * 8		(int)
	load	[r14+-32],r1
	mov	8,r2
	mul	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+8]
! END IF...
_Label_307:
! ASSIGNMENT STATEMENT...
	mov	375,r13		! source line 375
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
	mov	376,r13		! source line 376
	mov	"\0\0IF",r10
!   if _Global_nextCharToUse <= 20000 then goto _Label_312		(int)
	set	_Global_nextCharToUse,r1
	load	[r1],r1
	mov	20000,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	ble	_Label_312
!	_Label_311	jmp	_Label_311
_Label_311:
! THEN...
	mov	377,r13		! source line 377
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_313 = _StringConst_15
	set	_StringConst_15,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_313  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	377,r13		! source line 377
	mov	"\0\0CA",r10
	call	_P_System_KPLSystemError
! END IF...
_Label_312:
! ASSIGNMENT STATEMENT...
	mov	379,r13		! source line 379
	mov	"\0\0AS",r10
!   _temp_314 = &_Global_memoryArea
	set	_Global_memoryArea,r1
	store	r1,[r14+-20]
!   Move address of _temp_314 [i ] into _temp_315
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
!   p = _temp_315		(4 bytes)
	load	[r14+-16],r1
	store	r1,[r14+-56]
! ASSIGNMENT STATEMENT...
	mov	380,r13		! source line 380
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
	mov	382,r13		! source line 382
	mov	"\0\0AS",r10
!   _Global_alreadyInAlloc = 0		(1 byte)
	mov	0,r1
	set	_Global_alreadyInAlloc,r2
	storeb	r1,[r2]
! RETURN STATEMENT...
	mov	384,r13		! source line 384
	mov	"\0\0RE",r10
!   _temp_316 = p + 4		(int)
	load	[r14+-56],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-12]
!   ReturnResult: _temp_316  (sizeInBytes=4)
	load	[r14+-12],r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_KPLMemoryAlloc:
	.word	_sourceFileName
	.word	_Label_317
	.word	4		! total size of parameters
	.word	52		! frame size = 52
	.word	_Label_318
	.word	8
	.word	4
	.word	_Label_319
	.word	-12
	.word	4
	.word	_Label_320
	.word	-16
	.word	4
	.word	_Label_321
	.word	-20
	.word	4
	.word	_Label_322
	.word	-24
	.word	4
	.word	_Label_323
	.word	-28
	.word	4
	.word	_Label_324
	.word	-32
	.word	4
	.word	_Label_325
	.word	-36
	.word	4
	.word	_Label_326
	.word	-40
	.word	4
	.word	_Label_327
	.word	-44
	.word	4
	.word	_Label_328
	.word	-48
	.word	4
	.word	_Label_329
	.word	-52
	.word	4
	.word	_Label_330
	.word	-56
	.word	4
	.word	0
_Label_317:
	.ascii	"KPLMemoryAlloc\0"
	.align
_Label_318:
	.byte	'I'
	.ascii	"byteCount\0"
	.align
_Label_319:
	.byte	'?'
	.ascii	"_temp_316\0"
	.align
_Label_320:
	.byte	'?'
	.ascii	"_temp_315\0"
	.align
_Label_321:
	.byte	'?'
	.ascii	"_temp_314\0"
	.align
_Label_322:
	.byte	'?'
	.ascii	"_temp_313\0"
	.align
_Label_323:
	.byte	'?'
	.ascii	"_temp_310\0"
	.align
_Label_324:
	.byte	'?'
	.ascii	"_temp_309\0"
	.align
_Label_325:
	.byte	'?'
	.ascii	"_temp_308\0"
	.align
_Label_326:
	.byte	'?'
	.ascii	"_temp_305\0"
	.align
_Label_327:
	.byte	'?'
	.ascii	"_temp_304\0"
	.align
_Label_328:
	.byte	'?'
	.ascii	"_temp_301\0"
	.align
_Label_329:
	.byte	'I'
	.ascii	"i\0"
	.align
_Label_330:
	.byte	'P'
	.ascii	"p\0"
	.align
! 
! ===============  FUNCTION KPLMemoryFree  ===============
! 
_P_System_KPLMemoryFree:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_KPLMemoryFree,r1
	push	r1
	mov	390,r13		! source line 390
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! RETURN STATEMENT...
	mov	390,r13		! source line 390
	mov	"\0\0RE",r10
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_KPLMemoryFree:
	.word	_sourceFileName
	.word	_Label_331
	.word	4		! total size of parameters
	.word	0		! frame size = 0
	.word	_Label_332
	.word	8
	.word	4
	.word	0
_Label_331:
	.ascii	"KPLMemoryFree\0"
	.align
_Label_332:
	.byte	'P'
	.ascii	"p\0"
	.align
! 
! ===============  FUNCTION KPLSystemError  ===============
! 
_P_System_KPLSystemError:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_KPLSystemError,r1
	push	r1
	mov	2,r1
_Label_437:
	push	r0
	sub	r1,1,r1
	bne	_Label_437
	mov	404,r13		! source line 404
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   _temp_333 = _StringConst_16
	set	_StringConst_16,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_333  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	411,r13		! source line 411
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=message  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	412,r13		! source line 412
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Call the function
	mov	413,r13		! source line 413
	mov	"\0\0CA",r10
	call	_P_System_nl
! CALL STATEMENT...
!   Call the function
	mov	414,r13		! source line 414
	mov	"\0\0CE",r10
	call	RuntimeExit
! RETURN STATEMENT...
	mov	414,r13		! source line 414
	mov	"\0\0RE",r10
	add	r15,12,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_KPLSystemError:
	.word	_sourceFileName
	.word	_Label_334
	.word	4		! total size of parameters
	.word	8		! frame size = 8
	.word	_Label_335
	.word	8
	.word	4
	.word	_Label_336
	.word	-12
	.word	4
	.word	0
_Label_334:
	.ascii	"KPLSystemError\0"
	.align
_Label_335:
	.byte	'P'
	.ascii	"message\0"
	.align
_Label_336:
	.byte	'?'
	.ascii	"_temp_333\0"
	.align
! 
! ===============  FUNCTION KPLIsKindOf  ===============
! 
_P_System_KPLIsKindOf:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_KPLIsKindOf,r1
	push	r1
	mov	13,r1
_Label_438:
	push	r0
	sub	r1,1,r1
	bne	_Label_438
	mov	469,r13		! source line 469
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	483,r13		! source line 483
	mov	"\0\0IF",r10
!   if intIsZero (objPtr) then goto _Label_337
	load	[r14+8],r1
	cmp	r1,r0
	be	_Label_337
	jmp	_Label_338
_Label_337:
! THEN...
	mov	484,r13		! source line 484
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_339 = _StringConst_17
	set	_StringConst_17,r1
	store	r1,[r14+-44]
!   Prepare Argument: offset=8  value=_temp_339  sizeInBytes=4
	load	[r14+-44],r1
	store	r1,[r15+0]
!   Call the function
	mov	484,r13		! source line 484
	mov	"\0\0CA",r10
	call	_P_System_KPLSystemError
! END IF...
_Label_338:
! ASSIGNMENT STATEMENT...
	mov	488,r13		! source line 488
	mov	"\0\0AS",r10
!   if intIsZero (objPtr) then goto _runtimeErrorNullPointer
	load	[r14+8],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_340 = objPtr + 0
	load	[r14+8],r1
	add	r1,0,r1
	store	r1,[r14+-40]
!   Data Move: dispTable = *_temp_340  (sizeInBytes=4)
	load	[r14+-40],r1
	load	[r1],r1
	store	r1,[r14+-48]
! IF STATEMENT...
	mov	489,r13		! source line 489
	mov	"\0\0IF",r10
!   if intIsZero (dispTable) then goto _Label_341
	load	[r14+-48],r1
	cmp	r1,r0
	be	_Label_341
	jmp	_Label_342
_Label_341:
! THEN...
	mov	490,r13		! source line 490
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	490,r13		! source line 490
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=4)
	mov	0,r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_342:
! ASSIGNMENT STATEMENT...
	mov	493,r13		! source line 493
	mov	"\0\0AS",r10
!   if intIsZero (dispTable) then goto _runtimeErrorNullPointer
	load	[r14+-48],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_343 = dispTable + 0
	load	[r14+-48],r1
	add	r1,0,r1
	store	r1,[r14+-36]
!   Data Move: classDesc = *_temp_343  (sizeInBytes=4)
	load	[r14+-36],r1
	load	[r1],r1
	store	r1,[r14+-52]
! IF STATEMENT...
	mov	496,r13		! source line 496
	mov	"\0\0IF",r10
!   if intIsZero (classDesc) then goto _runtimeErrorNullPointer
	load	[r14+-52],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_347 = classDesc + 0
	load	[r14+-52],r1
	add	r1,0,r1
	store	r1,[r14+-28]
!   Data Move: _temp_346 = *_temp_347  (sizeInBytes=4)
	load	[r14+-28],r1
	load	[r1],r1
	store	r1,[r14+-32]
!   if _temp_346 == 1129070931 then goto _Label_345		(int)
	load	[r14+-32],r1
	set	1129070931,r2
	cmp	r1,r2
	be	_Label_345
!	_Label_344	jmp	_Label_344
_Label_344:
! THEN...
	mov	497,r13		! source line 497
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_348 = _StringConst_18
	set	_StringConst_18,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_348  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	497,r13		! source line 497
	mov	"\0\0CA",r10
	call	_P_System_KPLSystemError
! END IF...
_Label_345:
! ASSIGNMENT STATEMENT...
	mov	501,r13		! source line 501
	mov	"\0\0AS",r10
!   if intIsZero (classDesc) then goto _runtimeErrorNullPointer
	load	[r14+-52],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_349 = classDesc + 20
	load	[r14+-52],r1
	add	r1,20,r1
	store	r1,[r14+-20]
!   next = _temp_349		(4 bytes)
	load	[r14+-20],r1
	store	r1,[r14+-56]
! WHILE STATEMENT...
	mov	502,r13		! source line 502
	mov	"\0\0WH",r10
_Label_350:
!	_Label_351	jmp	_Label_351
_Label_351:
	mov	502,r13		! source line 502
	mov	"\0\0WB",r10
! IF STATEMENT...
	mov	503,r13		! source line 503
	mov	"\0\0IF",r10
!   if intIsZero (next) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_355 = *next  (sizeInBytes=4)
	load	[r14+-56],r1
	load	[r1],r1
	store	r1,[r14+-16]
!   if intIsZero (_temp_355) then goto _Label_353
	load	[r14+-16],r1
	cmp	r1,r0
	be	_Label_353
	jmp	_Label_354
_Label_353:
! THEN...
	mov	504,r13		! source line 504
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	504,r13		! source line 504
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=4)
	mov	0,r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_356
_Label_354:
! ELSE...
	mov	505,r13		! source line 505
	mov	"\0\0EL",r10
! IF STATEMENT...
	mov	505,r13		! source line 505
	mov	"\0\0IF",r10
!   if intIsZero (next) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Data Move: _temp_359 = *next  (sizeInBytes=4)
	load	[r14+-56],r1
	load	[r1],r1
	store	r1,[r14+-12]
!   if _temp_359 != typeDesc then goto _Label_358		(int)
	load	[r14+-12],r1
	load	[r14+12],r2
	cmp	r1,r2
	bne	_Label_358
!	_Label_357	jmp	_Label_357
_Label_357:
! THEN...
	mov	506,r13		! source line 506
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	506,r13		! source line 506
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=4)
	mov	1,r1
	store	r1,[r14+8]
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_358:
! END IF...
_Label_356:
! ASSIGNMENT STATEMENT...
	mov	508,r13		! source line 508
	mov	"\0\0AS",r10
!   next = next + 4		(int)
	load	[r14+-56],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-56]
! END WHILE...
	jmp	_Label_350
_Label_352:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_KPLIsKindOf:
	.word	_sourceFileName
	.word	_Label_360
	.word	8		! total size of parameters
	.word	52		! frame size = 52
	.word	_Label_361
	.word	8
	.word	4
	.word	_Label_362
	.word	12
	.word	4
	.word	_Label_363
	.word	-12
	.word	4
	.word	_Label_364
	.word	-16
	.word	4
	.word	_Label_365
	.word	-20
	.word	4
	.word	_Label_366
	.word	-24
	.word	4
	.word	_Label_367
	.word	-28
	.word	4
	.word	_Label_368
	.word	-32
	.word	4
	.word	_Label_369
	.word	-36
	.word	4
	.word	_Label_370
	.word	-40
	.word	4
	.word	_Label_371
	.word	-44
	.word	4
	.word	_Label_372
	.word	-48
	.word	4
	.word	_Label_373
	.word	-52
	.word	4
	.word	_Label_374
	.word	-56
	.word	4
	.word	0
_Label_360:
	.ascii	"KPLIsKindOf\0"
	.align
_Label_361:
	.byte	'P'
	.ascii	"objPtr\0"
	.align
_Label_362:
	.byte	'P'
	.ascii	"typeDesc\0"
	.align
_Label_363:
	.byte	'?'
	.ascii	"_temp_359\0"
	.align
_Label_364:
	.byte	'?'
	.ascii	"_temp_355\0"
	.align
_Label_365:
	.byte	'?'
	.ascii	"_temp_349\0"
	.align
_Label_366:
	.byte	'?'
	.ascii	"_temp_348\0"
	.align
_Label_367:
	.byte	'?'
	.ascii	"_temp_347\0"
	.align
_Label_368:
	.byte	'?'
	.ascii	"_temp_346\0"
	.align
_Label_369:
	.byte	'?'
	.ascii	"_temp_343\0"
	.align
_Label_370:
	.byte	'?'
	.ascii	"_temp_340\0"
	.align
_Label_371:
	.byte	'?'
	.ascii	"_temp_339\0"
	.align
_Label_372:
	.byte	'P'
	.ascii	"dispTable\0"
	.align
_Label_373:
	.byte	'P'
	.ascii	"classDesc\0"
	.align
_Label_374:
	.byte	'P'
	.ascii	"next\0"
	.align
! 
! ===============  FUNCTION KPLUncaughtThrow  ===============
! 
_P_System_KPLUncaughtThrow:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_System_KPLUncaughtThrow,r1
	push	r1
	mov	10,r1
_Label_439:
	push	r0
	sub	r1,1,r1
	bne	_Label_439
	mov	514,r13		! source line 514
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! CALL STATEMENT...
!   _temp_375 = _StringConst_19
	set	_StringConst_19,r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_375  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	525,r13		! source line 525
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   _temp_376 = _StringConst_20
	set	_StringConst_20,r1
	store	r1,[r14+-28]
!   Prepare Argument: offset=8  value=_temp_376  sizeInBytes=4
	load	[r14+-28],r1
	store	r1,[r15+0]
!   Call the function
	mov	526,r13		! source line 526
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=errorID  sizeInBytes=4
	load	[r14+8],r1
	store	r1,[r15+0]
!   Call the function
	mov	527,r13		! source line 527
	mov	"\0\0CA",r10
	call	_function_31_printNullTerminatedString
! CALL STATEMENT...
!   Call the function
	mov	528,r13		! source line 528
	mov	"\0\0CA",r10
	call	_P_System_nl
! CALL STATEMENT...
!   _temp_377 = _StringConst_21
	set	_StringConst_21,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_377  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	529,r13		! source line 529
	mov	"\0\0CE",r10
	call	print
! ASSIGNMENT STATEMENT...
	mov	530,r13		! source line 530
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
	mov	531,r13		! source line 531
	mov	"\0\0CA",r10
	call	_function_31_printNullTerminatedString
! CALL STATEMENT...
!   _temp_378 = _StringConst_22
	set	_StringConst_22,r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_378  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	532,r13		! source line 532
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   Prepare Argument: offset=8  value=line  sizeInBytes=4
	load	[r14+12],r1
	store	r1,[r15+0]
!   Call the function
	mov	533,r13		! source line 533
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   Call the function
	mov	534,r13		! source line 534
	mov	"\0\0CA",r10
	call	_P_System_nl
! CALL STATEMENT...
!   _temp_379 = _StringConst_23
	set	_StringConst_23,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_379  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	535,r13		! source line 535
	mov	"\0\0CE",r10
	call	print
! ASSIGNMENT STATEMENT...
	mov	536,r13		! source line 536
	mov	"\0\0AS",r10
!   rPtr = rPtr + 4		(int)
	load	[r14+16],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+16]
! ASSIGNMENT STATEMENT...
	mov	537,r13		! source line 537
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
	mov	538,r13		! source line 538
	mov	"\0\0CA",r10
	call	_function_31_printNullTerminatedString
! CALL STATEMENT...
!   Call the function
	mov	539,r13		! source line 539
	mov	"\0\0CA",r10
	call	_P_System_nl
! CALL STATEMENT...
!   Call the function
	mov	540,r13		! source line 540
	mov	"\0\0CA",r10
	call	_function_29_printCatchStack
! CALL STATEMENT...
!   _temp_380 = _StringConst_24
	set	_StringConst_24,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=8  value=_temp_380  sizeInBytes=4
	load	[r14+-12],r1
	store	r1,[r15+0]
!   Call the function
	mov	541,r13		! source line 541
	mov	"\0\0CE",r10
	call	print
! THROW STATEMENT...
	mov	542,r13		! source line 542
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
	set	_Error_P_System_UncaughtThrowError,r4
	jmp	_PerformThrow
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_System_KPLUncaughtThrow:
	.word	_sourceFileName
	.word	_Label_381
	.word	12		! total size of parameters
	.word	40		! frame size = 40
	.word	_Label_382
	.word	8
	.word	4
	.word	_Label_383
	.word	12
	.word	4
	.word	_Label_384
	.word	16
	.word	4
	.word	_Label_385
	.word	-12
	.word	4
	.word	_Label_386
	.word	-16
	.word	4
	.word	_Label_387
	.word	-20
	.word	4
	.word	_Label_388
	.word	-24
	.word	4
	.word	_Label_389
	.word	-28
	.word	4
	.word	_Label_390
	.word	-32
	.word	4
	.word	_Label_391
	.word	-36
	.word	4
	.word	0
_Label_381:
	.ascii	"KPLUncaughtThrow\0"
	.align
_Label_382:
	.byte	'P'
	.ascii	"errorID\0"
	.align
_Label_383:
	.byte	'I'
	.ascii	"line\0"
	.align
_Label_384:
	.byte	'I'
	.ascii	"rPtr\0"
	.align
_Label_385:
	.byte	'?'
	.ascii	"_temp_380\0"
	.align
_Label_386:
	.byte	'?'
	.ascii	"_temp_379\0"
	.align
_Label_387:
	.byte	'?'
	.ascii	"_temp_378\0"
	.align
_Label_388:
	.byte	'?'
	.ascii	"_temp_377\0"
	.align
_Label_389:
	.byte	'?'
	.ascii	"_temp_376\0"
	.align
_Label_390:
	.byte	'?'
	.ascii	"_temp_375\0"
	.align
_Label_391:
	.byte	'P'
	.ascii	"charPtr\0"
	.align
! 
! ===============  FUNCTION printCatchStack  ===============
! 
_function_29_printCatchStack:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__function_29_printCatchStack,r1
	push	r1
	mov	13,r1
_Label_440:
	push	r0
	sub	r1,1,r1
	bne	_Label_440
	mov	547,r13		! source line 547
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! p
!   Call the function
	mov	560,r13		! source line 560
	mov	"\0\0CE",r10
	call	getCatchStack
!   Retrieve Result: targetName=p  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-56]
! CALL STATEMENT...
!   _temp_392 = _StringConst_25
	set	_StringConst_25,r1
	store	r1,[r14+-52]
!   Prepare Argument: offset=8  value=_temp_392  sizeInBytes=4
	load	[r14+-52],r1
	store	r1,[r15+0]
!   Call the function
	mov	561,r13		! source line 561
	mov	"\0\0CE",r10
	call	print
! WHILE STATEMENT...
	mov	562,r13		! source line 562
	mov	"\0\0WH",r10
_Label_393:
!   if p == 0 then goto _Label_395		(int)
	load	[r14+-56],r1
	mov	0,r2
	cmp	r1,r2
	be	_Label_395
!	_Label_394	jmp	_Label_394
_Label_394:
	mov	562,r13		! source line 562
	mov	"\0\0WB",r10
! CALL STATEMENT...
!   _temp_396 = _StringConst_26
	set	_StringConst_26,r1
	store	r1,[r14+-48]
!   Prepare Argument: offset=8  value=_temp_396  sizeInBytes=4
	load	[r14+-48],r1
	store	r1,[r15+0]
!   Call the function
	mov	563,r13		! source line 563
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_398 = p + 20
	load	[r14+-56],r1
	add	r1,20,r1
	store	r1,[r14+-40]
!   Data Move: _temp_397 = *_temp_398  (sizeInBytes=4)
	load	[r14+-40],r1
	load	[r1],r1
	store	r1,[r14+-44]
!   Prepare Argument: offset=8  value=_temp_397  sizeInBytes=4
	load	[r14+-44],r1
	store	r1,[r15+0]
!   Call the function
	mov	564,r13		! source line 564
	mov	"\0\0CA",r10
	call	_function_31_printNullTerminatedString
! CALL STATEMENT...
!   _temp_399 = _StringConst_27
	set	_StringConst_27,r1
	store	r1,[r14+-36]
!   Prepare Argument: offset=8  value=_temp_399  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+0]
!   Call the function
	mov	565,r13		! source line 565
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_401 = p + 24
	load	[r14+-56],r1
	add	r1,24,r1
	store	r1,[r14+-28]
!   Data Move: _temp_400 = *_temp_401  (sizeInBytes=4)
	load	[r14+-28],r1
	load	[r1],r1
	store	r1,[r14+-32]
!   Prepare Argument: offset=8  value=_temp_400  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	566,r13		! source line 566
	mov	"\0\0CE",r10
	call	printInt
! CALL STATEMENT...
!   _temp_402 = _StringConst_28
	set	_StringConst_28,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_402  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	567,r13		! source line 567
	mov	"\0\0CE",r10
	call	print
! CALL STATEMENT...
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_404 = p + 4
	load	[r14+-56],r1
	add	r1,4,r1
	store	r1,[r14+-16]
!   Data Move: _temp_403 = *_temp_404  (sizeInBytes=4)
	load	[r14+-16],r1
	load	[r1],r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_403  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	568,r13		! source line 568
	mov	"\0\0CA",r10
	call	_function_31_printNullTerminatedString
! CALL STATEMENT...
!   Call the function
	mov	572,r13		! source line 572
	mov	"\0\0CA",r10
	call	_P_System_nl
! ASSIGNMENT STATEMENT...
	mov	590,r13		! source line 590
	mov	"\0\0AS",r10
!   if intIsZero (p) then goto _runtimeErrorNullPointer
	load	[r14+-56],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_405 = p + 0
	load	[r14+-56],r1
	add	r1,0,r1
	store	r1,[r14+-12]
!   Data Move: p = *_temp_405  (sizeInBytes=4)
	load	[r14+-12],r1
	load	[r1],r1
	store	r1,[r14+-56]
! END WHILE...
	jmp	_Label_393
_Label_395:
! RETURN STATEMENT...
	mov	562,r13		! source line 562
	mov	"\0\0RE",r10
	add	r15,56,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__function_29_printCatchStack:
	.word	_sourceFileName
	.word	_Label_406
	.word	0		! total size of parameters
	.word	52		! frame size = 52
	.word	_Label_407
	.word	-12
	.word	4
	.word	_Label_408
	.word	-16
	.word	4
	.word	_Label_409
	.word	-20
	.word	4
	.word	_Label_410
	.word	-24
	.word	4
	.word	_Label_411
	.word	-28
	.word	4
	.word	_Label_412
	.word	-32
	.word	4
	.word	_Label_413
	.word	-36
	.word	4
	.word	_Label_414
	.word	-40
	.word	4
	.word	_Label_415
	.word	-44
	.word	4
	.word	_Label_416
	.word	-48
	.word	4
	.word	_Label_417
	.word	-52
	.word	4
	.word	_Label_418
	.word	-56
	.word	4
	.word	0
_Label_406:
	.ascii	"printCatchStack\0"
	.align
_Label_407:
	.byte	'?'
	.ascii	"_temp_405\0"
	.align
_Label_408:
	.byte	'?'
	.ascii	"_temp_404\0"
	.align
_Label_409:
	.byte	'?'
	.ascii	"_temp_403\0"
	.align
_Label_410:
	.byte	'?'
	.ascii	"_temp_402\0"
	.align
_Label_411:
	.byte	'?'
	.ascii	"_temp_401\0"
	.align
_Label_412:
	.byte	'?'
	.ascii	"_temp_400\0"
	.align
_Label_413:
	.byte	'?'
	.ascii	"_temp_399\0"
	.align
_Label_414:
	.byte	'?'
	.ascii	"_temp_398\0"
	.align
_Label_415:
	.byte	'?'
	.ascii	"_temp_397\0"
	.align
_Label_416:
	.byte	'?'
	.ascii	"_temp_396\0"
	.align
_Label_417:
	.byte	'?'
	.ascii	"_temp_392\0"
	.align
_Label_418:
	.byte	'P'
	.ascii	"p\0"
	.align
! 
! ===============  CLASS Object  ===============
! 
! Dispatch Table:
! 
_P_System_Object:
	.word	_Label_419
	.word	0
! 
! Class descriptor:
! 
_Label_419:
	.word	1129070931		! Magic number 0x434c4153 == 'CLAS'
	.word	_Label_420
	.word	_sourceFileName
	.word	76		! line number
	.word	4		! size of instances, in bytes
	.word	_P_System_Object
	.word	0
_Label_420:
	.ascii	"Object\0"
	.align
