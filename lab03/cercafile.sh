#!/bin/bash

for CH in {c..g}
do
	for FILE in /usr/include/?${CH}*
	do
		if [[ -f $FILE && (${#FILE} -lt 18 || ${#FILE} -gt 23) ]]
		then
			echo $FILE
		fi
	done
done
