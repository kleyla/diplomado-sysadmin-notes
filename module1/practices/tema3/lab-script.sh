#!/bin/bash

# Karen Rodriguez
# 24-11-2021
paises="brasil argentina bolivia peru chile ecuador colombia"

for i in $@
do
	for p in $paises
	do
		echo $i
		echo $p
		if [ $p == $i ]
		then
			echo "$i es de sudamerica"
		else
			echo "$i no es de sudamerica" >> paises.log
		fi
	done
done

echo "${#paises[@]}"

