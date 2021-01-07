#!/bin/bash
URL_GHINI="http://www.cs.unibo.it/~ghini/didattica/sistemioperativi/ESERCIZI/ESERCIZI_CORREGGERE_ERRORI_1.tgz"
FILENAME=`echo ${URL_GHINI} | rev | cut -d '/' -f 1 | rev`

wget $URL_GHINI
tar xvf $FILENAME
rm $FILENAME
mv 1/* .
rm -rf 1
