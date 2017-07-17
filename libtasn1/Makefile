include ../common.mk

# Setup
KLEE_DIR=~/tau/slicing/klee/
SRC_PATH=./libtasn1-4.4/

INCLUDES=-I $(KLEE_DIR)/include -I $(SRC_PATH) -I $(SRC_PATH)/lib -I $(SRC_PATH)/lib/gllib
DEFINES=-D_GNU_SOURCE -DSIZEOF_UNSIGNED_INT=4 -DSIZEOF_UNSIGNED_LONG_INT=8

CFLAGS=-emit-llvm -c -g $(DEFINES) $(INCLUDES)
LDFLAGS=
CC=gcc
# TODO: move to config.mk
LINK=llvm-link
LLVM_DIS=llvm-dis

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

%.bc: %.c
	$(CLANG) $(CFLAGS) $< -o $@

SOURCES=$(shell ls $(SRC_PATH)/lib/*.c) $(shell ls $(SRC_PATH)/lib/gllib/hash-pjw-bare.c) main.c
DEPS=$(patsubst %.c,%.o,$(SOURCES))
BC_DEPS=$(patsubst %.c,%.bc,$(SOURCES))

test.bc: $(BC_DEPS)
	$(LINK) $^ -o $@
	$(OPT) -mem2reg $@ -o $@
	$(LLVM_DIS) $@

#test: $(DEPS)
#	$(CC) $^ -o $@ $(LDFLAGS) 

clean:
	rm -rf $(DEPS) $(BC_DEPS)
