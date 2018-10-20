#!/bin/bash

down='./download'
indexurl=$1
class=$2
mkdir -p ${down}/${class}
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
	grep -q "$a4" $down/update.log
	if [[ $? == 0 ]]; then
		echo "no update"
	else
		echo -e "$a4" >> $down/update.log
		echo $a3
### for make sure get the right url	
		n=0
		while [[ "$n" < 5 ]]
		do
			python -W ignore py_script/xigua.py https://www.ixigua.com/a"$a3" video_html vjs_video_3_html5_api
			title=`grep 'utf-8"><title' video_html | sed 's/.*utf-8"><title>\(.*\)<\/title.*/\1/g'`
			videourl=`grep 'video/mp4' video_html | sed 's/.*video\/mp4" src="\(.*\)"><\/video.*/\1/g'`
	#		echo $videourl
			grep -q "video/mp4" video_html
			if [[ "$?" < 1 ]]; then
				echo $videourl | grep -q "AWSAccessKeyId"
				if [[ "$?" > 0 ]]; then
					n=5
				fi
			fi
			echo $n
			n=`expr $n + 1`
		done
### make sure get the right url
		echo $videourl
#		aria2c $videourl\#mp4 -o ${down}/${class}/${title}.mp4 &
		python py_script/ml.py $a3
	fi
	i=`expr $i + 1`
done
