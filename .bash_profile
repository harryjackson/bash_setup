#!/bin/bash
VALIAS=$HOME/.valias
PS1='\h:\W harry\$ '
export PS1
eval `keychain --eval --agents ssh id_rsa`
#/usr/bin/keychain $HOME/.ssh/id_rsa
if [ -r $VALIAS ]
then
    source $VALIAS
else
    source ~/.valias
fi

export EDITOR=vim
