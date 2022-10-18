#!/usr/bin/env bash
#

# ------------------------------- VARIÁVEIS -------------------------------------- #
ARQ_CONF=arquivo.conf
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

# ------------------------------- TESTES ----------------------------------------- #
[ ! -r "$ARQ_CONF" ] && echo "Não tem permissão de leitura" && exit 1

# ------------------------------- FUNÇÕES ---------------------------------------- #
DefinirParametros () {
    local parametro="$(echo $1 | cut -d = -f 1)"
    local valor="$(echo $1 | cut -d = -f 2)"

    case "$parametro" in
        USAR_CORES) USAR_CORES="$valor" ;;
        USAR_MAIUSCULAS) USAR_MAIUSCULAS="$valor" ;;
    esac    
}

# ------------------------------- EXECUÇÃO --------------------------------------- #
while read -r linha; do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue #se o primeiro caracter (cut -c1) for igual a '#' continue sem ler a linha
    [ ! $linha ] && continue # Se NÃO tiver nada na linha então continue sem ler a linha
    DefinirParametros $linha #Chamando a função DefinirParamentros com o parâmero $1=$linha
done < "$ARQ_CONF"
#OBS.: para testar se uma variável tem conteúdo utilizamos o if com a variável sozinha. Ex: [ $linha ]

[ "$USAR_MAIUSCULAS" = "1" ] && MENSAGEM="$(echo -e $MENSAGEM | tr a-z A-Z)"
[ "$USAR_CORES" = "1" ] && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"

echo "$MENSAGEM"

#OBS.: O arquivo de configuração precisa terminar com uma quebra de linha ou com um valor fora do código para ser lido pelo while