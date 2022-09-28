#!/usr/bin/env bash

#VARIABLES
USERS="$(cat /etc/passwd | cut -d ":" -f1)"
OPTIONS="
    $(basename $0) - [OPTIONS]

    -h - Help
    -v - Version
    -s - Sort the text
    -m - Change text to UPPER
"
 #OBS.O comando basename acima remove ./ do script mantendo apenas o nomebase

VERSION="v1"

CHAVE_SORT=0 #CHAVE_SORT inicia o valor com 0
CHAVE_TR=0 #CHAVE_TR inicia o valor com 0

#EXECUTIONS
case $1 in
    -h) echo "$OPTIONS" && exit 0 ;;
    -v) echo "$VERSION" && exit 0 ;;
    -s) CHAVE_SORT=1 ;; #Se -s for selecionado CHAVE_SORT muda de 0 para 1
    -m) CHAVE_TR=1 ;; #Se -m for selecionado CHAVE_TR muda de 0 para 1
     *) echo "$USERS" ;;
esac

[ $CHAVE_SORT -eq 1 ] && echo "$USERS" | sort #Se CHAVE_SORT igual a 1 executa este comando
[ $CHAVE_TR -eq 1 ] && echo "$USERS" | tr [a-z] [A-Z] #Se CHAVE_TR igual a 1 executa este comando

#OBS. Para usar mais de uma opção (-s e -m por exemplo) será necessário o shift