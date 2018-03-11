include ../common.mk

all: bc.bc

.PHONY: clean
clean:
	rm -rf bc-1.06/build

bc.bc: bc-1.06/build/Makefile
	@echo "Compiling $@"
	cd bc-1.06/build; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) $(MAKE) > compilation.log 2>&1; \
	$(EXTRACTBC) bc/bc; \
	$(OPT) -mem2reg bc/bc.bc -o bc/bc.bc

bc-1.06/build/Makefile: bc-1.06
	@echo "Configuring $@"
	-test -d bc-1.06/build || mkdir -p bc-1.06/build; \
	cd bc-1.06/build; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) ../configure > /dev/null
