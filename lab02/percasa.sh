#!/bin/bash

#26) Scrivere uno script che esegue i seguenti compiti:
#Creare una directory BUTTAMI, dentro questa creare dei file che si chiamano
#* **
#***
#;;
#Fare un listing di questi file e, per ciascun o dei file nella directory aggiungere un
#nuovo file con stesso nome con in più l'estensione .txt.
#Copiare in questa directory tutta la directory /usr/include/ (e i suoi file e
#sottodirectory ricorsivamente).
#Stampare a video tutte le sottodirectory (non i file) della vostra directory BUTTAMI
#comprese le sottodirectory delle sottodirectory e così via ricorsivamente.
#Eliminare la directory "include" nella vostra directory BUTTAMI (eliminare anche
#tutti i file e sottodirectory di include, ATTENTI A NON ELIMINARE l'ORIGINALE
#/usr/include
#27) per tutti i file contenuti nella directory /usr/include/ (NON NELLE
#SOTTODIRECTORY) far vedere a video le righe che contengono almeno un
#carattere * e contare quante sono queste righe
#28) Rifare tutto l'esercizio 26 qui sopra dove però il "per ciascuno dei file nella directory"
#viene realizzato usando anche una command substitution.
mkdir BUTTAMI
touch "BUTTAMI/* **"
touch "BUTTAMI/***"
touch "BUTTAMI/;;"

ls BUTTAMI
for I in `ls BUTTAMI`
do
	touch "BUTTAMI/${I}.txt"
done

cp -r /usr/include BUTTAMI
find BUTTAMI -type d
rm -rf BUTTAMI/include

for I in `find /usr/include -type f`
do
	echo "Linee di ${I} che contengono * (`grep "*" $I | wc -l`):"
	grep "*" $I
done

rm -rf BUTTAMI
