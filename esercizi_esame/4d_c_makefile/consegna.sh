#!/bin/bash
URL_GHINI="http://www.cs.unibo.it/~ghini/didattica/sistemioperativi/ESERCIZI/ESERCIZI_CORREGGERE_ERRORI_1.tgz"
FILENAME=`echo ${URL_GHINI} | rev | cut -d '/' -f 1 | rev`

wget $URL_GHINI
tar xvf $FILENAME
rm $FILENAME
mv 1 orig
cd orig
for FILE in */*
do
	diff $FILE ../${FILE} > ../`echo $FILE | tr / _`.diff
done
cd ..
rm -rf orig
