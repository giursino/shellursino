#!/bin/sh
rsync -av --delete -e ssh $HOME/Biblioteca/ "giursino@nasgg::ebook/Romanzi/Biblioteca di Calibre - READ ONLY/"
