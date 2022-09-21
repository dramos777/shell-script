#!/usr/bin/env bash

#Contexto:
#Parametros do comando: $1 $2 $3 $4... (Ex: script.sh -a -b /etc/passwd /tmp)
                                       # script.sh ~> é o comando
                                       # -a ~> parametro 1
                                       # -b ~> parametro 2
                                       # /etc/passwd ~> parametro 3
                                       # /tmp ~> parametro 4
#Codigo#################################
echo "Parametro 1: $1"
echo "Parametro 1: $2"

echo "Todos os parametros: $*"
echo "Contagem de parametros: $#"
echo "Saida do ultimo comando: $?" #Utilizado para verificar saida com erro
echo "Exibir o PID do processo: $$"
echo "Exibir o nome do script: $0"