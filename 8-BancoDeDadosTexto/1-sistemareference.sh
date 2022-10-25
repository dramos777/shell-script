#!/usr/bin/env bash

#ENVIRONMENT
DB=db.test

GREEN="\033[32;1m"
RED="\033[31;1m"

#TESTS
[ ! -e "$DB" ] && echo "ERROR. $DB not exist." && exit 1
[ ! -r "$DB" ] && echo "ERROR. $DB not readable." && exit 1
[ ! -w "$DB" ] && echo "ERROR. $DB not writable." && exit 1

#FUNCTIONS
#Neste código a função está fazendo duas coisas. O ideal é que cada função faça apenas uma coisa expecífica.
#No outro código essa função foi separada
ListUsers () {
    while read -r line; do
    [ "$(echo $linha | cut -c1 )" = "#" ] && continue
    [ ! "$linha" ] && continue

    local id="$(echo $linha | cut -d : -f 1)"
    local name="$(echo $linha | cut -d : -f 2)"
    local email="$(echo $linha | cut -d : -f 3)"
    
    echo -e "${GREEN}ID: ${RED}$id"
    echo -e "${GREEN}Name: ${RED}$name"
    echo -e "${GREEN}E-mail: ${RED}$email"
    done < "$DB"
    

}