#!bin

# PDF Mod
add-apt-repository ppa:pdfmod-team/ppa
apt-get update
apt-get install pdfmod

# Libre Office
apt-get remove openoffice*.*
add-apt-repository ppa:libreoffice/ppa
apt-get update
apt-get install libreoffice
apt-get install libreoffice-gnome
apt-get install language-support-de

# VLC
add-apt-repository ppa:n-muench/vlc
apt-get update && apt-get install vlc -y

# JDownLoader Faenza Theme
# http://gnome-look.org/CONTENT/content-files/140138-Faenza-for-jdownloader.rar

# ZSH
# https://github.com/robbyrussell/oh-my-zsh


