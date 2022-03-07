#!/bin/bash

if [ $# -ge 1 ]
then
	for i in $@
	do
		echo "$i"
	done
	exit 0
else
	error1="Error 1: No tiene argumentos"
	echo "El usuario $USER en fecha $(date) ejecuto un $error1" >> for.log
	exit 1
fi
