#!/bin/bash
cd dirs
for DIR in *
do
	CURRENT_SUFFIX=${DIR##1.}
	((SUFFIX=9-$CURRENT_SUFFIX))
	echo "Sposto ${DIR} in 2.${SUFFIX}..."
	mv $DIR "2.${CURRENT_SUFFIX}"
done
cd ..
