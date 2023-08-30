# https://superuser.com/questions/585003/searching-through-history-with-up-and-down-arrow-in-zsh
bindkey -v
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

VALIAS=$HOME/.valias
alias reload="source $HOME/.zshrc"
alias valias="vim $HOME/.valias && reload"

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
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
  export LOCAL_IP_ADDR=$(ipconfig getifaddr en0);
else
  export LOCAL_IP_ADDR=$(hostname -I|awk '{print $1}')
fi

#/etc/hosts editing
export SSP_VAULT_HOST="vault.ssp"
export SSP_CONFIG_HOST="config.ssp"
export SSP_ADMIN_HOST="admin.ssp"
export SSP_GATEWAY_HOST="gateway.ssp"
export SSP_DISCOVER_HOST="discover.ssp"
export SSP_TOOL_HOST="tool.ssp"
export SSP_SERVICE_HOST="service.ssp"
export SSP_EUREKA_DEFAULT_ZONE="http://$LOCAL_IP_ADDR:8761/eureka/"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

function resetip() {
    export LOCAL_IP_ADDR=$(ipconfig getifaddr en0);
    perl -pi -e "s/(.*)vault.ssp/$LOCAL_IP_ADDR vault.ssp/ if /vault.ssp/" /etc/hosts
    perl -pi -e "s/(.*)config.ssp/$LOCAL_IP_ADDR config.ssp/ if /config.ssp/" /etc/hosts
    perl -pi -e "s/(.*)discover.ssp/$LOCAL_IP_ADDR discover.ssp/ if /discover.ssp/" /etc/hosts
    perl -pi -e "s/(.*)admin.ssp/$LOCAL_IP_ADDR admin.ssp/ if /admin.ssp/" /etc/hosts
    perl -pi -e "s/(.*)gateway.ssp/$LOCAL_IP_ADDR gateway.ssp/ if /gateway.ssp/" /etc/hosts
    perl -pi -e "s/(.*)tool.ssp/$LOCAL_IP_ADDR tool.ssp/ if /tool.ssp/" /etc/hosts
    perl -pi -e "s/(.*)service.ssp/$LOCAL_IP_ADDR service.ssp/ if /service.ssp/" /etc/hosts
}
# sudo requires interactive zsh shell in order to get the $VARIABLES
sudo zsh -c "$(functions); resetip"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export SPRING_CLOUD_VAULT_TOKEN=00000000-0000-0000-0000-000000000000
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=$SPRING_CLOUD_VAULT_TOKEN
export VAULT_LOG_LEVEL=debug
export ENCRYPT_KEY=$SPRING_CLOUD_VAULT_TOKEN
export SSP_CONFIG_SERVER="http://$LOCAL_IP_ADDR:8888/"
export SSP_ADMIN_SERVER="http://$LOCAL_IP_ADDR:8081"
export SSP_EUREKA_SERVER="http://$LOCAL_IP_ADDR:8761/eureka"
export SSP_DISCOVER_SERVER="http://$LOCAL_IP_ADDR:8761/eureka"
