#
# Type 'make' with this 'makefile' file to build the BLITZ OS kernel
# It will execute the following commands as needed, based on files'
# most-recent-update times.
# 

all: os

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

clean:
	rm -f Runtime.o Switch.o System.o Syscall.o List.o BitMap.o Kernel.o Main.o os
	rm -f System.s Syscall.s List.s BitMap.s Kernel.s Main.s
