#!/bin/bash

for FILE in `ls`;do echo "file is ${FILE}"&&ls -ld ${FILE}; if [[ $? != 0 ]];then echo "ls ritorna errore ${?}";fi;done
