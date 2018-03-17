#!/bin/bash
# Utility che permette di montare il filesystem di ursinosrv tramite SSH in una cartella a scelta, passata via parametro

#set -x

INPUT=$1

function help(){
	echo "Utility che permette di montare il filesystem di ursinosrv tramite SSH in una cartella a scelta"
	echo "Uso:"
	echo " `basename $0` <dest>"
	exit 1
}

[[ ${INPUT} == "" ]] && help

[[ ! -d ${INPUT} ]] && help



sshfs root@ursinosrv:/ ${INPUT} -p 2424
