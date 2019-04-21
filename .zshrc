#export PATH="/usr/bin:$PATH"

export EDITOR=vim
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export AUTOFEATURE=true

bindkey -e

setopt auto_cd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify
setopt equals

RPROMPT='[%d]'

autoload -U compinit;
compinit
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types

typeset -ga chpwd_functions

zstyle ':completion:*' completer \
    _oldlist _complete _expand _match _history _ignored _approximate _prefix

zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

DIRSTACKSIZE=100
setopt AUTO_PUSHD
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache true

zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:descriptions' format '%BCompleting%b %F{yellow}%U%d%u'
zstyle ':completion:*' list-separetor '-->'
zstyle ':completion:*' ignore-parents parent pwd ..

autoload -Uz is-at-least
if is-at-least 4.3.11; then
    autoload -U chpwd_recent_dirs cdr
    chpwd_functions+=chpwd_recent_dirs
    zstyle ":chpwd:*" recent-dirs-max 500
    zstyle ":chpwd:*" recent-dirs-default true
    zstyle ":completion:*" recent-dirs-insert always
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
setopt hist_save_no_dups

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:cdr:*:*' menu selection
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/shell/chpwd_recent_dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34;01:ln=36;01:so=32:pi=33:ex=32;01:bd=46;34:cd=43:su=41;30:sg=46;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=%LS_COLORS
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -U colors; colors
alias g=git
alias v=vim
alias sl=ls
case "${OSTYPE}" in
darwin*)
    alias lsusb='system_profiler SPUSBDataType'
    alias ls='ls -G'
    ;;
linux*)
    alias ls='ls --color=auto'
    ;;
esac

alias ls='ls -alh'

if which peco > /dev/null; then
    echo 'use peco'
    source ~/.zsh/.zrc.peco.zsh
    function _insert_pecopipe() {
        LBUFFER=${LBUFFER}" | peco"
    }
    zle -N _insert_pecopipe
    bindkey '^[^[' _inser
else
    echo 'no peco'
fi

source ${HOME}/.zsh/modules/zsh-context-sensitive-alias/csa.zsh
csa_init

function my_context_func {
        local -a ctx
        if [[ -n 'git rev-parse --git-dir 2> /dev/null' ]]; then
                ctx+=git
        fi
        if [[ -n 'hg root 2> /dev/null' ]]; then
                ctx+=hg
        fi
        if [[ -e Rakefile ]]; then
                ctx+=rake
        fi
        if [[ -e Gemfile ]]; then
                ctx+=bundler
        fi

        csa_set_context $ctx
}

function groot() {
  if git rev-parse --is-inside-work-tree > dev/null 2>&1; then
    cd 'git rev-parse --show-toplevel'
  fi
}

alias prt="groot"

function vixit() {
  if [ -n "${VIM}" ]; then
    exit
  else
    echo 'Not shell in vim'
  fi
}

chpwd_functions+=my_context_func

alias goat="docker --tlsverify --tlscacert=${HOME}/.docker/certs-for-goat/ca.pem --tlscert=${HOME}/.docker/certs-for-goat/cert.pem --tlskey=${HOME}/.docker/certs-for-goat/key.pem -H=red-goat.japaneast.cloudapp.azure.com:2376"


