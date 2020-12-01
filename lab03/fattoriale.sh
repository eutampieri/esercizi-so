#!/bin/bash

NUM=$1
if [[ $NUM == 1 ]]
then
	echo $NUM
else
	((NUM_MENO_UNO=$NUM - 1))
	((RIS=$NUM * `./fattoriale.sh ${NUM_MENO_UNO}`))
	echo $RIS
fi
