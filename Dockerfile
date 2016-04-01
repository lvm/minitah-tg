# Run `minitah.py`, a tg bot in a container

FROM debian:jessie

MAINTAINER Mauro <mauro@sdf.org>

ENV DEBIAN_FRONTEND noninteractive

ENV USER minitah
ENV UID 1000
ENV HOME /home/$USER

RUN apt-get update \
    && apt-get install -yq python-pip python-virtualenv \
    && rm -rf /var/lib/apt/lists

RUN useradd -u $UID -m -d $HOME -s /usr/sbin/nologin $USER \
    && mkdir -p $HOME/venv \
    && chown -Rh $USER:$USER -- $HOME

RUN cd $HOME/venv \
    && virtualenv minita-tg \
    && cd $HOME/venv/minita-tg \
    && . bin/activate \
    && pip install python-telegram-bot

COPY ["insultos.txt", "$HOME/venv/minita-tg/insultos.txt"]
COPY ["minitah.py", "$HOME/venv/minita-tg/minitah.py"]

USER $USER

WORKDIR $HOME/venv/minita-tg
