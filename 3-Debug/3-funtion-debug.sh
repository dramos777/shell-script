#!/usr/bin/env bash

#VARIABLES
CHAVE_DEBUG=0
NIVEL_DEBUG=0

#FUNCTION
#Uma função sempre começa com a primeira letra maiúscula seguida de ()
Debugar () {
    [ $1 -le $NIVEL_DEBUG ] && echo "Debug $*-------"
    #Uma função é como se fosse um "comando do linux". 
    # A variável $1 quando for executada vai receber o valor do primeiro argumento passado pra função Debugar
}

Soma () {
local total=0 #sempre que uma variável é colocada dentro de uma função usamos o local na frente.
              #sempre que declaramos uma variável dentro da função ela é escrita minúscula

for i in $(seq 1 20); do
    Debugar 1 "Entrei no for com o valor $i" #$1 = 1 (é como se estivesse executando o comando Debugar
                                             #no terminal e com o argumento 1)
    total=$(($total+$i))
    Debugar 2 "Depois da soma $total" #$1 = 2 (é como se estivesse executando o comando Debugar
                                             #no terminal e com o argumento 2)
done

}

#EXECUTION
case $1 in
    -d) [ $2 ]  && NIVEL_DEBUG=2 ;; #Se $2 existe e NIVEL_DEBUG=2
     *) Soma ;;
esac

Soma