alias gi "git status"
alias gad "git add ."
alias gcmsg "git commit -m"
alias gdi "git diff"
alias gb "git branch"
alias gco "git checkout"
alias gpl "git pull"
alias gps "git push"
alias gclean 'git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
alias be "bundle exec"
alias dm "docker-machine"
alias dc "docker-compose"
alias gat "echo -n 61605b7cb38654aed98a3e8364ab0855dc4d380d | pbcopy"
alias d "docker"

alias birl "afplay /Users/gvc/bin/biur.mov"

alias tmux "env TERM=screen-256color-bce tmux -2"
alias mux "tmuxinator"

set PATH $PATH /Applications/Postgres.app/Contents/Versions/9.4/bin
set PATH $PATH ~/bin
set PATH $PATH /usr/local/sbin

set -gx TERM screen-256color-bce
set -gx fish_term24bit
set -gx MYSQL_SERVER_ID 4
set -gx EVENT_NOKQUEUE 1

fish_vi_key_bindings
set -g __fish_vi_mode 1

