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
# 8. Provare a vedere il contenuto di tutti i file nascosti presenti nella propria home
# directory, usando il comando cat. Notare il problema dato dal fatto che .* viene
# espanso anche con ..
cat ~/.*
# 9. Usare la funzionalità di completamento (tasto TAB) per scrivere velocemente
# l’argomento del comando ls /usr/include/linux/netfilter/nf_nat.h
