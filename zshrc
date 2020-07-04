autoload -U promptinit; promptinit
prompt pure

unset LSCOLORS
# export CLICOLOR=1
# export CLICOLOR_FORCE=1

ZSH_THEME=""

source /Users/joshmurr/Library/Preferences/org.dystroy.broot/launcher/bash/br

export EDITOR=vim
export GREP_OPTIONS="--color"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joshmurr/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joshmurr/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joshmurr/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joshmurr/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

