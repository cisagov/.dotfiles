#!/bin/zsh
# shellcheck shell=bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation, uncomment if installed.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Use another custom folder than $ZSH/custom - set to a folder in .dotfiles stowage
ZSH_CUSTOM=$HOME/.zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws gitfast ssh-agent terraform)

ZSH_DISABLE_COMPFIX="true"

# Source the oh-my-zsh file, uncomment if installed
# source $ZSH/oh-my-zsh.sh

# ITerm2 shell integration, uncomment if installed
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# Initial setup - vim for remote sessions and Sublime Text (subl) for local
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -w'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Make it easy to reload this file
alias reload='source ~/.zshrc'

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

# Load files from the .zshrc.d subdirectory for ease and modularity
if [ -d ~/.zshrc.d ]
then
  for f in ~/.zshrc.d/*
  do
    # shellcheck disable=SC1090
    source "$f"
  done
fi

# Display something cool as a welcome screen
source ~/.bash_greeter

## Added by cisagov laptop script
## Leave these lines here but commented out so it doesn't re-add them

# alias laptop='bash <(curl -s https://raw.githubusercontent.com/cisagov/laptop/master/laptop)'
# export PATH="$HOME/.bin:$PATH"
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
