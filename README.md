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
git clone git@github.com:giursino/shellursino.git
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


