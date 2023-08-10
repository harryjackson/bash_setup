

# https://superuser.com/questions/585003/searching-through-history-with-up-and-down-arrow-in-zsh
bindkey -v
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

VALIAS=$HOME/.valias

PROMPT='%2~ %# '
PROMPT='%B%F{240}%1~%f%b %# '
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
export PS1

# brew install keychain
eval `keychain --eval --agents ssh id_rsa`
#/usr/bin/keychain $HOME/.ssh/id_rsa
if [ -r $VALIAS ]
then
    source $VALIAS
else
    source ~/.valias
fi

export EDITOR="vim"

# history stuff
HISTFILE=~/.zsh-histfile

