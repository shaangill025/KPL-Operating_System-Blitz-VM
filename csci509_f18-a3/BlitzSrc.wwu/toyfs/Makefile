# Quick makefile for toyfs --
#

CC= gcc
CFLAGS= -g -Wall -m32

toyfs:	toyfs.o
	$(CC) $(CFLAGS) -o toyfs toyfs.o

clean:
	rm -f *.o toyfs *~
