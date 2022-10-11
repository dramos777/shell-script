#!/usr/bin/env bash

#VARIABLES
CHAVE_DEBUG=0
NIVEL_DEBUG=0

#Para adicionar cores no bash sempre iniciamos com "\033[" que representa o ESC.
#As opções são separadas por ";"
#Por boas práticas é recomendado declarar este tipo de variávem dentro de ${}, mas funcionam
#se utilizada apenas com o $
#Para aplicar as configurações de cores o comando echo precisa ser utilizado com a opção -e
ROXO="\033[35;1m"
CIANO="\033[36;1m"

#FUNCTION
#Uma função sempre começa com a primeira letra maiúscula seguida de ()
Debugar () {
    [ $1 -le $NIVEL_DEBUG ] && echo -e "${2}Debug $*-------" #Também funcionar utilizando apenas $2
    #Uma função é como se fosse um "comando do linux". 
    # A variável $1 quando for executada vai receber o valor do primeiro argumento passado pra função Debugar
    #Comando echo precisa ser utilizado com opão -e
}

Soma () {
local total=0 #sempre que uma variável é colocada dentro de uma função usamos o local na frente.
              #sempre que declaramos uma variável dentro da função ela é escrita minúscula

for i in $(seq 1 20); do
    Debugar 1 "${ROXO}" "Entrei no for com o valor $i" #$1 = 1 (é como se estivesse executando o comando Debugar
                                             #no terminal e com o argumento 1)
                                             #Também funciona utilizando apenas $ROXO
    total=$(($total+$i))
    Debugar 2 "${CIANO}" "Depois da soma $total" #$1 = 2 (é como se estivesse executando o comando Debugar
                                             #no terminal e com o argumento 2)
                                             #Também funciona utilizando apenas $CIANO
done

}

#EXECUTION
case $1 in
    -d) [ $2 ]  && NIVEL_DEBUG=2 ;; #Se $2 existe e NIVEL_DEBUG=2
     *) Soma ;;
esac

Soma