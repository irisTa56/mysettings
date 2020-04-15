PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export LC_CTYPE=ja_JP.UTF-8
export PATH="/usr/local/sbin:$PATH"

tmp_PATH=$PATH
source "$(brew --prefix asdf)/asdf.sh"
rust_path=$(asdf where rust)/bin
export PATH=${PATH%$tmp_PATH}$rust_path:$tmp_PATH

if [ "$SHELL" = "/bin/bash" ]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1
  export PS1="\[\e[30;47m\][\u@mac:\W]\[\e[00m\] \$ "
  test -r ~/.bashrc && source ~/.bashrc
else
  export PROMPT="%K{7}%F{0}[%n@mac:%~]%f%k \$ "
fi

test -x /usr/local/bin/python3 \
  && ln -sf /usr/local/bin/python3 /usr/local/bin/python

eval "$(dircolors -b "$HOME"/.dircolors)"
eval "$(direnv hook "$SHELL")"
