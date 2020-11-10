#!/bin/bash
echo "================================="
echo "Lezione 2 S.O. - Eugenio Tampieri"
echo -e "=================================\n"

# 1. Visualizzare a video il contenuto delle variabili USER HOME DISPLAY
echo -e "USER=${USER}\tHOME=${HOME}\tDISPLAY=${DISPLAY}"
# 2. Verificare se le variabili USER HOME DISPLAY sono di ambiente o locali.
echo -e "\nEs 2"
MIAVAR=1
for I in USER HOME DISPLAY MIAVAR
do
	env | grep $I > /dev/null;
	if env | grep $I > /dev/null
	then
		echo "${I} è variabile d'ambiente."
	else
		echo "${I} non è variabile d'ambiente."
	fi
done
# 3. Scrivere un comando che crea una nuova variabile di nome PIPPO la quale contiene la concatenazione dei contenuti delle variabili USER HOME DISPLAY
PIPPO="${USER}${HOME}${DISPLAY}"
echo -e "\nEs 3\nPIPPO=${PIPPO}"
# 4. Scrivere uno script bash, di nome crea_var.sh, che crea una nuova variabile di
# nome PIPPO la quale contiene la concatenazione dei contenuti delle variabili USER
# HOME DISPLAY

mkdir -p lab02
CREA_VAR_DOT_SH="PIPPO=\"\${USER}\${HOME}\${DISPLAY}\""
echo $CREA_VAR_DOT_SH > lab02/crea_var.sh
chmod +x lab02/crea_var.sh

# 5. Dall’interno di una shell bash, eseguire lo script crea_var.sh in un modo tale che la
# variabile PIPPO sia presente (col nuovo contenuto) dentro la bash chiamante dopo
# la fine dell’esecuzione dello script crea_var.sh
source lab02/crea_var.sh
# 6. Spostarsi in radice del filesystem e poi stampare a video la propria home directory.
OLD_WORKING_DIR=`pwd`
cd /
ls -lsah ${HOME}
# 7. Creare nella propria home directory una sottodirectory A1 che contiene una
# sottodirectory B2 che contiene una sottodirectory C3 che contiene tre file 1.txt 2.txt
# e 3.txt. Poi usate il comando move (mv) per spostare i 3 file nella directory B2.
# Poi usate il comando copy (cp) per mettere una copia dei tre file nella directory A1.
cd ~
mkdir -p A1/B2/C3
touch A1/B2/C3/{1,2,3}.txt
mv A1/B2/C3/* A1/B2
cp A1/B2/* A1
cd ${OLD_WORKING_DIR}
# 8. Provare a vedere il contenuto di tutti i file nascosti presenti nella propria home
# directory, usando il comando cat. Notare il problema dato dal fatto che .* viene
# espanso anche con ..
cat ~/.*
# 9. Usare la funzionalità di completamento (tasto TAB) per scrivere velocemente
# l’argomento del comando ls /usr/include/linux/netfilter/nf_nat.h
# 10. Lanciare il comando history e scegliere uno dei comandi elencati da history.
# Utilizzare le funzioni di history per rilanciare quel comando.

#history 
#echo "Quale comando vuoi eseguire?"
#read COMMAND_NUMBER
#echo "!${COMMAND_NUMBER}" | bash

# 11. Usare il comando set per disabilitare la memorizzazione di history. Poi lanciare un
# comando qualsiasi e poi lanciare history e verificare che quel comando non è stato
# memorizzato. Infine, usare il comando set per riabilitare la memorizzazione di
# history.
set +o history
ls -lsa
set -o history
history
echo prova
history
set +o history
# 12. Usare il comando set per abilitare la creazione di variabili d'ambiente e verificare se
# funziona (inventarsi un modo per testare se le variabili sono create come var
# d'ambiente oppure no)
STAMPA_VAR_DOT_SH="#!/bin/bash\necho \$CIAO"
echo -e $STAMPA_VAR_DOT_SH>lab02/stampa_var.sh
chmod +x lab02/stampa_var.sh
set -a
CIAO="MONDO"
#env
echo "Se sotto vedi stampato \"${CIAO}\" allora la variabile è di ambiente"
lab02/stampa_var.sh
set +o allexport

# 13. Inserire un comando echo, con un messaggio diverso, nei file .profile e .bashrc
# Poi lanciare una shell interattiva NON di login e verificare quale dei due file viene
# eseguito. Poi lanciare una shell NON interattiva e verificare che non viene eseguito
# nessuno dei due file. Poi riportare i file .profile e .bashrc come erano all'inizio.
# 14. Usare i metacaratteri per visualizzare con ls le proprietà dei file contenuti nella
# directory /usr/lib/ che hanno un nome che contiene la stringa plu
ls /usr/lib/*plu*
# 15. Usare il comando man per studiare le opzioni del comando ls.
# 16. Usare ls e le sue opzioni per visualizzare tutti i file nella directory /usr/include/ e
# nelle sue sottodirectory.
ls -R /usr/include
# 17. Usare ls e le sue opzioni per visualizzare le informazioni di una directory
# /usr/include/ senza visualizzare tutti i file nella directory
echo "ES 17"
ls -lsahd /usr/include

# 18. Creare una sottodirectory
# BUTTAMI e crearci dentro due file AbC.txt e ABC.txt
mkdir BUTTAMI
touch BUTTAMI/A{b,B}C.txt
# 19. Eliminare il file appena creato ABC.txt
rm BUTTAMI/ABC.txt
# 20. Eliminare, con un unico comando, la directory BUTTAMI e tutti i files in essa
# contenuti.
rm -rf BUTTAMI
# 21. Visualizzare, mediante ls e metacaratteri, tutti i files della directory /usr/lib/ il cui
# nome contiene
# - o un carattere numerico compreso tra 1 e 3
# - oppure un carattere letterale compreso tra c ed m.
# e che termina con l’estensione .0
ls /usr/lib/*[1-3c-m]*.0
