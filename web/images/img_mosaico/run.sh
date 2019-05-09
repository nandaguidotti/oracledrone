#!/bin/bash
max=1000
for i in `eval "echo {1..$max}"`
do
#    echo "$i"
    mkdir $i
done
