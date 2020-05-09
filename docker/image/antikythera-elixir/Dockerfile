FROM ubuntu:focal

ARG asdf_repository="https://github.com/asdf-vm/asdf.git"
ARG asdf_version="v0.7.8"

ARG antikythera_tool_versions="https://raw.githubusercontent.com/access-company/antikythera/master/.tool-versions"

SHELL ["/bin/bash", "-c"]

USER root
WORKDIR /root

RUN apt-get update && apt-get install -y \
  build-essential \
  autoconf \
  curl \
  git \
  inotify-tools \
  locales \
  unzip \
  libexpat-dev \
  libncurses5-dev \
  libssh-dev

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen en_US.UTF-8 \
 && update-locale
ENV LANG en_US.UTF-8

RUN git clone ${asdf_repository} /root/.asdf -b ${asdf_version}

RUN curl ${antikythera_tool_versions} > .tool-versions

RUN source /root/.asdf/asdf.sh \
 && asdf plugin-add erlang \
 && asdf plugin-add elixir \
 && asdf install \
 && mix local.hex --force \
 && mix local.rebar --force

CMD ["/bin/bash", "--rcfile", "/root/.asdf/asdf.sh"]
