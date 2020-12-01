#!/bin/bash

for F1 in *
do
	for F2 in *
	do
		for F3 in *
		do
			echo "(${F1};${F2};${F3})"
		done
	done
done
