# ALIASES
alias im='vim'
alias bim='vim'
alias nv='~/nvim.appimage'

alias get_idf='. $HOME/esp/esp-idf/export.sh'

alias reset-audio='systemctl --user restart pulseaudio'

alias open='xdg-open'

alias auto='xdg-open'
alias per='pipenv run'

alias d='cd'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lll='tree -I "node_modules|venv|env|bin|dist" -L 3'
# Git Aliases
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias glo='git log --graph --oneline'
alias gst='git status'
alias gpo='git push origin'

alias python='python3'

alias cci='cd ~/Documents/CCI/'
alias dots='cd ~/dotfiles'
alias piers='cd ~/Documents/piers'
alias gch='git checkout'
