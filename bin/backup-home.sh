#!/bin/bash

function stop-eclipse {
	echo "ATTENZIONE: questo script non può essere eseguito se Eclipse è avviato!"
	exit 1
}

echo "Controllo assenza Eclipse..."
pgrep -x eclipse && stop-eclipse

echo "Inizio la sincronizzazione..."
rsync -av --delete --exclude=Foto -e ssh \
	$HOME/Workspace \
	$HOME/Immagini \
	$HOME/Pubblici \
	$HOME/Scaricati \
	$HOME/VirtualBox \
	"giursino@nasgg::home"
	
echo "Done."
