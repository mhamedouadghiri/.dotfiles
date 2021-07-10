# general

function mkcd() { mkdir -p -- "$1" && cd -P -- "$1"; }

alias ls='ls --color'
alias la='ls -Alh'

alias cd-='cd -'
alias cd..='cd ..'
alias ..='cd ..'
alias .2='cd ../..'
alias ...='cd ../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

alias mv='mv -i'
alias rm='rm -I -v'

alias update='sudo -- sh -c "apt update && apt -y upgrade"'

alias shut='sudo shutdown now'
alias restart='sudo shutdown now -r'

alias ipa='ip -c a'

alias vi='vim'

# cloud stuff 

alias d='docker'

dkrm() { docker rm $(docker ps -aq); }
dkrmid() { docker rmi $(docker images --filter dangling=true -q); }
dkb() { docker build -t "$1" .;}

alias dkrd='docker run -d'
alias dkrit='docker run -it'

alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dki='docker images'

#k kubectl defined in .bashrc with proper completion
