#!/bin/bash

#url=`curl -s 'https://cfpwwwapi.kbs.co.kr/api/v1/landing/live/channel_code/60_24' | jq -r '.channel_item[].service_url'`

#echo $url

today_date=$(date "+%y%m%d_%H")
#tmp="echo hey! %s"
#tmp2=$(printf "$tmp" "hi")
#$tmp2
if [ -n "$1" ];then
	arg=$1
	destination=/archives/contents_00/music/radio/classic_fm
    url=`curl -s 'https://cfpwwwapi.kbs.co.kr/api/v1/landing/live/channel_code/60_24' | jq -r '.channel_item[].service_url'`
	if [ $arg -eq 11 ];then
		title="팝브런치"
		duration=01:00:00
	elif [ $arg -eq 12 ];then
		title="생생클래식"
		duration=02:00:00
	elif [ $arg -eq 17 ];then
		title="FM풍류마을"
		duration=01:00:00
	elif [ $arg -eq 22 ];then
		title="당신의밤과음악"
		duration=02:00:00
	elif [ $arg -eq 24 ];then
		title="JAZZ수첩"
		duration=01:00:00
	else
		title="세상의모든음악"
		duration=02:00:00
	fi
	file_name="${today_date}_${title}"
	#echo $file_name

	#duration=`expr $duration \* 5`
    sudo ffmpeg -i $url -c copy -t $duration "${destination}/${file_name}.mp4"
fi

