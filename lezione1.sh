#!/bin/bash
echo "================================="
echo "Lezione 1 S.O. - Eugenio Tampieri"
echo "================================="

# Esercizio 1 - ricerca GCC
echo "Cerco GCC"
GCC_PATH=`which gcc`
echo "GCC si trova in ${GCC_PATH}"
# Es 2 - mostra directory che contiene gcc con un percorso relativo
ls ../../../../usr/bin
# Es 3 - lancia gcc
gcc
# Es 4 - Lancia df
df -h
# Es 5 - torna alla home
CURRENT_PATH=`pwd`
cd
# Es 6 - Verificare dove ci si trova
pwd
cd ${CURRENT_PATH}

