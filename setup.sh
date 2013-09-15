#!/bin/bash

setup_vim () {
	echo "Creating vim structure ..."
	# autoload - Scripts qui vont être chargés au démarrage, avant le fichier ~/.vimrc .
	# colors - Scripts appelés par la commande colorscheme permettant de charger un jeu de couleur.
	# syntax - Scripts gérant la colorisation syntaxique pour un fichier donné sous la forme type_de_fichier.vim .
	# plugin - Stockage des plugins de vim.
	# speel - Dictionnaire orthographique.
	# config - Contient des bouts de .vimrc .
	# More information in help runtimepath .

	cd # home directory user

	# Create folder
	[[ -d .vim/ ]] || mkdir .vim
	#[[ -d .vim/autoload ]] && || ln -s ${script_path}/vim/autoload .vim/autoload
	#[[ -d .vim/colors ]] && mkdir -p .vim/colors || ln -s ${script_path}/vim/colors .vim/colors
	#[[ -d .vim/syntax ]] && mkdir -p .vim/syntax || ln -s ${script_path}/vim/syntax .vim/syntax
	#[[ -d .vim/plugin ]] && mkdir -p .vim/plugin || ln -s ${script_path}/vim/plugin .vim/plugin
	#[[ -d .vim/speel ]] && mkdir -p .vim/speel || ln -s ${script_path}/vim/speel .vim/speel
	[[ -d .vim/config ]] && echo "=== warning === .vim/config exist already" >&2  || ln -s ${script_path}/vim/config .vim/config 

	[[ -f .vimrc ]] && echo "=== warning === .vimrc exist already" >&2 || ln -s ${script_path}/vim/vimrc .vimrc
	echo "Creating vim structure done."
}

save_origin_path=$(pwd) # Save the current path.
script_path=$(realpath $0)
script_path=$(dirname ${script_path}) # Where script is.
setup_vim
