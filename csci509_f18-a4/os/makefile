#
# Type 'make' with this 'makefile' file to build the BLITZ OS kernel
# It will execute the following commands as needed, based on files'
# most-recent-update times.
# 

all: os DISK

#
# Stuff related to user-level programs in general...
#

UserRuntime.o: UserRuntime.s
	asm UserRuntime.s

UserSystem.s: UserSystem.h UserSystem.k
	kpl UserSystem -unsafe

UserSystem.o: UserSystem.s
	asm UserSystem.s

#
# Stuff related to user-level program 'MyProgram'...
#

MyProgram.s: UserSystem.h MyProgram.h MyProgram.k
	kpl MyProgram -unsafe

MyProgram.o: MyProgram.s
	asm MyProgram.s

MyProgram: UserRuntime.o UserSystem.o MyProgram.o Syscall.o
	lddd UserRuntime.o UserSystem.o MyProgram.o Syscall.o -o MyProgram

#
# Stuff related to user-level program 'TestProgram1'...
#

TestProgram1.s: UserSystem.h TestProgram1.h TestProgram1.k
	kpl TestProgram1 -unsafe

TestProgram1.o: TestProgram1.s
	asm TestProgram1.s

TestProgram1: UserRuntime.o UserSystem.o TestProgram1.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram1.o Syscall.o -o TestProgram1

#
# Stuff related to user-level program 'TestProgram2'...
#

TestProgram2.s: UserSystem.h TestProgram2.h TestProgram2.k
	kpl TestProgram2 -unsafe

TestProgram2.o: TestProgram2.s
	asm TestProgram2.s

TestProgram2: UserRuntime.o UserSystem.o TestProgram2.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram2.o Syscall.o -o TestProgram2

#
# Stuff related to the os kernel...
#

Runtime.o: Runtime.s
	asm Runtime.s

Switch.o: Switch.s
	asm Switch.s

System.s: System.h System.k
	kpl System -unsafe

System.o: System.s
	asm System.s

Syscall.s: Syscall.k Syscall.h
	kpl Syscall

Syscall.o: Syscall.s
	asm Syscall.s

List.s: System.h List.h List.k
	kpl List -unsafe

List.o: List.s
	asm List.s

BitMap.s: System.h BitMap.h BitMap.k
	kpl BitMap -unsafe

BitMap.o: BitMap.s
	asm BitMap.s

Kernel.s: System.h List.h BitMap.h Kernel.h Kernel.k
	kpl Kernel -unsafe

Kernel.o: Kernel.s
	asm Kernel.s

Main.s: System.h List.h BitMap.h Kernel.h Main.h Main.k
	kpl Main -unsafe

Main.o: Main.s
	asm Main.s

os: Runtime.o Switch.o System.o Syscall.o List.o BitMap.o Kernel.o Main.o
	lddd Runtime.o Switch.o System.o Syscall.o List.o BitMap.o Kernel.o Main.o -o os

#
# Stuff related to the DISK...
#

DISK: MyProgram TestProgram1 TestProgram2
	rm -f DISK
	toyfs -i -n10 -s250
	toyfs -a -x MyProgram TestProgram1 TestProgram2 /

clean:
	rm -f *.o Main.s Kernel.s BitMap.s List.s System.s Syscall.s
	rm -f MyProgram.s TestProgram1.s TestProgram2.s UserSystem.s
	rm -f os MyProgram TestProgram1 TestProgram2 DISK

