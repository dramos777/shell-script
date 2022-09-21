#!/usr/bin/env bash

Frutas=(
    'Laranja'
    'Ameixa'
    'Abacaxi'
)

echo "==== While" #Para utilizar o while é necessário iniciar com um contador
contador=0
while [ $contador -lt ${#Frutas[@]} ]; do
    echo $contador
    contador=$(($contador+1))
    
done
