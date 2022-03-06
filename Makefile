.PHONY: default compile build run
default: build run
compile:
	fasm clib/fmt.asm && fasm clib/asmlib/fmt.asm
	fasm clib/mth.asm && fasm clib/asmlib/mth.asm
	fasm clib/str.asm && fasm clib/asmlib/str.asm
	fasm clib/sys.asm && fasm clib/asmlib/sys.asm
build: 
	gcc -no-pie main.c clib/fmt.o clib/asmlib/fmt.o  clib/mth.o clib/asmlib/mth.o clib/str.o clib/asmlib/str.o clib/sys.o clib/asmlib/sys.o -o main
run:
	./main

