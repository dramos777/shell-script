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
[ ! -x "$(which dialog)" ] && sudo apt update && apt install dialog -y > /dev/null 2>&1

#FUNCTIONS
ListUsers () {
  egrep -v "^#|^$" "$DB" | tr : ' ' > "$TEMP"
  dialog --title "Lista de Usuarios" --textbox "$TEMP" 20 40 #0 0 para automatico
  rm -f "$TEMP"
}

ExistUserValidation () {
    grep -i -q "$1$SEP" "$DB"
}

AddUser () {
    local last_id="$(egrep -v "^#|^$" $DB | sort | tail -n 1 | cut -d $SEP -f 1)"
    local next_id=$(($last_id+1))

    local name=$(dialog --title "Cadastro de usuários" --stdout --inputbox "Digite seu nome" 0 0)
    ExistUserValidation "$name" && {
        dialog --title "ERRO FATAL" --msgbox "Usuário já cadastrado no sistema!" 6 40
        exit 1
    }
    local email=$(dialog --title "Cadastro de usuários" --stdout --inputbox "Digite seu E-mail" 0 0)
    echo "$next_id$SEP$name$SEP$email" >> "$DB"
    dialog --title "Cadastro de usuários" --msgbox "Usuário "$name" cadastrado com sucesso!" 6 60

}

DelUser () {
   local users=$(egrep "^$|^#" -v "$DB" | sort -h | cut -d $SEP -f 1,2 | sed 's/:/ "/;s/$/"/')
   local user_id=$(eval dialog --stdout --menu \"Escolha um usuário:\" 0 0 0 $users)
   #Se faz necessário "escapar" as aspas com \ para que o eval identifique as aspas como string

   grep -i -v "^$user_id$SEP" "$DB" > "$TEMP"
   mv "$TEMP" "$DB"

   dialog --title "Cadastro de Usuários" --msgbox "Usuário removido com sucesso!" 6 40
 
}

SortList () {
    sort "$DB" > "$TEMP"
    mv "$TEMP" "$DB"
}
#EXECUTION
while :
do
action=$(dialog --title "Gerenciador de Usuários 2.0" \
                --stdout \
                --menu "Escolha uma das opções abaixo" 0 0 0 \
                Listar "Lista todos os usuários cadastrados no sistema" \
                Inserir "Adiciona um usuário no sistema" \
                Remover "Remove um usuário do sistema")
    case $action in
        Listar) ListUsers ;;
        Inserir) AddUser  ;;
        Remover) DelUser  ;;
    esac
done
