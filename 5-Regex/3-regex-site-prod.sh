#!/usr/bin/env bash
#

#VARIAVEIS
ARQUIVO_DE_TITULOS="titulos.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

#TESTES
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y #Lynx instalado?

#EXECUÇÃO

lynx -source http://lxer.com | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' > titulos.txt

while read -r titulo_lxer; do #read lê um argumento passado direto no terminal (STDIN).
                              #neste exemplo STDIN tá sendo passado pela variável $ARQUIVO_DE_TITULOS
                              #o read tá armazenando o valor na variável titulo_lxer (linha a linha)
    echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lxer" #atribuição de cores
done < "$ARQUIVO_DE_TITULOS" #$ARQUIVO_DE_TITULOS tem as linhas STDIN enviadas para o read


