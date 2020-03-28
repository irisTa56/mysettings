FROM jupyter/base-notebook

USER root

RUN echo "$NB_USER ALL=NOPASSWD: /bin/chown" >> /etc/sudoers

USER $NB_UID
WORKDIR $HOME

RUN mkdir -p $HOME/.jupyter/lab/user-settings/@jupyterlab
COPY files/@jupyterlab/ $HOME/.jupyter/lab/user-settings/@jupyterlab/

RUN jupyter labextension install @jupyterlab/toc

RUN conda install --quiet --yes \
  coverage \
  flask \
  flask-httpauth \
  flask-sqlalchemy \
  pillow \
  pytest \
  requests

COPY files/docker_cmd.sh /usr/local/bin/

CMD ["docker_cmd.sh"]
