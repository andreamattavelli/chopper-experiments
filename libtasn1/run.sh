#!/bin/sh

run_experiment()
{
echo "* Running experiment $1"
cd $1
make
make all-klee

make all-cse
terminate_cse cse-no-searcher

make KSLICE="-split-search -split-ratio=10" all-cse
terminate_cse cse-split-searcher-10

make KSLICE="-split-search -split-ratio=20" all-cse
terminate_cse cse-split-searcher-20

make KSLICE="-split-search -split-ratio=30" all-cse
terminate_cse cse-split-searcher-30

make KSLICE="-split-search -split-ratio=40" all-cse
terminate_cse cse-split-searcher-40

make KSLICE="-split-search -split-ratio=50" all-cse
terminate_cse cse-split-searcher-50

cd ..
}

terminate_cse()
{
mkdir $1
mv cse-run-* $1
mv run-cse-* $1
}


## MAIN
run_experiment CVE-2012-1569
run_experiment CVE-2014-3467
run_experiment CVE-2015-2806
run_experiment CVE-2015-3622
