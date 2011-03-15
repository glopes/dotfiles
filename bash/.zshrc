#
#    vagubunt's .zshrc
#    http://vagubunt.wordpress.com
#    

##### ENVIRONMENT

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
export EDITOR=vim
export PAGER=less
export BROWSER=links
export LESS=-cex3M
export HELPDIR=/usr/local/lib/zsh/help
export TERM=rxvt

LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS
eval `dircolors -b`

bindkey -e # Emacs Tastatursteuerung

# Vertippt? Correction aktivieren :)
setopt correctall

setopt autopushd pushdminus pushdsilent pushdtohome
setopt autocd
setopt cdablevars
setopt ignoreeof
setopt interactivecomments
setopt nobanghist
setopt noclobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup
setopt NO_CASE_GLOB # Globbing ist nicht mehr casesensitive
setopt EXTENDED_GLOB
setopt ZLE

##### COMPLETION

# die Completion aktivieren
autoload -U compinit
compinit

# Completion Style
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _complete _correct _approximate _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete

##### History

# Anzahl der History-Einträge, Speicherort und explizite Anweisung zum Speichern
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

##### PROMPT

# %T    System time (HH:MM)
# %*    System time (HH:MM:SS)
# %D    System date (YY-MM-DD)
# %n    Your username
# %B - %b    Begin - end bold print
# %U - %u    Begin - end underlining
# %d    Your current working directory
# %~    Your current working directory, relative to ~
# %M    The computer's hostname
# %m    The computer's hostname (truncated before the first period)
# %l    Your current tty

PROMPT=$' %{\e[0;34m%}%T %{\e[0;35m%}%~ %{\e[0m%}%# '
RPROMPT=$'%{\e[0;35m%} %n@%m %{\e[0m%}'

##### WINDOW TITLE

case $TERM in
 *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
 precmd () { print -Pn "\e]0;zsh %~\a" }
 preexec () { print -Pn "\e]0;zsh %~ ($1)\a" }
 ;;
 screen)
 precmd () {
 print -Pn "\e]83;title \"$1\"\a"
 print -Pn "\e]0;$TERM - (%L) zsh %~\a"
 }
 preexec () {
 print -Pn "\e]83;title \"$1\"\a"
 print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
 }
 ;;
esac

##### Aliases

# Dateiendungen automatisch mit dem jeweiligen Programm öffnen
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$EDITOR
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR

# L ist das gleiche wie |less, sprich ls L xyz ist gleich ls |less xyz
alias -g L='|less'
# das gleiche bei G
alias -g G='|grep'
alias f='find |grep'
alias c="clear"
alias dir='ls -1'
alias gvim='gvim -geom 82x35'
alias mpg123='mpg123 -o oss'
alias mpg321='mpg123 -o oss'

# Befehle neu definiert

alias la='ls -a'                # zeige auch versteckte Dateien
alias lsa='ls -ld .*'            # zeige nur versteckte Dateien
alias ll="ls -l --group-directories-first" # ls als Liste, Verzeichnisse ganz oben
alias ls='ls -aF --color=always' # Farbige Liste + Dateiendungen anzeigen
alias lx='ls -lXB'              # Sortierung nach Endung
alias lk='ls -lSr'              # Sortierung nach Grösse
alias lc='ls -lcr'               # Sortierung nach Änderungsdatum   
alias lu='ls -lur'               # Sortierung nach letztem Zugriff
alias lt='ls -ltr'              # Sortierung nach Datum
alias lm='ls -al |more'         # ls mit more (scrollbar)
alias lr='ls -lR |more'         # Rekursive Liste mit more (scrollbar)
alias lg='ls | grep '           # ls im lokalen Verzeichnis mit grep

alias mv='nocorrect mv'       # Keine TypoKorrektur
alias cp='nocorrect cp'       #     ^        ^
alias mkdir='nocorrect mkdir' #     ^        ^

# Krams

alias o='gnome-open'        # "o datei" öffnet datei mit dem Gnome-Standardprogramm
alias pg='ps aux | grep'      # Prozess greppen -> pg name
alias h='history'            # zsh Befehlshistory
alias du='du -kh --max-depth=1' # lesbarer Output
alias df='df -kTh'                #    ^       ^
alias ps='ps auxf'
alias da='date "+%Y-%m-%d %A"'
alias ez='leafpad ~/.zshrc' # .zshrc bearbeiten // hier leafpad mit dem Editor eurer Wahl ersetzen, z.B. gedit oder vim
alias x='exit'

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

##### FUNCTIONS

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

#

function extract()      # "extract Datei" extrahiert alle unten definierten Verzeichnisse
 # Credits: urukrama, Ubuntuforums.org   
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

# Falls die TAB-Completion lange dauert, währenddessen Punkte anzeigen :)
expand-or-complete-with-dots() {
 echo -n "\e[31m......\e[0m"
 zle expand-or-complete
 zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
