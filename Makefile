all:
	v -o tmp.main.c .
	v -o main .
	./main

a:
	v -o main.c .
c:
	gcc main.c  -fwrapv -o a.out -D GC_BUILTIN_ATOMIC=1 -D MPROTECT_VDB=1 -D GC_THREADS=1 -I "/Users/pancake/prg/v/thirdparty/libgc/include" -I "/Users/pancake/.local/share/radare2/prefix/include" -L "/Users/pancake/.local/share/radare2/prefix/lib" -x objective-c  -x none -std=c99 -D_DEFAULT_SOURCE "/Users/pancake/prg/v/thirdparty/tcc/lib/libgc.a" -ldl -lpthread -lui

.PHONY: a c all
