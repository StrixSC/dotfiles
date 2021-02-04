#!/bin/bash

COWS=(/usr/local/share/cowsay-files/cows/*)
RAND_COW=$(($RANDOM % $( ls /usr/local/cowsay-files/cows/*.cow | wc -l )))
cowsay -f ${COWS[$RAND_COW]} "ALL YOUR BASE ARE BELONG TO US"

