# Install Oh-My-Zsh if it doesn't exist
if [[ ! -d ~/.oh-my-zsh ]]; then
  echo "Installing oh-my-zsh"
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME='arrow'
export DISABLE_AUTO_UPDATE=true

# COMPLETION_WAITING_DOTS="true"
plugins=(git rails3 gpg-agent ssh-agent)

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
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:~/local/bin:/usr/local/share/npm/bin:~/bin:/usr/local/bin:/usr/local/sbin:/opt/android-sdk/platform-tools:~/.rbenv/bin:$PATH:~/.cabal/bin:~/.xmonad/bin:/opt/nodejs/bin
export JRUBY_OPTS=--1.9
export RBXOPT="-X19"
export TERM=xterm-256color

# Modes
set -o emacs
bindkey -e

# Auto cd
setopt auto_cd
cdpath=($HOME/work/Site5 $HOME/work)


# rbenv
eval "$(rbenv init -)"
export PATH=./bin:$PATH

# LS sugar
# eval `dircolors ~/.dircolors 2>/dev/null`

# Complete $PWD/bin if it exists. Good for bundler with binstubs
zstyle -e ':completion:*' command-path \
  '[[ -d $PWD/bin ]] && reply=($PWD/bin $path)'

# Source my localrc if it exists
[[ -f ~/.localrc ]] && source ~/.localrc

# Aliases
alias diaf='git reset --hard'

alias sg='ruby script/generate'
alias sc='ruby script/console'
alias rc='pry'
alias b='bundle'

# Wrap git in hub
# alias git='hub'
alias gc='git commit'
alias gs='git status'
alias gp='git push'

alias p='nocorrect padrino'
alias s='nocorrect s'

alias knife='nocorrect knife'

alias empty_dir_find="find . -type d -empty -not -regex '.*\.git.*'"
alias empty_dir_find_keep="find . -type d -empty -not -regex '.*\.git.*' -exec touch {}/.gitignore \; -print"

# Linux
alias pacman='sudo pacman'
alias crp='CrashPlanDesktop'
alias apt-get='sudo apt-get'
alias fork='setsid'

if ! which ack > /dev/null; then
  alias ack='ack-grep'
fi

alias screenfo='/usr/bin/site_perl/screenfo'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
