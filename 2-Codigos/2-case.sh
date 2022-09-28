#!/usr/bin/env bash

#VARIABLES
USERS="$(cat /etc/passwd | cut -d ":" -f1)"
OPTIONS="
    $(basename $0) - [OPTIONS]

    -h - Help
    -v - Version
    -s - Sort the text
"
 #OBS.O comando basename acima remove ./ do script mantendo apenas o nomebase

VERSION="v1"

#EXECUTIONS
# [ "$1" = "-h" ] && echo "$OPTIONS" && exit 0
# [ "$1" = "-v" ] && echo "$VERSION" && exit 0
# [ "$1" = "-s" ] && echo "$USERS" | sort && exit 0
case $1 in
    -h) echo "$OPTIONS" && exit 0 ;;
    -v) echo "$VERSION" && exit 0 ;;
    -s) echo "$USERS" | sort && exit 0 ;;
     *) echo "$USERS" ;;
esac