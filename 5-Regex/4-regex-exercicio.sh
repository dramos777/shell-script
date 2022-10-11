#!/usr/bin/env bash
#

#VARIAVEIS
ARQ_CURSO="cursos.txt"
COUNT=$(for i in $(seq 11 22 300);do echo -n "$i,"; done|sed 's/,$//')

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

#TESTES
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y #Lynx instalado?

#EXECUÇÃO

lynx -source https://www.linuxtips.io/collections/treinamentos | grep "name.*public_title" | \
cut -d : -f"$COUNT" | sed 's/,\"public_title\"//g;s/:/\n/g' > cursos.txt
echo ""
echo -e "${VERMELHO}################ CURSOS DISPONÍVEIS ################"

while read -r cursos; do
    echo -e "${VERMELHO}Curso: ${VERDE}$cursos"
done < "$ARQ_CURSO"