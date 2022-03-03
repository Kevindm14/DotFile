set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no

set -xg EDITOR vim
set -xg VISUAL vim

# Aliases
# Go OX
alias dev "ox dev"
alias migrate "ox db migrate"

# Git
alias gst "git status"
alias ga "git add"
alias gcm "git commit -m"
alias gps "git push origin"
alias gpl "git pull origin"
alias gd "git diff HEAD"
alias gco "git checkout"
alias glod 'git log --graph --pretty="%Cgreen%h%Creset%Cblue%d%Creset %Cred%an%Creset: %s"'

# Shell
alias reload "source ~/.config/fish/config.fish"
alias ll "exa -l -g --icons"
alias tmn='tmux new -s'

ulimit -n 12000

# Path
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
