KLEE_PATH=/home/david/tau/klee/klee/
SRC_PATH=./libosip2-4.0.0/

INCLUDES=-I $(KLEE_PATH)/include -I $(SRC_PATH)/include
DEFINES=

COVERAGE_CFLAGS=-fprofile-arcs -ftest-coverage
COVERAGE_LDFLAGS=-lgcov --coverage

CFLAGS=$(INCLUDES) $(DEFINES) 
LDFLAGS=
CC=gcc
OPT=opt
LLVM_DIS=llvm-dis
WLLVM=wllvm
EXTRACT_BC=extract-bc

TARGET=main
TARGET_GCOV=main_gcov
BC_TARGET=main.bc

%.o: %.c
	$(WLLVM) -c $(CFLAGS) -DTEST_SYMBOLIC $< -o $@

%.gcov.o: %.c
	$(CC) -c $(CFLAGS) $(COVERAGE_CFLAGS) $< -o $@

.PHONY: osip_archive osip_archive_gcov

osip_archive_gcov:
	rm -rf build && mkdir build
	cd build; ../libosip2-4.0.0/configure CFLAGS="$(COVERAGE_CFLAGS)" LDFLAGS="$(COVERAGE_LDFLAGS)"; cd -
	make -C build -j4

osip_archive:
	rm -rf build && mkdir build
	cd build; ../libosip2-4.0.0/configure CC=$(WLLVM)
	make -C build -j4

$(TARGET_GCOV): main.gcov.o osip_archive_gcov
	$(CC) $(CFLAGS) $(LDFLAGS) $(COVERAGE_CFLAGS) $(COVERAGE_LDFLAGS) $< ./build/src/osipparser2/.libs/libosipparser2.a -o $@

$(TARGET): main.o osip_archive
	$(WLLVM) $(CFLAGS) $(LDFLAGS) $< ./build/src/osipparser2/.libs/libosipparser2.a -o $@

$(BC_TARGET): $(TARGET) osip_archive
	$(EXTRACT_BC) $< -o $@
	$(OPT) -mem2reg $@ -o $@
	$(LLVM_DIS) $@

clean:
	rm -rf $(TARGET) $(TARGET_GCOV) $(BC_TARGET) *.o *.bc *.ll ./build
