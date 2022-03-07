#!/bin/bash

# Karen Rodriguez

deb="$(grep -i fdeb.txt)"
rpm="$(grep -i frpm.txt)"

for i in $@
do
	isDeb=0
	for e in $deb
	do
		if [ $i == $e ]
		then
			echo "$i -> familia deb"
			isDeb=1
		fi
	done

	if [ $isDeb == 0 ]
	then
		for o in $rpm
		do
			if [ $i == $o ]
			then
				echo "$i -> familia rpm"
			fi
		done
	fi
done
