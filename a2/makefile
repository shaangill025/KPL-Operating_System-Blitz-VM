#
# Type 'make' with this 'makefile' file to build the Project 2 code.
# It will execute the following commands as needed, based on files'
# most-recent-update times.
# 
BINDIR = /Users/shaanjotgill/Documents/csci509_f18/a1/BlitzSrc.wwu

all: os game barber

Runtime.o: Runtime.s
	asm Runtime.s

Switch.o: Switch.s
	asm Switch.s

System.s: System.h System.k
	kpl System -unsafe

System.o: System.s
	asm System.s

List.s: List.h List.k System.h
	kpl List -unsafe

List.o: List.s
	asm List.s

Thread.s: Thread.h Thread.k System.h List.h
	kpl Thread -unsafe

Thread.o: Thread.s
	asm Thread.s

Synch.s: Synch.h Synch.k Thread.h List.h System.h
	kpl Synch

Synch.o: Synch.s
	asm Synch.s

Main.s: Main.h Main.k Thread.h List.h System.h Synch.h
	kpl Main -unsafe

Main.o: Main.s
	asm Main.s

Game.s: Game.h Main.k Thread.h List.h System.h Synch.h
	kpl Game -unsafe

Game.o: Game.s
	asm Game.s

Barber.s: Barber.h Main.k Thread.h List.h System.h Synch.h
	kpl Barber -unsafe

Barber.o: Barber.s
	asm Barber.s

os: System.o List.o Thread.o Switch.o Synch.o Main.o Runtime.o
	lddd System.o List.o Thread.o Switch.o Synch.o Main.o Runtime.o -o os

game: System.o List.o Thread.o Switch.o Synch.o Runtime.o Game.o
	lddd System.o List.o Thread.o Switch.o Synch.o Runtime.o Game.o -o game

barber: System.o List.o Thread.o Switch.o Synch.o Runtime.o Barber.o
	lddd System.o List.o Thread.o Switch.o Synch.o Runtime.o Barber.o -o barber

clean:
	rm -f *.o *~ List.s Main.s Synch.s System.s Thread.s Barber.s Game.s os game barber
