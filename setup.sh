#!/bin/bash -eu
PATH_DIR=$(dirname $0)

vim_configuration_setup () {
  echo "$FUNCNAME"

  #######################
  # Copying all sources #
  #######################
  if [[ -d ${HOME}/.vim ]] ; then
    echo "Please remove your directory ${HOME}/.vim" >&2
    return 1
  else
    cp -r ${PATH_DIR}/vim ${HOME}/.vim
  fi

  #######################
  # Symbolic link .vimrc #
  ########################
  if [[ -e ${HOME}/.vimrc ]] ; then
    rm -fr ${HOME}/.vim
    echo "Please remove your file ${HOME}/.vimrc" >&2
    return 1
  else
    ln -s ${HOME}/.vim/vimrc ${HOME}/.vimrc
  fi
}
vim_configuration_setup
