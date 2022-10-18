#!/usr/bin/env bash

ARQUIVO_DE_CONFIGURACAO="arquivo.conf" #arquivo de configuração
MENSAGEM="Mensagem de teste."
USAR_MAIUSCULAS=
USAR_CORES=
VERMELHO="\033[31;1m"

eval $(./2-parser.sh $ARQUIVO_DE_CONFIGURACAO) #O eval vai "exportar" as variáveis do script 2-parser.sh para este shell

[ "$(echo $CONF_USAR_MAIUSCULAS)" = "1" ] && USAR_MAIUSCULAS=1
[ "$(echo $CONF_USAR_CORES)" = "1" ] && USAR_CORES=1

[ "$USAR_MAIUSCULAS" = "1" ] && MENSAGEM="$(echo -e $MENSAGEM | tr a-z A-Z)"
[ "$USAR_CORES" = "1" ] && MENSAGEM="$(echo -e ${VERMELHO}$MENSAGEM)"

echo -e "$MENSAGEM"