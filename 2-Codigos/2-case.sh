#!/usr/bin/env bash

#VARIABLES
USERS="$(cat /etc/passwd | cut -d ":" -f1)"
OPTIONS="
    $0 - [OPTIONS]

    -h - Help
    -v - Version
    -s - Sort the text
"
VERSION="v1"

#EXECUTIONS
[ "$1" = "-h" ] && echo "$OPTIONS" && exit 0

[ "$1" = "-v" ] && echo "$VERSION" && exit 0

[ "$1" = "-s" ] && echo "$USERS" | sort && exit 0

echo "$USERS"