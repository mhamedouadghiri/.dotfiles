function mkcd() { mkdir -p -- "$1" && cd -P -- "$1"; }

function idea() { nohup idea.sh "$@" > /dev/null 2>&1 & }

function gclone() { git clone git@github.com:mhamedouadghiri/$1 ; }

alias ls='ls --color'
alias la='ls -Alh'

alias c='clear'

alias cd-='cd -'
alias cd..='cd ..'
alias ..='cd ..'
alias .2='cd ../..'
alias ...='cd ../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

alias mv='mv -i'

alias cpc="xclip -sel c < "

alias rm='rm -I'
alias rmv='rm -I -v'

alias update='sudo -- sh -c "apt update && apt -y upgrade"'

alias shut='shutdown now'
alias restart='shutdown now -r'

alias ipa='ip -c a'

alias vi='vim'
alias python='python3'

alias b='browse .'
alias o='xdg-open'

alias dushc='du -shc * | sort -h'
alias dushc.='du -shc .[!.]* * | sort -h'

alias gf='git fetch'
alias gs='git status'
alias gp='git pull'
alias gpom='git push origin master'
alias gd='git diff '
alias ga='git add .'
alias gc='git commit -m '

alias sl='ls'
alias al='la'

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
export dry='--dry-run=client -oyaml'
export fgp='--force --grace-period=0'

