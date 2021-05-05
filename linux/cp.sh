#! /bin/zsh

echo " HEllo Bash"

while getopts t: opt
do
    case ${opt} in
        t) t_path="$OPTARG" ;;
    esac
done

shift $(($OPTIND - 1)) 

for dir in $*
do
    echo $dir
    tar cvf - $dir | (cd ${t_path} ; tar xvf -) ;
done

#tar cvf - movie_etc | (cd /archives/contents_00/ ; tar xvf -)
