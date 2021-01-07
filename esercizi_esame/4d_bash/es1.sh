#!/bin/bash
cd dirs
for DIR in *
do
	mv $DIR "2.${DIR##1.}"
done
cd ..
