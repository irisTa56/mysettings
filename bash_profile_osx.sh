# ~/.bash_profile

export BASH_SILENCE_DEPRECATION_WARNING=1

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export LC_CTYPE=ja_JP.UTF-8
export PATH="/usr/local/sbin:$PATH"
export PS1="\[\e[30;47m\][\u@mac:\W]\[\e[00m\] \$ "

tmp_PATH=$PATH
source $(brew --prefix asdf)/asdf.sh
export PATH=${PATH%$tmp_PATH}$(asdf where rust)/bin:$tmp_PATH

test -r ~/.bashrc && . ~/.bashrc

test -x /usr/local/bin/python3 \
  && ln -sf /usr/local/bin/python3 /usr/local/bin/python

eval "$(dircolors -b $HOME/.dircolors)"
eval "$(direnv hook bash)"
