alias ls='ls --color=auto --show-control-char'

function pip-u-all() {
  pip list --outdated --format=freeze \
  | grep -v '^\-e' \
  | cut -d = -f 1 \
  | xargs -n1 pip install -U
}

function npm-g-i() {
  ASDF_SKIP_RESHIM=1 npm -g i $@
  asdf reshim nodejs
}

function npm-g-up() {
  ASDF_SKIP_RESHIM=1 npm -g up $@
  asdf reshim nodejs
}
