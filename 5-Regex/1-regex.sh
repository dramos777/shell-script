#!/usr/bin/env bash

#| Operador |                        Descrição                       |
#|----------|--------------------------------------------------------|
#|     ^    | Início da linha                                        |
#|----------|--------------------------------------------------------|
#|     $    | Fim da linha                                           |
#|----------|--------------------------------------------------------|
#|     .    | Curinga que representa um caractere                    |
#|----------|--------------------------------------------------------|
#|     +    | O dígito anterior deve aparecer uma vez ou mais        |
#|----------|--------------------------------------------------------|
#|     []   | Lista de caracteres                                    |
#|----------|--------------------------------------------------------|
#|     [^]  | Lista de caracteres negada                             |
#|----------|--------------------------------------------------------|
#|     |    | Operador "ou"                                          |
#|----------|--------------------------------------------------------|
#|     .*   | Curing para qualquer coisa                             |
#|----------|--------------------------------------------------------|
#|     *    | O dígito anterior pode aparecer em qualquer quantidade |
#|----------|--------------------------------------------------------|
#|     {,}  | O dígito anterior deve aparecer na quantidade indicada |
#|----------|--------------------------------------------------------|

#EXEMPLOS
#Filtrar por strings que iniciam com a letra "m"
grep "^m" /etc/passwd

#Filtrar por strings que terminam com a letra "h"
grep "h$" /etc/passwd

#Filtrar por strings que começam com "r", tenha qualquer coisa no meio e termine com "h"
grep "^r.*h$" /etc/passwd

#Filtrar por tudo que comece com a letra "s" e a segunda letra seja "a" ou "p"
grep "^s[ap]" /etc/passwd

#Filtrar por tudo que comece com a letra "s" e a segunda letra NÃO seja "a" ou "p"
grep "^s[^ap]" /etc/passwd

#Filtrar por tudo que comece com qualquer coisa e tenha a na segunda letra um "a"
grep "^.[a]" /etc/passwd

#EXPRESSÕES REGULARES EXTENDIDAS
#Filtrar por tudo que comece com qualquer coisa e tenha de 80 digitos ou mais
egrep "^.{80,}" /etc/passwd

#Filtrar por tudo que comece com qualquer coisa e tenha de 80 a 90 digitos
egrep "^.{80,90}$" /etc/passwd

#Filtrar pela string teste e a string root
egrep "teste|root" /etc/passwd

#EXERCICIOS
#Grupos que começam com a letra "r" no arquivo /etc/group
cut -d : -f1 /etc/group | grep "^r"

#Grupos que terminem com a letra "t"
cut -d : -f1 /etc/group | grep "t$"

#Grupos que comecem com a letra "r" e terminem com a letra "t"
cut -d : -f1 /etc/group | grep "^r.*t$"

#Grupos que terminam com a letra "e" ou "d"
cut -d : -f1 /etc/group | grep "[ed]$"

#Grupos que não terminam com a letra "e" ou "d"
cut -d : -f1 /etc/group | grep "[^ed]$"

#Grupos que começam com qualquer dígito e a segunda letra seja um "u" ou "d"
cut -d : -f1 /etc/group | grep "^.[ud]" 

#Grupos que tenha seu nome de 2 a 4 dígitos de tamanho
cut -d : -f1 /etc/group | egrep "^.{2,4}$"

#Grupos que comecem com "r" ou "s" (use o operador OR)
cut -d : -f1 /etc/group | egrep "^r|^s"
