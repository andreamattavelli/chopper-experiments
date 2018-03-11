#!/bin/bash

ulimit -s unlimited

klee \
    -max-time=3600 \
    -max-memory=4096 \
    -simplify-sym-indices \
    -libc=uclibc \
    -search=nurs:covnew \
    ./test-driver.bc 10
