! Name of package being compiled: Syscall
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
	.align
! Functions imported from other packages
! Externally visible functions in this package
	.export	_P_Syscall_entSize
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
! Global variables in this package
	.data
	.align
	.text
! 
! Source Filename and Package Name
! 
_sourceFileName:
	.ascii	"Syscall.k\0"
_packageName:
	.ascii	"Syscall\0"
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
_CheckVersion_P_Syscall_:
	.export	_CheckVersion_P_Syscall_
	set	0x73d5af34,r4		! myHashVal = 1943383860
	cmp	r3,r4
	be	_Label_1
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
_Label_1:
	mov	0,r1
_Label_2:
	ret
_CVMess1:	.ascii	"\nVERSION CONSISTENCY ERROR: Package '\0"
_CVMess2:	.ascii	"' uses package '\0"
_CVMess3:	.ascii	"'.  Whenever a header file is modified, all packages that use that package (directly or indirectly) must be recompiled.  The header file for '\0"
_CVMess4:	.ascii	"' has been changed since '\0"
_CVMess5:	.ascii	"' was compiled last.  Please recompile all packages that depend on '\0"
_CVMess6:	.ascii	"'.\n\n\0"
	.align
! 
! ===============  FUNCTION entSize  ===============
! 
_P_Syscall_entSize:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__P_Syscall_entSize,r1
	push	r1
	mov	6,r1
_Label_20:
	push	r0
	sub	r1,1,r1
	bne	_Label_20
	mov	4,r13		! source line 4
	mov	"\0\0FU",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	5,r13		! source line 5
	mov	"\0\0IF",r10
!   _temp_5 = numChars rem 4		(int)
	load	[r14+8],r1
	mov	4,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-32]
!   if intIsZero (_temp_5) then goto _Label_3
	load	[r14+-32],r1
	cmp	r1,r0
	be	_Label_3
	jmp	_Label_4
_Label_3:
! THEN...
	mov	6,r13		! source line 6
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	6,r13		! source line 6
	mov	"\0\0RE",r10
!   _temp_6 = 8 + numChars		(int)
	mov	8,r1
	load	[r14+8],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-28]
!   ReturnResult: _temp_6  (sizeInBytes=4)
	load	[r14+-28],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
	jmp	_Label_7
_Label_4:
! ELSE...
	mov	8,r13		! source line 8
	mov	"\0\0EL",r10
! RETURN STATEMENT...
	mov	8,r13		! source line 8
	mov	"\0\0RE",r10
!   _temp_10 = 8 + numChars		(int)
	mov	8,r1
	load	[r14+8],r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-16]
!   _temp_9 = _temp_10 + 4		(int)
	load	[r14+-16],r1
	mov	4,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-20]
!   _temp_11 = numChars rem 4		(int)
	load	[r14+8],r1
	mov	4,r2
	cmp	r2,0
	be	_runtimeErrorZeroDivide
	rem	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-12]
!   _temp_8 = _temp_9 - _temp_11		(int)
	load	[r14+-20],r1
	load	[r14+-12],r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	store	r1,[r14+-24]
!   ReturnResult: _temp_8  (sizeInBytes=4)
	load	[r14+-24],r1
	store	r1,[r14+8]
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_7:
! 
! Routine Descriptor
! 
_RoutineDescriptor__P_Syscall_entSize:
	.word	_sourceFileName
	.word	_Label_12
	.word	4		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_13
	.word	8
	.word	4
	.word	_Label_14
	.word	-12
	.word	4
	.word	_Label_15
	.word	-16
	.word	4
	.word	_Label_16
	.word	-20
	.word	4
	.word	_Label_17
	.word	-24
	.word	4
	.word	_Label_18
	.word	-28
	.word	4
	.word	_Label_19
	.word	-32
	.word	4
	.word	0
_Label_12:
	.ascii	"entSize\0"
	.align
_Label_13:
	.byte	'I'
	.ascii	"numChars\0"
	.align
_Label_14:
	.byte	'?'
	.ascii	"_temp_11\0"
	.align
_Label_15:
	.byte	'?'
	.ascii	"_temp_10\0"
	.align
_Label_16:
	.byte	'?'
	.ascii	"_temp_9\0"
	.align
_Label_17:
	.byte	'?'
	.ascii	"_temp_8\0"
	.align
_Label_18:
	.byte	'?'
	.ascii	"_temp_6\0"
	.align
_Label_19:
	.byte	'?'
	.ascii	"_temp_5\0"
	.align
