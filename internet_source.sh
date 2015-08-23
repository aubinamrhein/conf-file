#!/bin/bash -eu

rm --force --recursive $HOME/src
mkdir --parents $HOME/src
pushd $HOME/src >/dev/null 2>&1
git clone https://github.com/powerline/powerline.git 
popd > /dev/null 2>&1
