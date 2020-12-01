#!/bin/bash

for FILE in `ls`
do
	echo "file is ${FILE}"
	ls -ld ${FILE}
done
