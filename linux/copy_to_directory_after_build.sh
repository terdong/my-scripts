#!/bin/bash
echo "*** Start Script ***"

echo "*** 함수 생성 ***"
echo

function printTitle()
{
echo
echo "*** $1 ***"
echo
}
function printLog()
{
echo "$1"
}
function printError()
{
echo "[ERROR] $1"
}
function printWarnig()
{
echo "[WARNING] $1"
}
function printScriptEnd()
{
echo -e "\n*** End Script. ***\n*** make By Pien_Terdong ***"
}

function removeDirectory()
{
	for name in "$@"; do
		if [ -d "$name" ]; then
			printTitle "remove $name"
			rm -rfv "$name"
		else
			printWarnig "$name not found"
		fi
	done
}

function copyToDirectory()
{
	printTitle "copy $1 to $2"
	cp -rfv "$1" "$2"
}

function isDirectory()
{
	printTitle "Checking Directory"
	for dir in "$@"; do
		[ ! -d "$dir" ] && echo "$dir not found" && exit 1
	done
	printTitle "Checking Complete"
}

printLog "printTitle()"
printLog "printLog()"
printLog "printError()"
printLog "printWarnig()"
printLog "printScriptEnd()"
printLog "removeDirectory()"
printLog "copyToDirectory()"

# 파라미터(타겟 디렉토리) 여부 검사.
[ ! "$1" ] && printError "Parameter \$1 is null. Check Target Directory Parameter." && exit 1

printTitle "디렉토리 변수 설정"

if [ "$2" = "android" ]; then
	SOURCE_DIR="./Build/RealbaseBall"
	SOURCE_DIR_ASSETS="$SOURCE_DIR/assets"
	SOURCE_DIR_LIBS="$SOURCE_DIR/libs"

	DIST_DIR="./Android/$1"
	DIST_DIR_ASSETS="$DIST_DIR/assets"
	DIST_DIR_LIBS="$DIST_DIR/libs"
	DIST_DIR_BIN="$DIST_DIR/bin"
elif [ "$2" = "ios" ]; then
	SOURCE_DIR="./Build/RealbaseBall"
	SOURCE_DIR_ASSETS="$SOURCE_DIR/Data"
	SOURCE_DIR_LIBS="$SOURCE_DIR/Libraries"

	DIST_DIR="./IPhone/$1"
	DIST_DIR_ASSETS="$DIST_DIR/Data"
#	DIST_DIR_LIBS="$DIST_DIR/Libraries"
	DIST_DIR_BIN="$DIST_DIR/Libraries"
else
	printError "You Must Input 2nd Parameter."
	exit 1
fi

printLog "SOURCE_DIR        = $SOURCE_DIR"
printLog "SOURCE_DIR_ASSETS = $SOURCE_DIR_ASSETS"
printLog "SOURCE_DIR_LIBS   = $SOURCE_DIR_LIBS"

printLog "DIST_DIR          = $DIST_DIR"
printLog "DIST_DIR_ASSETS   = $DIST_DIR_ASSETS"
printLog "DIST_DIR_LIBS     = $DIST_DIR_LIBS"
printLog "DIST_DIR_BIN      = $DIST_DIR_BIN"

# 디렉토리 여부 검사.
isDirectory "$SOURCE_DIR" "$SOURCE_DIR_ASSETS" "$SOURCE_DIR_LIBS" "$DIST_DIR"

removeDirectory "$DIST_DIR_ASSETS" "$DIST_DIR_BIN"

copyToDirectory "$SOURCE_DIR_ASSETS" "$DIST_DIR"
copyToDirectory "$SOURCE_DIR_LIBS" "$DIST_DIR"

printScriptEnd

