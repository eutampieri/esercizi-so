#!/bin/bash

for FILE in /usr/include/*
do
	if [[ -d $FILE && -r $FILE && $FILE -nt /usr/include/stdio.h ]]
	then
		echo $FILE
	fi
done
