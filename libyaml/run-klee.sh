#!/bin/bash

ulimit -s unlimited

time klee \
    -max-time=3600 \
    -max-memory=4096 \
    -libc=uclibc \
    -simplify-sym-indices \
    -search=nurs:covnew \
    test-driver.bc 64
