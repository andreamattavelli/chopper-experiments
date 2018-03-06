#!/bin/bash

ulimit -s unlimited

time klee \
    -max-time=3600 \
    -max-memory=4096 \
    -libc=uclibc \
    -simplify-sym-indices \
    -search=nurs:covnew \
    -split-search \
    -skip-functions=yaml_parser_update_buffer:864,yaml_parser_fetch_stream_start:870 \
    final.bc 64

time klee \
    -max-time=3600 \
    -max-memory=4096 \
    -libc=uclibc \
    -simplify-sym-indices \
    -search=nurs:covnew \
    final.bc 64
