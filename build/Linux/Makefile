CC=gcc
LDFLAGS=-Wl,--rpath=\$$ORIGIN/../lib
CFLAGS=-std=gnu89 -pedantic -O3 -ggdb3 -DJSONSL_STATE_GENERIC

all: bin/json_test lib/libjsonsl.so
bin lib obj:; -@mkdir -p $@

bin/json_test: bin obj obj/json_test.o lib/libjsonsl.so
	$(LINK.c) -g -ggdb3 -o $@ obj/json_test.o -Llib -ljsonsl

share: json_samples.tgz
	tar xfz $^

check: bin/json_test share
	JSONSL_QUIET_TESTS=1 ./bin/json_test share/*

lib/libjsonsl.so: lib obj/jsonsl.o
	$(LINK.c) -g -ggdb3 -shared -fPIC -o $@ obj/jsonsl.o

obj/json_test.o: obj json_test.c
	$(COMPILE.c) -o $@ json_test.c

obj/jsonsl.o: obj jsonsl.c jsonsl.h
	$(COMPILE.c) -g -ggdb3 -shared -fPIC -o $@ jsonsl.c

clean:
	$(RM) -r obj lib bin share
