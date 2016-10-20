#!/bin/bash -eu

function usage(){
cat <<EOF


---------------------------------------------------------------------
 Installing and configuring jessie distribution
---------------------------------------------------------------------

Verion 0.1


EOF
exit 1
}

function insert_line_file(){
local line="$1"
local file="$2"
grep -q "$line" "$file" || echo "$line" >> "$file"
}

function banner(){
cat <<EOF
---------------------------------------------------------------------
        Welcome, configuring distribution
---------------------------------------------------------------------
EOF
}

function jessie_check(){
echo "checking script is executing on Jessie distribution: need implement $FUNCNAME"
}

function builtin_check(){
echo "checking builtin $1 is present: need implement $FUNCNAME"
}

function check(){
cat <<EOF
---------------------------------------------------------------------
  Checking...
---------------------------------------------------------------------
EOF
jessie_check
builtin_check sudo
}


function install_package(){
sudo apt-get install --auto-remove --assume-yes --verbose-versions --show-progress "$1"
}

function system_configuration(){
cat <<EOF
---------------------------------------------------------------------
  Installing and configuring package for system...
---------------------------------------------------------------------
EOF
install_package i3 		# metapackage (i3 window manager, screen locker, menu, statusbar)
install_package vim-nox 	# Vi IMproved - enhanced vi editor - with scripting languages support
install_package powerline 	# prompt and statusline utility
insert_line_file '. /usr/share/powerline/bindings/bash/powerline.sh' "$HOME/.bashrc"
insert_line_file 'set laststatus=2 " Always display the statusline in all windows.' "$HOME/.vimrc"
insert_line_file 'set showtabline=2 " Always display the tabline, even if there is only one tab.' "$HOME/.vimrc"
insert_line_file 'set noshowmode " Hide the default mode text (--insert -- below the statusline)' "$HOME/.vimrc"
install_package realpath 	# coreutils realpath transitional package
install_package libreoffice 	# office productivity suite (metapackage)
install_package lynx		# Navigateur web léger en mode texte (paquet de transition)
install_package iceweasel	# Web browser based on Firefox - Transitional package
install_package apt-rdepends 	# Énumérer de manière récursive les dépendances d'un paquet
}

function vcs_configuration(){
cat <<EOF
---------------------------------------------------------------------
  Installing and configuring package for version control system...
---------------------------------------------------------------------
EOF
install_package git 		# système de gestion de versions distribué, rapide et évolutif
install_package gitk 		# système de contrôle de version distribué, robuste et rapide (visionneur de l'arbre des révisions)
install_package git-doc 	# fast, scalable, distributed revision control system (documentation)
install_package tig		# Interface pour Git en mode texte basée sur ncurses
}

function dev_configuration(){
cat <<EOF
---------------------------------------------------------------------
  Installing and configuring package for developement...
---------------------------------------------------------------------
EOF
install_package shellcheck 	# lint tool for shell scripts
install_package astyle 		# Source code indenter for C, C++, Objective-C, C#, and Java
install_package pylint 		# Python code static checker and UML diagram generator
install_package make 		# utilitaire pour mener la compilation
install_package gcc 		# compilateur C GNU

# git-email ..??

#git-all # système de gestion de versions distribué, rapide, et évolutif - méta-paquet
}
create_skeleton(){
cat <<EOF
---------------------------------------------------------------------
  Creating skeleton...
---------------------------------------------------------------------
EOF
mkdir --parents --verbose /local/src || true
mkdir --parents --verbose /local/dev || true
mkdir --parents --verbose /local/bin || true
mkdir --parents --verbose /local/pkg || true
}

function main(){
banner
check
create_skeleton
system_configuration
vcs_configuration
dev_configuration
}

main
usage
