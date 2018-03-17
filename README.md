# shellursino

## Pre-requisiti
### Installare Oh-my-zsh
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
# logout / login

```

## Installazione
```
sudo apt-get install git git-crypt
cd $HOME

git init
git remote add origin git@github.com:giursino/shellursino.git
git fetch
[
  git reset origin/master  # this is required if files in the non-empty directory are in the repo
  git checkout -t origin/master
]
# Questi due ultimi comandi non hanno funzionato, ho usato
git reset --hard
git checkout

git branch --set-upstream-to=origin/master master

# Poi si deve sbloccare il repo
git-crypt unlock <CHIAVE>

# Verificare di aver accessibili le chiavi SSH:
cat .ssh/id-rsa

# Verificare permessi 600 della cartella e chiavi SSH
chmod 600 /home/giursino/.ssh/id_rsa

# Verifica connessione github
ssh -T git@github.com

```

## Criptare file
Questo è utile per caricare su git pubblico anche i file contenenti password
### Prima volta
```
git-crypt init
touch .gitattributes
```
Modificare il file .gitattributes con l'elenco dei file da criptare, esempio:
```
# per evitare di icludere se stesso
.gitattributes !filter !diff

# qualsiasi file con estensione key
*.key filter=git-crypt diff=git-crypt

# tutte le chiavi standard di OpenSSH
id_rsa* filter=git-crypt diff=git-crypt
```

Per vedere i file che sono criptati:
```
git-crypt status -e
```
### Le volte successive
Basta modificare il file `.gitattributes` con l'elenco dei files che saranno committati criptati e poi verificare con il comando `git-crypt status -e` se compaiono tra la lista dei file criptati


