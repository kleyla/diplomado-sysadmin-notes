#!/bin/bash

for i in $@
do
	echo "arg: $i"
done

for i in {1..10}
do
	echo "arg: $i"
done

for i in $@
do
	if [ $i == "-h" ] || [ $i == "--help" ]
	then
		echo "Impresion de ayuda for"
		echo "Ingrese nombres"
	else
		echo "$i"
	fi

done
