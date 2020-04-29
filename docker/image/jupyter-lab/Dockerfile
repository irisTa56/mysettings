FROM jupyter/base-notebook

USER root

# BEGIN == Prepare Hadoop
# borrowed from docker/compose/hadoop/base/Dockerfile

ARG HADOOP_VERSION=3.2.1
ARG HADOOP_URL=https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-8-jdk curl gnupg \
 && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
RUN gpg --import KEYS

RUN set -x \
 && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
 && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
 && gpg --verify /tmp/hadoop.tar.gz.asc \
 && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
 && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR /etc/hadoop
ENV ARROW_LIBHDFS_DIR $HADOOP_HOME/lib/native
ENV PATH $HADOOP_HOME/bin/:$PATH

# END ==== Prepare Hadoop

RUN echo "$NB_USER ALL=NOPASSWD: /bin/chown" >> /etc/sudoers

USER $NB_UID
WORKDIR $HOME

RUN mkdir -p $HOME/.jupyter/lab/user-settings/@jupyterlab
COPY files/@jupyterlab/ $HOME/.jupyter/lab/user-settings/@jupyterlab/

RUN conda install --quiet --yes \
  boto3 \
  coverage \
  ipywidgets \
  numpy \
  pandas \
  pillow \
  plotly \
  pyarrow \
  pytest \
  requests

RUN jupyter labextension install --no-build @jupyter-widgets/jupyterlab-manager \
 && jupyter labextension install --no-build @jupyterlab/toc \
 && jupyter labextension install --no-build jupyterlab-plotly \
 && jupyter labextension install --no-build plotlywidget \
 && jupyter lab build --dev-build=False --minimize=False

COPY files/docker_cmd.sh /usr/local/bin/

WORKDIR /mnt/volume

CMD ["docker_cmd.sh"]
