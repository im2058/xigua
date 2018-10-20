#!/bin/bash
n=0
while [[ "$n" < 5 ]]
do
	grep -q "AA" ll
	#echo $?
	if [[ "$?" > 0 ]]; then
		n=5
	#	echo $n
	fi
	echo $n
	n=`expr $n + 1`
done
