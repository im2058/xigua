#!/bin/bash
#python xigua.py
ti=`grep 'video-time' index | sed 's/.*video-time">\(.*\)<\/span.*/\1/g' | sed 's/\s/-/g'`
echo -e $ti > tmp_1
dura=`grep 'img-duration' index | sed 's/.*img-duration">\(.*\)<\/span><\/i.*item\/\(.*\)\/" target.*/\1/g'`
echo -e $dura > tmp_2
item=`grep 'img-duration' index | sed 's/.*img-duration">\(.*\)<\/span><\/i.*item\/\(.*\)\/" target.*/\2/g'`
echo -e $item > tmp_3
trr=`sed -n 1p tmp`
#for tmp in ${ti[@]}
#do		
##	echo ${t1[2]}
#done
echo ${trr[2]}
