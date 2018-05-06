#!/bin/bash

function stop-calibre {
	echo "ATTENZIONE: questo script non può essere eseguito se Calibre è avviato!"
	exit 1
}

echo "Controllo assenza Calibre..."
pgrep -x calibre && stop-calibre

echo "Inizio la sincronizzazione..."
rsync -av --delete -e ssh $HOME/Biblioteca/ "giursino@nasgg::ebook/Romanzi/Biblioteca di Calibre - READ ONLY/"
