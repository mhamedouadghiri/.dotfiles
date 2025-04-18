function mkcd() { mkdir -p -- "$1" && cd -P -- "$1"; }

function idea() { nohup idea.sh "$@" > /dev/null 2>&1 & }

function pycharm() { nohup pycharm.sh "$@" > /dev/null 2>&1 & }

#function clion() { nohup clion.sh "$@" > /dev/null 2>&1 & }

function goland() { nohup goland.sh "$@" > /dev/null 2>&1 & }

function studio() { nohup studio.sh "$@" > /dev/null 2>&1 & }

function postman() { nohup Postman "$@" > /dev/null 2>&1 & }

function gclone() { git clone git@github.com:mhamedouadghiri/$1 ; }

function dcompdir() {
    docker container inspect "$1" --format '{{ json .Config.Labels }}' | jq -r '.["com.docker.compose.project.working_dir"]'
}
_dcompdir_complete() {
    local containers
    containers=$(docker ps --format '{{.Names}}')
    COMPREPLY=($(compgen -W "$containers" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _dcompdir_complete dcompdir

function dcompfile() {
    docker container inspect "$1" --format '{{ json .Config.Labels }}' | jq -r '.["com.docker.compose.project.config_files"]'
}
_dcompfile_complete() {
    local containers
    containers=$(docker ps --format '{{.Names}}')
    COMPREPLY=($(compgen -W "$containers" -- "${COMP_WORDS[1]}"))
}
complete -F _dcompfile_complete dcompfile

function dcompdown() {
    local compose_file
    compose_file=$(dcompfile "$1")
    if [[ -n "$compose_file" ]]; then
        docker compose -f "$compose_file" down
    else
        echo "Compose file not found for container: $1"
    fi
}
_dcompdown_complete() {
    local containers
    containers=$(docker ps --format '{{.Names}}')
    COMPREPLY=($(compgen -W "$containers" -- "${COMP_WORDS[1]}"))
}
complete -F _dcompfile_complete dcompdown

function 2pdf() { a2ps -B $1 -o- | ps2pdf - $1.pdf ; }

function pdfnup() {
    if [ $# -eq 4 ]; then
        pdfjam $1 -o $2 --nup $3 --landscape
    else
        pdfjam $1 -o $2 --nup $3
    fi
}

notify() {
    time "$@"
    exit_code=$?
    if [ $exit_code -eq 0 ]; then
        notify-send "✅ Command Succeeded" "The command '$*' completed successfully."
    else
        notify-send "❌ Command Failed" "The command '$*' exited with code $exit_code."
    fi
}

function b64enc() { echo -n "$1" | base64 ; }

function b64dec() { echo -n "$1" | base64 -d ; }

alias ls='ls --color'
alias la='ls -Alh'

alias c='clear'

alias e='exit'

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
alias copy='xclip -in -selection clipboard'
alias paste='xclip -out -selection clipboard'

alias rm='rm -I'
alias rmv='rm -I -v'

alias update='sudo -- sh -c "apt update && apt -y upgrade"'
alias aptrm='sudo -- sh -c "apt -y autoremove && apt -y autoclean"'

alias shut='shutdown now'
alias restart='shutdown now -r'
alias hiber='systemctl hibernate'
alias sus='systemctl suspend'

alias ipa='ip -c a'
alias netgrep='netstat -tulpn | grep '
alias snetgrep='sudo netstat -tulpn | grep '
alias myip='ip a | egrep inet.*wlo | cut -d" " -f6 | cut -d/ -f1'
alias mypubip='curl ifconfig.me && echo'

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

alias watch1='watch -n1 '
alias watchn='watch -n'

alias gf='git fetch'
alias gs='git status'
alias gp='git pull'
alias gpom='git push origin master'
alias gpomf='git push origin master --force'
alias gpomt='git push origin master --tags'
alias gpomtf='git push origin master --tags --force'
alias gd='git diff '
alias ga='git add .'
alias gc='git commit -S -m '
alias gca='git commit -S --amend --no-edit'
alias gaca='ga && gca'
alias gpof='git push origin --force '
alias gl='git log'
alias gln='git log -n'
alias gln1='git log -n1'
alias gln2='git log -n2'
alias gln3='git log -n3'
alias gpob='git push origin "$(git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")"'
alias gpobf='gpob --force'
alias gcpf='gaca && gpobf'
alias gstash='git stash push --include-untracked -m '

gt() { git tag -s "$1" -m "$2" "${@:2}"; }

alias sl='ls'
alias al='la'
alias shit='shut'
alias cD='cd'

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

alias kgaa='kubectl get all -A'
alias wkgaa='watch -n1 kubectl get all -A'

alias kubectx='kubectl ctx'
alias kubens='kubectl ns'

alias k9s='docker run --network host --rm -it -v ~/.kube/config:/root/.kube/config quay.io/derailed/k9s -A'
