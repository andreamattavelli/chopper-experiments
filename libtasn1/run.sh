#!/bin/sh

##########################################
cd CVE-2012-1569
make
make all-klee

make all-cse
mkdir cse-no-searcher
mv cse-run-* cse-no-searcher
mv run-cse-* cse-no-searcher

make KSLICE="-split-search" all-cse
mkdir cse-split-searcher
mv cse-run-* cse-split-searcher
mv run-cse-* cse-split-searcher

cd ..

##########################################
cd CVE-2014-3467
make
make all-klee

make all-cse
mkdir cse-no-searcher
mv cse-run-* cse-no-searcher
mv run-cse-* cse-no-searcher

make KSLICE="-split-search" all-cse
mkdir cse-split-searcher
mv cse-run-* cse-split-searcher
mv run-cse-* cse-split-searcher

cd ..

##########################################
cd CVE-2015-2806
make
make all-klee

make all-cse
mkdir cse-no-searcher
mv cse-run-* cse-no-searcher
mv run-cse-* cse-no-searcher

make KSLICE="-split-search" all-cse
mkdir cse-split-searcher
mv cse-run-* cse-split-searcher
mv run-cse-* cse-split-searcher

cd ..

##########################################
cd CVE-2015-3622
make
make all-klee

make all-cse
mkdir cse-no-searcher
mv cse-run-* cse-no-searcher
mv run-cse-* cse-no-searcher

make KSLICE="-split-search" all-cse
mkdir cse-split-searcher
mv cse-run-* cse-split-searcher
mv run-cse-* cse-split-searcher

cd ..
