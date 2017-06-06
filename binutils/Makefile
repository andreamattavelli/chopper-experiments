ROOT=$(realpath ../..)
include $(ROOT)/case_studies/common.mk

.SILENT:

.PHONY: all
all: binutils-2.27.bc

.PHONY: clean
clean:
	rm -rf binutils-2.27* *.log

##########################################
#### Case study
##########################################
binutils-2.27.bc: binutils-2.27 binutils-2.27/obj-llvm/Makefile $(WLLVM)
	cd binutils-2.27/obj-llvm; \
	find . -executable -type f | xargs -I '{}' $(EXTRACTBC) '{}'; \
	touch $@

binutils-2.27.tar.gz:
	@echo "Downloading $@"
	wget -q http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz

binutils-2.27: binutils-2.27.tar.gz
	@echo "Decompressing $<"
	tar xfz $<

binutils-2.27/obj-llvm/Makefile: binutils-2.27 $(WLLVM)
	@echo "Compiling $@"
	-test -d binutils-2.27/obj-llvm || mkdir -p binutils-2.27/obj-llvm; \
	cd binutils-2.27/obj-llvm; \
	LLVM_COMPILER=$(LLVM_COMPILER) CC=$(WLLVM) ../configure --target=mips --disable-nls CFLAGS="-g" > /dev/null; \
	LLVM_COMPILER=$(LLVM_COMPILER) CC=$(WLLVM) $(MAKE) > compilation.log 2>&1
