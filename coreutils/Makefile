ROOT=$(realpath ..)
include $(ROOT)/common.mk

.SILENT:

.PHONY: all
all: coreutils-6.10.bc

.PHONY: clean
clean:
	rm -rf coreutils-6.10/obj-llvm *.log

##########################################
#### Case study
##########################################
coreutils-6.10.bc: coreutils-6.10 coreutils-6.10/obj-llvm/Makefile
	cd coreutils-6.10/obj-llvm/src; \
	find . -executable -type f | xargs -I '{}' $(EXTRACTBC) '{}'; \
	touch $@

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

##########################################################################################

run-klee-test: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ["
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-[ \
	$(BC_DIR)/[.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-base64: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program base64"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-base64 \
	$(BC_DIR)/base64.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-basename: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program basename"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-basename \
	$(BC_DIR)/basename.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-cat: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cat"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-cat \
	$(BC_DIR)/cat.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-chcon: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chcon"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-chcon \
	$(BC_DIR)/chcon.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-chgrp: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chgrp"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-chgrp \
	$(BC_DIR)/chgrp.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-chmod: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chmod"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-chmod \
	$(BC_DIR)/chmod.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-chown: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chown"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-chown \
	$(BC_DIR)/chown.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-chroot: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chroot"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-chroot \
	$(BC_DIR)/chroot.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-cksum: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cksum"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-cksum \
	$(BC_DIR)/cksum.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-comm: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program comm"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-comm \
	$(BC_DIR)/comm.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-cp: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cp"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-cp \
	$(BC_DIR)/cp.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-csplit: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program csplit"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-csplit \
	$(BC_DIR)/csplit.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-cut: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cut"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-cut \
	$(BC_DIR)/cut.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-dircolors: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program dircolors"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-dircolors \
	$(BC_DIR)/dircolors.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-dirname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program dirname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-dirname \
	$(BC_DIR)/dirname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-du: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program du"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-du \
	$(BC_DIR)/du.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-echo: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program echo"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-echo \
	$(BC_DIR)/echo.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-env: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program env"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-env \
	$(BC_DIR)/env.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-expand: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program expand"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-expand \
	$(BC_DIR)/expand.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-expr: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program expr"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-expr \
	$(BC_DIR)/expr.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-factor: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program factor"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-factor \
	$(BC_DIR)/factor.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-false: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program false"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-\
	$(BC_DIR)/false.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-fmt: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program fmt"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-fmt \
	$(BC_DIR)/fmt.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-fold: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program fold"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-fold \
	$(BC_DIR)/fold.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-ginstall: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ginstall"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-ginstall \
	$(BC_DIR)/ginstall.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-head: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program head"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-head \
	$(BC_DIR)/head.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-hostid: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program hostid"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-hostid \
	$(BC_DIR)/hostid.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-hostname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program hostname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-hostname \
	$(BC_DIR)/hostname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-id: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program id"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-id \
	$(BC_DIR)/id.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-join: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program join"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-join \
	$(BC_DIR)/join.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-kill: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program kill"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-kill \
	$(BC_DIR)/kill.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-link: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program link"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-link \
	$(BC_DIR)/link.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-ln: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ln"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-ln \
	$(BC_DIR)/ln.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-logname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program logname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-logname \
	$(BC_DIR)/logname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-ls: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ls"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-ls \
	$(BC_DIR)/ls.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-md5sum: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program md5sum"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-md5sum \
	$(BC_DIR)/md5sum.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-mkdir: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mkdir"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-mkdir \
	$(BC_DIR)/mkdir.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-mkfifo: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mkfifo"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-mkfifo \
	$(BC_DIR)/mkfifo.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-mknod: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mknod"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-mknod \
	$(BC_DIR)/mknod.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-mv: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mv"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-mv \
	$(BC_DIR)/mv.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-nice: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program nice"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-nice \
	$(BC_DIR)/nice.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-nl: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program nl"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-nl \
	$(BC_DIR)/nl.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-nohup: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program nohup"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-nohup \
	$(BC_DIR)/nohup.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-od: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program od"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-od \
	$(BC_DIR)/od.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-paste: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program paste"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-paste \
	$(BC_DIR)/paste.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-pathchk: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program pathchk"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-pathchk \
	$(BC_DIR)/pathchk.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-pinky: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program pinky"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-pinky \
	$(BC_DIR)/pinky.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-printenv: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program printenv"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-printenv \
	$(BC_DIR)/printenv.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-printf: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program printf"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-printf \
	$(BC_DIR)/printf.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-ptx: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ptx"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-ptx \
	$(BC_DIR)/ptx.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-pwd: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program pwd"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-pwd \
	$(BC_DIR)/pwd.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-readlink: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program readlink"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-readlink \
	$(BC_DIR)/readlink.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-rm: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program rm"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-rm \
	$(BC_DIR)/rm.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-rmdir: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program rmdir"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-rmdir \
	$(BC_DIR)/rmdir.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-runcon: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program runcon"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-runcon \
	$(BC_DIR)/runcon.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-seq: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program seq"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-seq \
	$(BC_DIR)/seq.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-setuidgid: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program setuidgid"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-setuidgid \
	$(BC_DIR)/setuidgid.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-sleep: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sleep"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-sleep \
	$(BC_DIR)/sleep.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-sort: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sort"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-sort \
	$(BC_DIR)/sort.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-stty: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program stty"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-stty \
	$(BC_DIR)/stty.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-sum: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sum"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-sum \
	$(BC_DIR)/sum.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-sync: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sync"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-sync \
	$(BC_DIR)/sync.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-tee: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tee"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-tee \
	$(BC_DIR)/tee.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-touch: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program touch"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-touch \
	$(BC_DIR)/touch.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-tr: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tr"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-tr \
	$(BC_DIR)/tr.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-tsort: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tsort"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-tsort \
	$(BC_DIR)/tsort.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-tty: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tty"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-tty \
	$(BC_DIR)/tty.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-uname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program uname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-uname \
	$(BC_DIR)/uname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-unexpand: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program unexpand"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-unexpand \
	$(BC_DIR)/unexpand.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-uniq: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program uniq"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-uniq \
	$(BC_DIR)/uniq.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-unlink: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program unlink"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-unlink \
	$(BC_DIR)/unlink.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-users: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program users"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-users \
	$(BC_DIR)/users.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-wc: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program wc"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-wc \
	$(BC_DIR)/wc.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-who: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program who"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-who \
	$(BC_DIR)/who.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-whoami: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program whoami"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-whoami \
	$(BC_DIR)/whoami.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-klee-yes: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program yes"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=klee-out-yes \
	$(BC_DIR)/yes.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

##########################################################################################

run-cse-test: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ["
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-test \
	$(BC_DIR)/[.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-base64: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program base64"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-base64 \
	$(BC_DIR)/base64.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-basename: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program basename"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-basename \
	$(BC_DIR)/basename.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-cat: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cat"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-cat \
	$(BC_DIR)/cat.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-chcon: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chcon"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-chcon \
	$(BC_DIR)/chcon.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-chgrp: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chgrp"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-chgrp \
	$(BC_DIR)/chgrp.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-chmod: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chmod"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-chmod \
	$(BC_DIR)/chmod.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-chown: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chown"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-chown \
	$(BC_DIR)/chown.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-chroot: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program chroot"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-chroot \
	$(BC_DIR)/chroot.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-cksum: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cksum"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-cksum \
	$(BC_DIR)/cksum.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-comm: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program comm"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-comm \
	$(BC_DIR)/comm.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-cp: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cp"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-cp \
	$(BC_DIR)/cp.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-csplit: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program csplit"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-csplit \
	$(BC_DIR)/csplit.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-cut: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program cut"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-cut \
	$(BC_DIR)/cut.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-dircolors: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program dircolors"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-dircolors \
	$(BC_DIR)/dircolors.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-dirname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program dirname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-dirname \
	$(BC_DIR)/dirname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-du: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program du"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-du \
	$(BC_DIR)/du.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-echo: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program echo"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-echo \
	$(BC_DIR)/echo.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-env: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program env"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-env \
	$(BC_DIR)/env.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-expand: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program expand"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-expand \
	$(BC_DIR)/expand.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-expr: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program expr"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-expr \
	$(BC_DIR)/expr.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-factor: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program factor"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-factor \
	$(BC_DIR)/factor.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-false: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program false"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-\
	$(BC_DIR)/false.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-fmt: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program fmt"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-fmt \
	$(BC_DIR)/fmt.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-fold: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program fold"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-fold \
	$(BC_DIR)/fold.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-ginstall: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ginstall"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-ginstall \
	$(BC_DIR)/ginstall.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-head: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program head"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-head \
	$(BC_DIR)/head.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-hostid: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program hostid"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-hostid \
	$(BC_DIR)/hostid.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-hostname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program hostname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-hostname \
	$(BC_DIR)/hostname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-id: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program id"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-id \
	$(BC_DIR)/id.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-join: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program join"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-join \
	$(BC_DIR)/join.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-kill: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program kill"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-kill \
	$(BC_DIR)/kill.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-link: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program link"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-link \
	$(BC_DIR)/link.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-ln: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ln"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-ln \
	$(BC_DIR)/ln.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-logname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program logname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-logname \
	$(BC_DIR)/logname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-ls: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ls"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-ls \
	$(BC_DIR)/ls.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-md5sum: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program md5sum"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-md5sum \
	$(BC_DIR)/md5sum.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-mkdir: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mkdir"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-mkdir \
	$(BC_DIR)/mkdir.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-mkfifo: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mkfifo"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-mkfifo \
	$(BC_DIR)/mkfifo.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-mknod: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mknod"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-mknod \
	$(BC_DIR)/mknod.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-mv: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program mv"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-mv \
	$(BC_DIR)/mv.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-nice: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program nice"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-nice \
	$(BC_DIR)/nice.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-nl: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program nl"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-nl \
	$(BC_DIR)/nl.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-nohup: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program nohup"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-nohup \
	$(BC_DIR)/nohup.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-od: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program od"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-od \
	$(BC_DIR)/od.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-paste: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program paste"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-paste \
	$(BC_DIR)/paste.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-pathchk: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program pathchk"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-pathchk \
	$(BC_DIR)/pathchk.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-pinky: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program pinky"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-pinky \
	$(BC_DIR)/pinky.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-printenv: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program printenv"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-printenv \
	$(BC_DIR)/printenv.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-printf: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program printf"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-printf \
	$(BC_DIR)/printf.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-ptx: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program ptx"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-ptx \
	$(BC_DIR)/ptx.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-pwd: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program pwd"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-pwd \
	$(BC_DIR)/pwd.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-readlink: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program readlink"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-readlink \
	$(BC_DIR)/readlink.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-rm: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program rm"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-rm \
	$(BC_DIR)/rm.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-rmdir: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program rmdir"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-rmdir \
	$(BC_DIR)/rmdir.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-runcon: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program runcon"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-runcon \
	$(BC_DIR)/runcon.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-seq: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program seq"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-seq \
	$(BC_DIR)/seq.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-setuidgid: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program setuidgid"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-setuidgid \
	$(BC_DIR)/setuidgid.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-sleep: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sleep"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-sleep \
	$(BC_DIR)/sleep.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-sort: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sort"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-sort \
	$(BC_DIR)/sort.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-stty: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program stty"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-stty \
	$(BC_DIR)/stty.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-sum: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sum"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-sum \
	$(BC_DIR)/sum.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-sync: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program sync"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-sync \
	$(BC_DIR)/sync.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-tee: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tee"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-tee \
	$(BC_DIR)/tee.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-touch: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program touch"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-touch \
	$(BC_DIR)/touch.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-tr: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tr"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-tr \
	$(BC_DIR)/tr.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-tsort: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tsort"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-tsort \
	$(BC_DIR)/tsort.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-tty: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program tty"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-tty \
	$(BC_DIR)/tty.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-uname: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program uname"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-uname \
	$(BC_DIR)/uname.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-unexpand: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program unexpand"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-unexpand \
	$(BC_DIR)/unexpand.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-uniq: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program uniq"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-uniq \
	$(BC_DIR)/uniq.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-unlink: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program unlink"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-unlink \
	$(BC_DIR)/unlink.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-users: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program users"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-users \
	$(BC_DIR)/users.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-wc: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program wc"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-wc \
	$(BC_DIR)/wc.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-who: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program who"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-who \
	$(BC_DIR)/who.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-whoami: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program whoami"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-whoami \
	$(BC_DIR)/whoami.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

run-cse-yes: $(KLEE) prepare
	@echo "Running KLEE with $(KSEARCH) on program yes"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--search=random-state --search=nurs:covnew \
	--output-dir=cse-out-yes \
	$(BC_DIR)/yes.bc \
	--sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout

#########################################################################################

ptx-bug1: $(KLEE) prepare
	@echo "Running KLEE on program ptx"
	-$(KLEE) \
	$(KFLAGS) \
	--output-dir=klee-out-ptx-bug1 \
	$(BC_DIR)/ptx.bc -F\\ abcdefghijklmnopqrstuvwxyz

ptx-bug2: $(KLEE) prepare
	@echo "Running KLEE on program ptx"
	-$(KLEE) \
	$(KFLAGS) \
	--output-dir=klee-out-ptx-bug2 \
	$(BC_DIR)/ptx.bc x t4.txt

seq-bug: $(KLEE) prepare
	@echo "Running KLEE on program seq"
	-$(KLEE) --stats-write-interval=1500 --istats-write-interval=1500 \
	$(KFLAGS) \
	--exit-on-error-type=Ptr \
	--output-dir=klee-out-seq-bug \
	$(BC_DIR)/seq.bc -f %0 1

paste-bug: $(KLEE) prepare
	@echo "Running KLEE on program paste"
	-$(KLEE) \
	$(KFLAGS) \
	--output-dir=klee-out-paste-bug \
	$(BC_DIR)/paste.bc -d\\ abcdefghijklmnopqrstuvwxyz

pr-bug: $(KLEE) prepare
	@echo "Running KLEE on program pr"
	-$(KLEE) \
	$(KFLAGS) \
	--output-dir=klee-out-pr-bug \
	$(BC_DIR)/pr.bc -e t2.txt

tac-bug: $(KLEE) prepare
	@echo "Running KLEE on program tac"
	-$(KLEE) \
	$(KFLAGS) \
	--output-dir=klee-out-tac-bug \
	$(BC_DIR)/tac.bc -r t3.txt t3.txt
