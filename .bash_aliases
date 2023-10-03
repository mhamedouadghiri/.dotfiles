function mkcd() { mkdir -p -- "$1" && cd -P -- "$1"; }

function idea() { nohup idea.sh "$@" > /dev/null 2>&1 & }

function clion() { nohup clion.sh "$@" > /dev/null 2>&1 & }

function goland() { nohup goland.sh "$@" > /dev/null 2>&1 & }

function postman() { nohup Postman "$@" > /dev/null 2>&1 & }

function gclone() { git clone git@github.com:mhamedouadghiri/$1 ; }

function 2pdf() { a2ps -B $1 -o- | ps2pdf - $1.pdf ; }

function pdfnup() {
    if [ $# -eq 4 ]; then
        pdfjam $1 -o $2 --nup $3 --landscape
    else
        pdfjam $1 -o $2 --nup $3
    fi
}

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

alias pcd='pwd | rev | cut -d/ -f1 | rev'

alias mv='mv -i'

alias cpc="xclip -sel c < "

alias rm='rm -I'
alias rmv='rm -I -v'

alias update='sudo -- sh -c "apt update && apt -y upgrade"'
alias aptrm='sudo -- sh -c "apt -y autoremove && apt -y autoclean"'

alias shut='shutdown now'
alias restart='shutdown now -r'

alias ipa='ip -c a'
alias netgrep='netstat -tulpn | grep '
alias snetgrep='sudo netstat -tulpn | grep '

alias psgrep='ps aux | grep '

alias vi='vim'
alias python='python3'
alias ff='firefox'

alias b='browse .'
alias o='xdg-open'

alias pdfmerge='pdftk *.pdf cat output '

alias igrep='grep -i'
alias vgrep='grep -v'
alias ivgrep='grep -i -v'

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
alias shit='shut'
alias cD='cd'

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


# N7
alias cdns="cd /home/mhamed/n7/a3"
alias smpirun="smpirun -hostfile /home/mhamed/n7/a3/mpi/_archis/cluster_hostfile.txt -platform /home/mhamed/n7/a3/mpi/_archis/cluster_crossbar.xml"

