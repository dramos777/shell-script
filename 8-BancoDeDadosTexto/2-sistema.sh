#!/usr/bin/env bash

#ENVIRONMENT
DB=db.txt
SEP=:
TEMP=temp.$$

GREEN="\033[32;1m"
RED="\033[31;1m"

#TESTS
[ ! -e "$DB" ] && echo "ERROR. $DB not exist." && exit 1
[ ! -r "$DB" ] && echo "ERROR. $DB not readable." && exit 1
[ ! -w "$DB" ] && echo "ERROR. $DB not writable." && exit 1

#FUNCTIONS
#Como boas práticas utilizar o separador das colunas como uma variável, neste caso, a $SEP
ShowUsers (){ #Esta função apenas exibe os usuários na tela. OBS. A variável $line está sendo substituída por $1
    local id="$(echo $1 | cut -d $SEP -f 1)" 
    local name="$(echo $1 | cut -d $SEP -f 2)"
    local email="$(echo $1 | cut -d $SEP -f 3)"
    
    echo -e "${GREEN}ID: ${RED}$id"
    echo -e "${GREEN}Name: ${RED}$name"
    echo -e "${GREEN}E-mail: ${RED}$email"
}
ListUsers () { #Esta função vai apenas ler as linhas e chamar a função ShowUsers
    while read -r line
    do
    [ "$(echo $line | cut -c1)" = "#" ] && continue
    [ ! "$line" ] && continue

    ShowUsers "$line"
    done < "$DB"

}
ExistUserValidation () { #Esta função verifica se o usuário existe de forma silenciosa
    grep -i -q "$1$SEP" "$DB"
}

AddUser () { #Adiciona o usuário e ordena utilizando a funão SortList
    local name="$(echo $1 | cut -d $SEP -f 2)"

    if ExistUserValidation "$name"
    then
        echo "ERROR. User already exist!"
    else
    echo "$*" >> "$DB"
    echo "User added successfully!"
    fi

    SortList        
}

DelUser () { #Deleta usuários
    ExistUserValidation "$1" || return

    grep -i -v "$1$SEP" "$DB" > "$TEMP"
    mv "$TEMP" "$DB"
    echo "User removed successfully!"
}

SortList () { #Organiza o arquivo pelo ID
    sort "$DB" > "$TEMP"
    mv "$TEMP" "$DB"
}