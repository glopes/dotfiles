##################################
# Vagubunt's .bashrc
# http://vagubunt.wordpress.com
#
# zuletzt geaendert am: 21.12.2010
#
# Backup der alten .bashrc:
# cp ~/.bashrc ~/.bashrc.backup
##################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# aktiviert die Completion Features
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

##################################

# HISTORY

# wieviele Einträge soll die History speichern?
export HISTFILESIZE=500

# Duplikate ignorieren
export HISTCONTROL=ignoredups

# Aufeinanderfolgende Einträge ignorieren
export HISTCONTROL=ignoreboth

##################################

# SCREEN

# Checkt die Fenstergröße nach jedem Befehl und updatet die Anzahl Zeilen und Spalten
# shopt -s checkwinsize

# bessere Ausgabe mit less
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Farben definieren
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # farblos

# PROMPT
#PS1="${DARKGRAY}\@ ${LIGHTGRAY}\u${DARKGRAY} : ${WHITE}\w \n${LIGHTGRAY}$ ${NC}"
PS1="${WHITE}\t \w ${LIGHTGRAY}$ ${NC}"


# backslash-escape special characters
# http://www.hypexr.org/bash_tutorial.php
# Symbole:
# \t = Zeit
# \u = aktueller User
# \h = Rechnername
# \W = Verzeichnis
# \n = neue Zeile

##################################

# ALIASES

# Mit Aliases kannst du Befehle bzw. Befehlsketten mit eigenen Namen belegen. Falls du z.B. willst, dass wenn du im Terminal ls eingibst, automatisch ls -a ausgeführt wird, schreibst du hier einen alias ls='ls -

# ls Befehle neu definiert
alias la='ls -Al'               # zeige versteckte Dateien in einer Liste
alias ll="ls -l --group-directories-first" # ls als Liste, Verzeichnisse ganz oben
alias ls='ls -aF --color=always' # Farbige Liste + Dateiendungen anzeigen
alias lx='ls -lXB'              # Sortierung nach Endung
alias lk='ls -lSr'              # Sortierung nach Grösse
alias lc='ls -lcr'           # Sortierung nach Änderungsdatum   
alias lu='ls -lur'           # Sortierung nach letztem Zugriff
alias lt='ls -ltr'              # Sortierung nach Datum
alias lm='ls -al |more'         # ls mit more (scrollbar)
alias lr='ls -lR |more'         # Rekursive Liste mit more (scrollbar)
# Für Tree noch sudo apt-get install tree
alias tree='tree -Csu|more'     # Alternative zum rekursiven ls

# Zur Sicherheit mit Abfrage, bevor überschrieben wird
alias del='mv --target-directory=/home/$USER/.Trash/'
alias rm='rm -iV'
alias cp='cp -iV'
alias mv='mv -iV'

# Krams

alias open='gnome-open'        # "open datei" öffnet datei mit dem Gnome-Standardprogramm
alias pg='ps aux | grep'      # Prozess greppen -> pg name
alias h='history'        # BASH Befehlshistory
alias which='type -a'        # Dateityp?
alias du='du -kh --max-depth=1' # lesbarer Output
alias df='df -kTh'        #    ^       ^
alias ps='ps auxf'
alias home='cd ~'
alias un='tar -zxvf'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias ebrc='leafpad ~/.bashrc' # hier leafpad mit dem Editor deiner Wahl ersetzen, z.B. gedit oder vim

# Verzeichnisnavigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# chmod Befehle
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

# apt-get Shortcuts
alias ags='apt-cache search'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agg='sudo apt-get upgrade'
alias sources='gksudo gedit /etc/apt/sources.list'

# SSH Server
alias einserver='ssh ei.ne.server.ip -l root'

# Bashscripts aliases

# Alias für den Touchpadfix
alias tpfix='sh /home/$USER/touchpad.sh'

##################################

# Begrüssung

clear
echo -e "${LIGHTGRAY}BASH Version ${LIGHTGREEN}${BASH_VERSION%.*}${LIGHTGRAY}";
#echo -e "Vagubunt's .bashrc ${LIGHTGREEN}geladen${NC}${LIGHTGRAY}...";
echo -e "$USER's .bashrc ${LIGHTGREEN}geladen${NC}${LIGHTGRAY}...";
echo -e " ";
echo -ne "Hallo $USER, heute ist ${LIGHTGREEN}"; date;
echo -e "${LIGHTGRAY}Kernel Information: ${LIGHTGREEN}" `uname -or`;
echo -e "${NC}";

##################################

# Funktionen

# Eine Datei finden (Benutzung: ff datei)
function ff() { find . -type f -iname '*'$*'*' -ls; }

function swap()  # Vertauscht 2 Dateinamen, falls sie existieren
{                #(from Uzi's bashrc).
 local TMPFILE=tmp.$$ 

 [ $# -ne 2 ] && echo "swap: 2 Dateien benötigt!" && return 1
 [ ! -e $1 ] && echo "swap: $1 existiert nicht!" && return 1
 [ ! -e $2 ] && echo "swap: $2 existiert nicht!" && return 1

 mv "$1" $TMPFILE
 mv "$2" "$1"
 mv $TMPFILE "$2"
}

function extract()      # "extract Datei" extrahiert alle unten definierten Verzeichnisse
 # credits: urukrama, Ubuntuforums.org   
{
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xvjf $1     ;;
 *.tar.gz)    tar xvzf $1     ;;
 *.bz2)       bunzip2 $1      ;;
 *.rar)       unrar x $1      ;;
 *.gz)        gunzip $1       ;;
 *.tar)       tar xvf $1      ;;
 *.tbz2)      tar xvjf $1     ;;
 *.tgz)       tar xvzf $1     ;;
 *.zip)       unzip $1        ;;
 *.Z)         uncompress $1   ;;
 *.7z)        7z x $1         ;;
 *)           echo "'$1' kann nicht mit extract entpackt werden!" ;;
 esac
 else
 echo "'$1' ist keine gültige Datei!"
 fi
}

clock ()     # Uhr im Terminal
{
while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}
