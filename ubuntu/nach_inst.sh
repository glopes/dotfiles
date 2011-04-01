#!bin

# Cli Companion
add-apt-repository ppa:clicompanion-devs/clicompanion-nightlies
apt-get update && apt-get install clicompanion -y

# Orta Theme
add-apt-repository ppa:nikount/orta-desktop
apt-get update && apt-get install orta-theme -y

# Faenza Icons
add-apt-repository ppa:tiheum/equinox
apt-get update && apt-get install faenza-icon-theme -y

# Nautilus Elementary
add-apt-repository ppa:am-monkeyd/nautilus-elementary-ppa
apt-get update && apt-get dist-upgrade
killall nautilus && nautilus &
# nautilus -q

# Ubuntu Tweak
add-apt-repository ppa:tualatrix/ppa
apt-get update && apt-get dist-upgrade
apt-get install ubuntu-tweak -y

# Vim 
# 2.7.2.130
# add-apt-repository ppa:vim-full/ppa
# 2.7.3.035
add-apt-repository ppa:hackedbellini/vim
apt-get update
apt-get install vim -y
# http://svenseidel.net/blog/2010/vim-version-7-3-veroffentlicht/

# GMate
apt-add-repository ppa:ubuntu-on-rails/ppa
apt-get update && apt-get install gedit-gmate

# PDF Mod
# add-apt-repository ppa:pdfmod-team/ppa
# apt-get update
# apt-get install pdfmod

# Libre Office
# apt-get remove openoffice*.*
# add-apt-repository ppa:libreoffice/ppa
# apt-get update
# apt-get install libreoffice
# apt-get install libreoffice-gnome
# apt-get install language-support-de

# JDownLoader Faenza Theme
# http://gnome-look.org/CONTENT/content-files/140138-Faenza-for-jdownloader.rar

# ZSH
# https://github.com/robbyrussell/oh-my-zsh


