### Configure
Edit `case_studies/common.mk` with your environment
```makefile
##
## OTHER COMMANDS
##
UNAME:=$(shell uname)
SHELL:=/bin/bash
GIT:=git

##
## LLVM
##
LLVM_CONFIG:=llvm-config
CLANG:=clang
CLANGXX:=clang++
LLVM_COMPILER:=$(CLANG)
OPT:=opt

##
## WLLVM
##
WLLVMROOT=$(TOOLS)/whole-program-llvm
WLLVM=$(WLLVMROOT)/wllvm
EXTRACTBC=$(WLLVMROOT)/extract-bc
```
Edit `case_studies/common.mk` with your KLEE installation
```makefile
##
## KLEE
##
[...]
KLEE_DIR=$(ROOT)/case_studies/tools/klee
KLEE_BIN=$(KLEE_DIR)/Release+Asserts/bin
KLEE=$(KLEE_BIN)/klee
```

### Compile the case study
Enter in the experiment directory (e.g. `coreutils`) and invoke `make`
```shell
cd coreutils
make
```
The source code of the case study should be downloaded, patched, configured, and compiled with WLLVM automatically.
