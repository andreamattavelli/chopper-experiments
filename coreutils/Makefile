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

##########################################
#### Run KLEE experiments
##########################################
KSEARCH?=random-state
BC_DIR:=$(realpath ./coreutils-6.10/obj-llvm/src)

ptx: $(KLEE)
	@echo "Creating KLEE baseline with $(KSEARCH) on program ptx"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--exit-on-error-type=Ptr \
	--output-dir=klee-out-ptx \
	--search=random-state \
	$(BC_DIR)/ptx.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

seq: $(KLEE)
	@echo "Creating KLEE baseline with $(KSEARCH) on program seq"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--exit-on-error-type=Ptr \
	--output-dir=klee-out-seq \
	$(BC_DIR)/seq.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

seq-slice: $(KLEE)
	@echo "Creating KLEE baseline with $(KSEARCH) on program seq"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--exit-on-error-type=Ptr \
	--output-dir=klee-out-seq-slice \
	--search=dfs \
	-skip-functions=parse_options \
	$(BC_DIR)/seq.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout


paste: $(KLEE)
	@echo "Creating KLEE baseline with $(KSEARCH) on program paste"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--exit-on-error-type=Ptr \
	--output-dir=klee-out-paste \
	--search=random-state \
	$(BC_DIR)/paste.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

tac: $(KLEE)
	@echo "Creating KLEE baseline with $(KSEARCH) on program tac"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--exit-on-error-type=Ptr \
	--output-dir=klee-out-tac \
	$(BC_DIR)/tac.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

tac-slice: $(KLEE)
	@echo "Creating KLEE baseline with $(KSEARCH) on program tac"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--exit-on-error-type=Ptr \
	--search=random-state \
	--output-dir=klee-out-tac-slice \
	--inline=memcmp -skip-functions=parse_options \
	$(BC_DIR)/tac.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout
