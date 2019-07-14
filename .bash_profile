# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

export LANG=C

# Prompt color
# font-color: black 30, white 37
# bg-color: red 41, green 42, yellow 43, blue 44, magenta 45, cyan 46
export PS1="\[\e[30;43m\][\u@\h:\W]\[\e[00m\] \$ "

eval $(dircolors -b $HOME/.dircolors)

eval $($(brew --prefix)/bin/brew shellenv)

source $(brew --prefix asdf)/asdf.sh
