# ~/.bashrc

alias ls='ls --color=auto --show-control-char'

# ASDF

function npm-g-i() {
  ASDF_SKIP_RESHIM=1 npm -g i $@
  asdf reshim nodejs
}

function npm-g-up() {
  ASDF_SKIP_RESHIM=1 npm -g up $@
  asdf reshim nodejs
}
