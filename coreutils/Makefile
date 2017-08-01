ROOT=$(realpath ..)
include $(ROOT)/common.mk

.SILENT:

.PHONY: all
all: coreutils-6.10.bc

.PHONY: clean
clean:
	rm -rf coreutils-6.10* *.log

##########################################
#### Case study
##########################################
coreutils-6.10.bc: coreutils-6.10 coreutils-6.10/obj-llvm/Makefile
	cd coreutils-6.10/obj-llvm/src; \
	find . -executable -type f | xargs -I '{}' $(EXTRACTBC) '{}'; \
	touch $@

coreutils-6.10.tar.gz:
	@echo "Downloading $@"
	wget -q http://ftp.gnu.org/gnu/coreutils/coreutils-6.10.tar.gz

coreutils-6.10: coreutils-6.10.tar.gz
	@echo "Decompressing $<"
	tar xfz $<

coreutils-6.10/obj-llvm/Makefile: coreutils-6.10
	@echo "Compiling $@"
	-test -d coreutils-6.10/obj-llvm || mkdir -p coreutils-6.10/obj-llvm; \
	cd coreutils-6.10/obj-llvm; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) ../configure --disable-nls CFLAGS="-g" > /dev/null; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) $(MAKE) > compilation.log 2>&1; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) $(MAKE) -C src arch hostname >> compilation.log 2>> compilation.log
