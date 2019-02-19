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

UserSystem.s: UserSystem.h UserSystem.k Syscall.h
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
# Stuff related to user-level program 'TestProgram3a'...
#

TestProgram3a.s: UserSystem.h TestProgram3a.h TestProgram3a.k
	kpl TestProgram3a -unsafe

TestProgram3a.o: TestProgram3a.s
	asm TestProgram3a.s

TestProgram3a: UserRuntime.o UserSystem.o TestProgram3a.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram3a.o Syscall.o -o TestProgram3a

#
# Stuff related to user-level program 'TestProgram3'...
#

TestProgram3.s: UserSystem.h TestProgram3.h TestProgram3.k
	kpl TestProgram3 -unsafe

TestProgram3.o: TestProgram3.s
	asm TestProgram3.s

TestProgram3: UserRuntime.o UserSystem.o TestProgram3.o Syscall.o
	lddd UserRuntime.o UserSystem.o TestProgram3.o Syscall.o -o TestProgram3


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

List.s: System.h List.h List.k
	kpl List -unsafe

List.o: List.s
	asm List.s

BitMap.s: System.h BitMap.h BitMap.k
	kpl BitMap -unsafe

BitMap.o: BitMap.s
	asm BitMap.s

Kernel.s: System.h List.h BitMap.h Kernel.h Kernel.k Syscall.h
	kpl Kernel -unsafe

Kernel.o: Kernel.s
	asm Kernel.s

Main.s: System.h List.h BitMap.h Kernel.h Main.h Main.k Syscall.h
	kpl Main -unsafe

Main.o: Main.s
	asm Main.s

Syscall.s: Syscall.k Syscall.h
	kpl Syscall

Syscall.o: Syscall.s
	asm Syscall.s

os: Runtime.o Switch.o System.o List.o BitMap.o Kernel.o Main.o Syscall.o
	lddd Runtime.o Switch.o System.o List.o BitMap.o Kernel.o Main.o Syscall.o -o os

#
# Stuff related to the DISK...
#

#DISK: MyProgram TestProgram1 TestProgram2
#	diskUtil -i
#	diskUtil -a MyProgram MyProgram
#	diskUtil -a TestProgram1 TestProgram1
#	diskUtil -a TestProgram2 TestProgram2

DISK: MyProgram TestProgram1 TestProgram2 TestProgram3 TestProgram3a
	rm -f DISK
	toyfs -i -n10 -s250
	toyfs -a -x MyProgram TestProgram1 TestProgram2 /
	toyfs -a -x TestProgram3 TestProgram3a /

clean:
	rm -f *.o Main.s Kernel.s BitMap.s List.s System.s Syscall.s
	rm -f MyProgram.s TestProgram1.s TestProgram2.s UserSystem.s
	rm -f os MyProgram TestProgram1 TestProgram2 DISK
	rm -f TestProgram3 TestProgram3a TestProgram3.s TestProgram3a.s
	rm -f *~


