#!/bin/bash
# Riduce la dimensione di un video in Full HD registrato da Reflex NIKON
#set -x

INPUT=$1

BASENAME=${INPUT%\.*}
EXTENSION=${INPUT##*.}

OUTPUT=${BASENAME}_resized.avi


RESIZE="960x540"
BITRATE_V="19000k"
BITRATE_A="192k"


function help(){
	echo "Riduce la dimensione di un video in Full HD registrato da Reflex NIKON"
	echo "Uscita: ${RESIZE}, video bitrate=${BITRATE_V}, audio bitrate=${BITRATE_A}"
	echo "Uso:"
	echo " `basename $0` <filename>"
	exit 1
}

[[ ${INPUT} == "" ]] && help

avconv -i ${INPUT} -b ${BITRATE_V} -b:a ${BITRATE_A} -s ${RESIZE} ${OUTPUT}

