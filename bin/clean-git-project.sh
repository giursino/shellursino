#!/bin/sh
echo "Vuoi davvero ripristinare l'ultimo commit del repository locale?"
echo "Attenzione: verranno cancellati tutti i files non versionati"
echo "Premi INVIO per continuare (o CTRL+C per uscire)"
read enter
git reset --hard
git clean -Xf
git clean -df
