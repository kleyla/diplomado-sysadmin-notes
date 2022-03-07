#!/bin/bash
# para or ||
# para and &&
#  [ condicion1 ] && [ condicion2 ]

if [ $# == 2 ]
then
	name=$1
	last=$2
	echo "$name $last"
else
	echo "2 paramatros requeridos"
fi
