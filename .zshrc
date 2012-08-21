# Oh-My-Zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME='miloshadzic'
export DISABLE_AUTO_UPDATE=true

# COMPLETION_WAITING_DOTS="true"
plugins=(github rails3 bundler gpg-agent ssh-agent)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
source ~/.rbenv/completions/rbenv.zsh

# History settings
HISTSIZE=2000
SAVEHIST=2000

# Vim previous/next
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^k'   history-beginning-search-backward-end
bindkey '^j'   history-beginning-search-forward-end

# Exports
export EDITOR='vim'
export PATH=~/local/bin:~/bin:/usr/local/bin:/opt/android-sdk/platform-tools:~/.rbenv/bin:$PATH:~/.cabal/bin:~/.xmonad/bin:/opt/nodejs/bin
export BROWSER='google-chrome'
export JRUBY_OPTS=--1.9
export RBXOPT="-X19"
export TERM=xterm-256color

# Modes
set -o emacs
bindkey -e

# rbenv
eval "$(rbenv init -)"
export PATH=./bin:$PATH

# LS sugar
eval `dircolors ~/.dircolors 2>/dev/null`

# Complete $PWD/bin if it exists. Good for bundler with binstubs
zstyle -e ':completion:*' command-path \
  '[[ -d $PWD/bin ]] && reply=($PWD/bin $path)'

[[ -f ~/.localrc ]] && source ~/.localrc
