ROOT=$(realpath ..)
include $(ROOT)/common.mk

.SILENT:

.PHONY: all
all: bc.bc

.PHONY: clean
clean:
	rm -rf bc-1.06.tar.gz bc-1.06 bc.bc bc_opt.bc

##########################################
#### Case study
##########################################
bc.bc: bc-1.06 bc-1.06/build/Makefile
	@echo "Compiling $@"
	cd bc-1.06/build; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) $(MAKE) > compilation.log 2>&1; \
	$(EXTRACTBC) bc/bc

bc-1.06.tar.gz:
	@echo "Downloading $@"
	wget -q http://ftp.gnu.org/gnu/bc/bc-1.06.tar.gz

bc-1.06: bc-1.06.tar.gz
	@echo "Decompressing $<"
	tar xfz $<

bc-1.06/build/Makefile: bc-1.06
	@echo "Configuring $@"
	-test -d bc-1.06/build || mkdir -p bc-1.06/build; \
	cd bc-1.06/build; \
	LLVM_COMPILER_PATH=$(LLVM_BUILD_DIR) LLVM_COMPILER=clang CC=$(WLLVM) ../configure > /dev/null

##########################################
#### Run KLEE experiments
##########################################
BC_DIR:=$(realpath ./bc-1.06/build)

# Run KLEE on BC given a instruction limit
run-klee: $(KLEE) bc.bc prepare
	@echo "Running KLEE on program BC"
	-taskset -c 2,3 $(KLEE) --stats-write-interval=1000 --istats-write-interval=1000 \
	$(KFLAGS) \
	--posix-runtime \
	--search=random-path --search=nurs:covnew \
	--output-dir=klee-out-bc \
	$(BC_DIR)/bc/bc.bc \
	A --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse: $(KLEE) bc.bc prepare
	@echo "Running KLEE on program BC"
	-taskset -c 2,3 $(KLEE) --stats-write-interval=1000 --istats-write-interval=1000 \
	$(KFLAGS) \
	--posix-runtime \
	-split-search --search=random-state --search=nurs:covnew \
	--output-dir=cse-out-bc \
	-skip-functions=parse_args \
	$(BC_DIR)/bc/bc.bc \
	A --sym-files 1 8 --sym-stdin 8 --sym-stdout
