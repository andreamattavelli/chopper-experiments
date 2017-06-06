ROOT=$(realpath ../..)
include $(ROOT)/case_studies/common.mk

.SILENT:

.PHONY: all
all: coreutils-6.11.bc

.PHONY: clean
clean:
	rm -rf coreutils-6.11* *.log

##########################################
#### Case study
##########################################
coreutils-6.11.bc: coreutils-6.11 coreutils-6.11/obj-llvm/Makefile $(WLLVM)
	cd coreutils-6.11/obj-llvm/src; \
	find . -executable -type f | xargs -I '{}' $(EXTRACTBC) '{}'; \
	touch $@

coreutils-6.11.tar.gz:
	@echo "Downloading $@"
	wget -q http://ftp.gnu.org/gnu/coreutils/coreutils-6.11.tar.gz

coreutils-6.11: coreutils-6.11.tar.gz
	@echo "Decompressing $<"
	tar xfz $<

coreutils-6.11/obj-llvm/Makefile: coreutils-6.11 $(WLLVM)
	@echo "Compiling $@"
	-test -d coreutils-6.11/obj-llvm || mkdir -p coreutils-6.11/obj-llvm; \
	cd coreutils-6.11/obj-llvm; \
	LLVM_COMPILER=$(LLVM_COMPILER) CC=$(WLLVM) ../configure --disable-nls CFLAGS="-g" > /dev/null; \
	LLVM_COMPILER=$(LLVM_COMPILER) CC=$(WLLVM) $(MAKE) > compilation.log 2>&1; \
	LLVM_COMPILER=$(LLVM_COMPILER) CC=$(WLLVM) $(MAKE) -C src arch hostname >> compilation.log 2>> compilation.log
