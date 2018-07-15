#!/bin/sh
# Down the priority of PID and of all its children
#
# (2017) Giuseppe Ursino
#

#set -x

SCRIPTNAME=`basename $0`
DATE=`date +%Y%m%d`

usage() {

echo "Down the priority of PID and of all its children"
	echo ""
	echo "Usage: $SCRIPTNAME <PID>"
	echo "Example: $SCRIPTNAME 1224"
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


if [ ! "$#" -eq 1 ]; then
	usage
fi

PID=$1

## MAIN

# -n [-20..+20] 
#  POSITIVE -> less priority
#  NEGATIVE -> high priority

renice -n 15 -p $(find_pid_children.sh $PID)
