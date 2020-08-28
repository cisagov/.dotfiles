#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# * Share history immediately across all open terminals
# * Do not store duplicates, and erase them if they occur
# * Always append history; never overwrite it
# * Store multiline commands as a single history entry
# shopt -s cmdhist histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r"
export HISTCONTROL=ignoreboth:erasedups

# make the history larger
export HISTFILESIZE=4096
export HISTSIZE=4096

# Set the default editor
export EDITOR="subl -w"

# Nice colors for ls output
if [[ "$OSTYPE" == "darwin"* ]]; then
  # set up some color in our directories
  export CLICOLOR=1
  export LSCOLORS="gxfxcxdxbxegedabagacad"
else
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi

# Add local bin directory to the path
export PATH=$PATH:$HOME/bin

# disable ._ file inclusion with tar (and other commands)
export COPYFILE_DISABLE=true

# ulimit sanity
ulimit -n 2048

# Load other files
if [ -d ~/.bashrc.d ]
then
  for f in ~/.bashrc.d/*
  do
    # shellcheck disable=SC1090
    source "$f"
  done
fi

# shellcheck source=/dev/null
source "$HOME/.bash_greeter"

export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# shellcheck source=/dev/null
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
