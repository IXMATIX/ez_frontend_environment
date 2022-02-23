FROM ubuntu:18.04
LABEL maintainer="Gerardo Franco <gfranco@ixmatix.com>"

ENV TZ=America/Mexico_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get -y update

RUN apt install -y sl 
RUN apt install -y curl 
RUN apt install -y zip unzip
RUN apt install -y nano
RUN apt install -y wget
RUN apt-get install -y imagemagick
RUN apt-get install -y screen
RUN apt-get install -y webp

RUN apt-get -y update
RUN apt-get install -y --no-install-recommends locales
RUN apt install -y build-essential
RUN apt-get install -y inotify-tools
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb 
RUN dpkg -i erlang-solutions_2.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang
RUN apt-get install -y elixir

ARG USER=phoenix
ARG HOME=/home/$USER
ARG USER_ID=1000

ENV USER=$USER \
    HOME=$HOME

RUN groupadd $USER
RUN useradd -u $USER_ID -d $HOME -g $USER -ms /bin/bash $USER

USER $USER

WORKDIR $HOME

RUN mix local.hex --force
RUN mix archive.install hex phx_new

RUN mkdir -p $HOME/workspace

USER root
ENV LANG=en_US.UTF-8 
RUN echo $LANG UTF-8 > /etc/locale.gen 
RUN locale-gen 
RUN update-locale LANG=$LANG

USER $USER
WORKDIR $HOME/workspace
