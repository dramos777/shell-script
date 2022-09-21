#!/usr/bin/env bash

echo "=====For 1"
for (( i = 0; i < 10; i++)); do
    echo $i
done

echo "=====For 2 (seq)"
for i in $(seq 10); do
    echo $i
done

echo "=====For 3 (array)"
Frutas=(
    'Laranja'
    'Ameixa'
    'Abacaxi'
)
for i in "${Frutas[@]}"; do # OBS: @ represeta todos, 0 a laranja, 1 ameixa...
    echo "$i"
done