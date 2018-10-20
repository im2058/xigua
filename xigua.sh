#!/bin/bash
#download the toutiao

basedir=`pwd`
sourdir='/home/pi/KK/xigua/source'
#down='/home/pi/KK/xigua/down'
py='/home/pi/KK/xigua/py_script'
tmpdir='/home/pi/KK/xigua/tmp'
#cd $sourdir
for sr in `ls $sourdir`
do
	while read line
	do
#		echo $line
		url=`echo $line | awk '{print $1}'`
		idurl=`echo $line | cut -d'/' -f 6`
		echo $idurl
		python -W ignore $py/xigua.py $url $tmpdir/$idurl profile-page
		rm -rf $sourdir/ghostdriver*
		
		bash $basedir/down.sh $tmpdir/$idurl $sr
	done < $sourdir/$sr
done
cd $basedir

#ti=`grep 'video-time' index | sed 's/.*video-time">\(.*\)<\/span.*/\1/g' | sed 's/\s/-/g'`
#dura=`grep 'img-duration' index | sed 's/.*img-duration">\(.*\)<\/span><\/i.*item\/\(.*\)\/" target.*/\1/g'`
#item=`grep 'img-duration' index | sed 's/.*img-duration">\(.*\)<\/span><\/i.*item\/\(.*\)\/" target.*/\2/g'`
#i=1
#for tmp in ${ti[@]}
#do		
#	a1=`echo $ti | cut -d' ' -f $i`
#	a2=`echo $dura | cut -d' ' -f $i`
#	a3=`echo $item | cut -d' ' -f $i`
#	a4=`echo "$a1 $a2 $a3"`
##	echo $a4
#	grep -q "$a4" update.log
#	if [[ $? == 0 ]]; then
#		echo "no update"
#	else
#		echo -e "$a4" >> update.log
#		echo $a3
#		python -W ignore xigua.py https://www.ixigua.com/a"$a3"
#		videourl=`grep 'mp4' index | sed 's/.*mp4" src="\(.*\)\/"><\/video.*/\1/g'`
#		echo $videourl
#		aria2c $videourl/\#mp4 -o ${a3}.mp4
#		python ml.py
#	fi
#	i=`expr $i + 1`
#done


