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
while [ -n "$1" ]; do  #enquanto $1 não estiver vazia faça
    case $1 in #caso $1 seja:
        -h) echo "$OPTIONS" && exit 0 ;;
        -v) echo "$VERSION" && exit 0 ;;
        -s) CHAVE_SORT=1 ;; #Se -s for selecionado CHAVE_SORT muda de 0 para 1
        -m) CHAVE_TR=1 ;; #Se -m for selecionado CHAVE_TR muda de 0 para 1
         *) echo "Ivalid option. -h for help!" && exit 1 ;; #Para qualquer outra coisa faça isso
    esac
    shift #Transfira o valor variavel da direita para a esquerda ($1<~$2<~$3<~$4<~...)
done

[ $CHAVE_SORT -eq 1 ] && USERS=$(echo "$USERS" | sort) #Se CHAVE_SORT igual a 1 executa este comando
[ $CHAVE_TR -eq 1 ] && USERS=$(echo "$USERS" | tr [a-z] [A-Z]) #Se CHAVE_TR igual a 1 executa este comando

echo "$USERS"