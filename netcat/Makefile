ROOT=$(realpath ..)
include $(ROOT)/common.mk

SRC_PATH= ./nc110/

INCLUDES=-I $(KLEE_DIR)/include -I $(SRC_PATH)
DEFINES=

CFLAGS=-emit-llvm -c -g $(DEFINES) $(INCLUDES)
LDFLAGS=

%.bc: %.c
	$(CLANG) $(CFLAGS) $< -o $@

SOURCES=$(SRC_PATH)/netcat.c
BC_DEPS=$(patsubst %.c,%.bc,$(SOURCES))

TARGET=test.bc

all: $(TARGET)

$(TARGET): $(BC_DEPS)
	$(LINK) $^ -o $@
	$(OPT) -mem2reg $@ -o $@
	$(DIS) $@

clean:
	rm -rf $(BC_DEPS)
	rm -f test.*
	rm -rf klee-*
