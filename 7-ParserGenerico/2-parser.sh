#!/usr/bin/env bash

ARQUIVO_DE_CONFIGURACAO="$1" #essa variável $1 é o argumento do script 2-parser.sh descrita na linha do eval no arquivo programa.sh

[ ! -e "$ARQUIVO_DE_CONFIGURACAO" ] && echo "ERRO. Arquivo não existe." && exit 1
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo "ERRO. Sem permissão de leitura." && exit 1

while read -r linha
do
  [ "$(echo $linha | cut -c1)" = "#" ] && continue
  [ ! "$linha" ] && continue

  chave="$(echo $linha | cut -d = -f 1)"
  valor="$(echo $linha | cut -d = -f 2)"
  
  echo "CONF_$chave=$valor" #Novas variaveis criadas com o prefixo CONF_
 
done < "$ARQUIVO_DE_CONFIGURACAO"
