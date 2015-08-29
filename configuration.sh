#!/bin/bash -eu

# install sudo and configure it before launching this scripts.

user_dependence(){
 sudo apt-get --quiet --assume-yes install \
 git\
 vim\
 realpath\
 apt-rdepends\
 tmux\
 tig\
 gitk\
 lynx\
 iceweasel\
 w3m\
 meld\
 libreoffice\
 python-pypcap
}

powerline_install(){
powerline_dependence
if [[ -d $HOME/src/powerline/ ]] ; then
 pushd $HOME/src/powerline/
 sudo python setup.py install
 popd
else
 echo "$HOME/src/powerline not found" >&2
fi
}

powerline_dependence (){
 sudo apt-get --quiet --assume-yes install \
 python-setuptools\
 socat\
 python-psutil 
}


delete_previous_install(){
 rm --recursive --force $HOME/work/ || true
 rm --recursive --force $HOME/dev/ || true
 rm --recursive --force $HOME/bin || true
}

 
create_skeleton(){
 mkdir --parents $HOME/work/
 mkdir --parents $HOME/dev/
 mkdir --parents $HOME/bin/
}

main(){
 delete_previous_install
 user_dependence
 create_skeleton
 powerline_install
}


main
