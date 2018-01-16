#!/bin/bash

klee \
    -max-time=3600 \
    -max-memory=4096 \
    -simplify-sym-indices \
    -libc=uclibc \
    -search=nurs:covnew \
    -skip-functions=osip_util_replace_all_lws \
    -split-search \
    ./main.bc 10

klee \
    -max-time=3600 \
    -max-memory=4096 \
    -simplify-sym-indices \
    -libc=uclibc \
    -search=nurs:covnew \
    ./main.bc 10
