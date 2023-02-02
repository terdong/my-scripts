#!/bin/bash

function _error(){
	echo "$1"
	exit 1
}

today_date=$(date "+%y%m%d_%H")
hour=$(date "+%H")
url=`curl -s 'https://cfpwwwapi.kbs.co.kr/api/v1/landing/live/channel_code/60_24' | jq -r '.channel_item[].service_url'`

if [[ ! "$url" =~ ".m3u8" ]];then
	_error "Failed to fetch a url."	
fi

if [ -n "$1" -a -d "$1" ];then
	destination=$1
	if [ $hour -eq 11 ];then
		title="팝브런치"
		duration=01:00:00
	elif [ $hour -eq 12 ];then
		title="생생클래식"
		duration=02:00:00
	elif [ $hour -eq 17 ];then
		title="FM풍류마을"
		duration=01:00:00
	elif [ $hour -eq 22 ];then
		title="당신의밤과음악"
		duration=02:00:00
	elif [ $hour -eq 24 ];then
		title="JAZZ수첩"
		duration=01:00:00
	elif [ $hour -eq 18 ];then
		title="세상의모든음악"
		duration=02:00:00
	fi

	if [ -n "$title" ];then
		file_name="${today_date}_${title}.mp4"
		tmp_path="/tmp/${file_name}"
		ffmpeg -i $url -c copy -t $duration $tmp_path && mv -f $tmp_path $destination
	else
		_error "Now($hour) is not the right time to record."
	fi
else
	_error "no directory: $1"
fi

### test codes ###
#url=`curl -s 'https://cfpwwwapi.kbs.co.kr/api/v1/landing/live/channel_code/60_24' | jq -r '.channel_item[].service_url'`
#ffmpeg -f concat -safe 0 -i <(for f in ./*.aac; do echo "file '$PWD/$f'"; done) -c copy playlist.mp4
#tmp="echo hey! %s"
#tmp2=$(printf "$tmp" "hi")
#$tmp2
#echo $file_name
#duration=`expr $duration \* 5`

