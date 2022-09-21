#!/usr/bin/env bash

VAR1=""
VAR2=""

#Forma de escrever 1
if [[ "$VAR1" = "$VAR2" ]]; then
    echo "São Iguais"
fi

#Forma de escrever 2
if [[ "$VAR1" = "$VAR2" ]]
then
    echo "São Iguais"
fi

#Forma de escrever 3
if [ "$VAR1" = "$VAR2" ];then
    echo "São Iguais"
fi

#Forma de escrever 4
if test "$VAR1" = "$VAR2"
then
    echo "São Iguais"
fi

#Forma de escrever 5
[ "$VAR1" = "$VAR2" ] && echo "São Iguais"

# Sempre que possível reduza o código utilizando o ultimo método
# Condicional && executa a próximoa condição apenas se a anterior for verdadeiro
# Condicional || executa a condição anterior ou a próxima condição