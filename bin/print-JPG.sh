#!/bin/bash
# print the list of only jpg files (not in 'Originals' path)
# arg1 = path
#set -x

if [ "$1" == '' ]; then
	echo $0 [PATH]
	exit
fi

TMPFILE=`mktemp`

find "$1" -type f -not \( -ipath "*originals*" \) -and \( -name "*.jpg" -or -name "*.JPG" \) -fprintf "$TMPFILE" "%k\\t%p\\n"

cat $TMPFILE | awk 'BEGIN {FS="\t";} {s+=$1; print $2}; END {print "\n"; print "Total size:"; print "-----------"; print s}'

rm $TMPFILE

exit

#----- COPY
SRC=/tmp/src
DEST=/tmp/dst
find "$SRC" -type f -not \( -ipath "*originals*" \) -and \( -name "*.jpg" -or -name "*.JPG" \) -exec cp --parents -av {} $DEST \;
