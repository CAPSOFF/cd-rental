FROM mysql:5.6 AS dependencies
# ----------------------------

WORKDIR /tmp

RUN apt-get -yq update && apt-get -yq --no-install-recommends install \
  wget \
  nano

# Install GO Tools
RUN wget --no-check-certificate https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.14.2.linux-amd64.tar.gz \
  && rm -r go1.14.2.linux-amd64.tar.gz \
  && echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc \
  && . ~/.bashrc \
  && go version

RUN ldconfig \
  && . ~/.bashrc \
  && . ~/.profile

FROM dependencies AS builder
# --------------------------

ENV MYSQL_DATABASE db_cd_rental
ENV MYSQL_ROOT_PASSWORD root

ADD ./sql-scripts/ /docker-entrypoint-initdb.d/
ADD . /app/cd-rental

WORKDIR /app/cd-rental

RUN ldconfig \
  && . ~/.bashrc \
  && . ~/.profile