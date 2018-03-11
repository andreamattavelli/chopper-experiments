include ../common.mk

bc.bc:
	-test -d bc-1.06/build || mkdir -p bc-1.06/build
	cd bc-1.06/build; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) ../configure > /dev/null; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=gcc $(MAKE) > compilation.log 2>&1; \
	$(EXTRACTBC) bc/bc; \
	$(OPT) -mem2reg bc/bc.bc -o bc/bc.bc

bc:
	-test -d bc-1.06/build || mkdir -p bc-1.06/build
	cd bc-1.06/build; \
	CC=gcc CFLAGS="-fprofile-arcs -ftest-coverage" LDFLAGS="-lgcov --coverage" ../configure > /dev/null; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=gcc $(MAKE) > compilation.log 2>&1

.PHONY: clean
clean:
	rm -rf bc-1.06/build
