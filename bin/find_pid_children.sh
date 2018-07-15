#!/bin/sh
# Utility to find all threads and processes children of the PID
#
# (2017) Giuseppe Ursino
#

#set -x

SCRIPTNAME=`basename $0`
DATE=`date +%Y%m%d`

usage() {

echo "Utility to find all threads and processes children of the PID as argument"
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

PID_IN=$1

## MAIN

[ -d "/proc/$PID_IN/task" ] || exit 1

PID_LIST=
findpids() {
	[ -d /proc/$1/task ] || return
    for pid in /proc/$1/task/* ; do
            pid="$(basename "$pid")"
            PID_LIST="$PID_LIST$pid "
            for cpid in $(cat /proc/$1/task/$pid/children) ; do
                    findpids $cpid
            done
    done
}

findpids $PID_IN
echo $PID_LIST
