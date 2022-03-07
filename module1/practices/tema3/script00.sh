#!/bin/bash

# comentarios

n1=10
n2=12

suma=$n1+$n2
echo "Intento 1: $suma"
suma=$[$n1 + $n2]
echo "Intento 2: $suma"

read -p "Nota A: " notaA
read -p "Nota B: " notaB

suma=$[$notaA + $notaB]

echo "La suma es:  $suma"

exit 0

