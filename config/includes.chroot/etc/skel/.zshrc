HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
platform='linux'
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
zstyle ':completion:*' menu select
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '→' && return
    echo '$'
}
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{red}●'
zstyle ':vcs_info:*' check-for-changes true
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%F{green}%b %c%u%F{blue}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%F{green}%b %c%u%F{blue}●%F{blue}]'
    }
    vcs_info
    echo -ne "\033]0;$(hostname): $(pwd)\a"
}
setopt prompt_subst
PROMPT="
%{%F{green}%}%n%{%f%}%F{gray}@%{%F{green}%}%m %{%F{red}%}%d %F{blue}$vcs_info_msg_0_
%f%}$(prompt_char) "
export PATH=/usr/local/bin:/usr/bin:/bin:$HOME/bin:/usr/sbin:/usr/local/sbin:/usr/bin/X11
source ~/.export
source ~/.alias

