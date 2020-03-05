# ~/.bash_profile

export BASH_SILENCE_DEPRECATION_WARNING=1

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export LC_CTYPE=ja_JP.UTF-8
export PATH="/usr/local/sbin:$PATH"
export PS1="\[\e[30;47m\][\u@mac:\W]\[\e[00m\] \$ "

test -r ~/.bashrc && . ~/.bashrc

source $(brew --prefix asdf)/asdf.sh
export PATH=$(asdf where java)/bin:$(asdf where rust)/bin:$(asdf where python)/bin:$PATH

eval "$(dircolors -b $HOME/.dircolors)"
eval "$(direnv hook bash)"
