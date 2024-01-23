#!/bin/bash

VALIAS=$HOME/.valias
touch $VALIAS
alias reload="source $HOME/.bash_profile"
alias valias="vim $HOME/.valias && reload"

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
