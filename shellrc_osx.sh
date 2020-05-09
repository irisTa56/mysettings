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

function docker-run-with-gear() {
  gear_dir=$1
  ssh_auth_sock="/run/host-services/ssh-auth.sock"
  docker run -it --rm \
    --mount "type=bind,src=$gear_dir,dst=/root/$(basename $gear_dir)" \
    -v "$ssh_auth_sock:$ssh_auth_sock" \
    -e SSH_AUTH_SOCK="$ssh_auth_sock" \
    irista56/antikythera-elixir
}
