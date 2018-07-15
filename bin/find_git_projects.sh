#!/bin/bash
# Utility per cercare ricorsivamente progetti GIT nelle cartelle
# 
# (2016) Giuseppe Ursino
#

#set -x

SCRIPTNAME=`basename $0`
DATE=`date +%Y%m%d`

function usage() {

	echo "Update the permission to some path of the server"
	echo ""
	echo "Usage: $SCRIPTNAME <DIR>"
	echo "Example: $SCRIPTNAME ."
	exit 2
}

## PARSE OPTIONS
while getopts 'h' OPTION
do
	case $OPTION in
	
	h|?)	usage
		;;
	esac
done
shift $(($OPTIND - 1))


if [ "$1" == "" ]; then
	usage
fi

DIR="$1"

## MAIN

echo ""
echo "Cartelle dove sono presenti progetti GIT:"
find $DIR -type d -name .git | xargs -n 1 dirname
echo ""
echo "done."
