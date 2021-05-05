#!/bin/bash

# 파라미터(타겟 디렉토리) 여부 검사.
[ ! "$1" ] && echo "[ERROR] Parameter \$1 is null. Check Target Project Directory Parameter." && exit 1
echo "change $1 to $SVN_REVISION"
sed "s/\(public static int BinaryVersion=\).*\$/\1${BinaryVersion};/" "$1" > "$1_tmp"
sed "s/\(public static int BinaryVersionBuild=\).*\$/\1${SVN_REVISION};/" "$1_tmp" > "$1"
rm -rf "$1_tmp"
#mv "$1_tmp" "$1"

[ ! "$2" ] && echo "[WARNING] Parameter \$2 is null. Check Target Project Directory Parameter." && exit 1
echo "change $2 to $SVN_REVISION"
#sed "s/\(android:versionCode=\).*\$/\1\"${SVN_REVISION}\"/"  "$2" > "$2_tmp"
sed "s/\(android:versionCode=\).*\$/\1\"${SVN_REVISION}\"/" "$2" > "$2_tmp"
sed "s/\(android:versionName=\).*\$/\1\"${ShowBinaryVersion}.${BinaryVersion}.${SVN_REVISION}\"/" "$2_tmp" > "$2"
rm -rf "$2_tmp"
#mv "$2_tmp" "$2"


#sed "s/\(BinaryVersionBuild=\).*\$/\1${SVN_REVISION}/"  $1 > myTemp
#mv ./myTemp $1
