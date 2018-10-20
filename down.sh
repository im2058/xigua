#!/bin/bash

indexurl=$1
ti=`grep 'video-time' $indexurl | sed 's/.*video-time">\(.*\)<\/span.*/\1/g' | sed 's/\s/-/g'`
dura=`grep 'img-duration' $indexurl | sed 's/.*img-duration">\(.*\)<\/span><\/i.*item\/\(.*\)\/" target.*/\1/g'`
item=`grep 'img-duration' $indexurl | sed 's/.*img-duration">\(.*\)<\/span><\/i.*item\/\(.*\)\/" target.*/\2/g'`
i=1
for tmp in ${ti[@]}
do		
	a1=`echo $ti | cut -d' ' -f $i`
	a2=`echo $dura | cut -d' ' -f $i`
	a3=`echo $item | cut -d' ' -f $i`
	a4=`echo "$a1 $a2 $a3"`
#	echo $a4
	grep -q "$a4" update.log
	if [[ $? == 0 ]]; then
		echo "no update"
	else
		echo -e "$a4" >> update.log
		echo $a3
		python -W ignore py_script/xigua.py https://www.ixigua.com/a"$a3" video_html vjs_video_3_html5_api
		videourl=`grep 'video/mp4' video_html | sed 's/.*video\/mp4" src="\(.*\)"><\/video.*/\1/g'`
		echo $videourl
		echo $videourl | grep -q "AWSAccessKeyId" 
		if [[ $? == 0 ]]; then
			python -W ignore py_script/xigua.py https://www.ixigua.com/a"$a3" video_html vjs_video_3_html5_api
			videourl=`grep 'video/mp4' video_html | sed 's/.*video\/mp4" src="\(.*\)"><\/video.*/\1/g'`
			echo $videourl
		fi
#		aria2c $videourl/\#mp4 -o ${a3}.mp4
		python py_script/ml.py $a3
	fi
	i=`expr $i + 1`
done
