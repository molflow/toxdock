FROM ubuntu:16.04

# alias tox='docker run -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v "$PWD":/src -u $(id -u) --rm --privileged toxdock tox'

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
build-essential \
python-pip \
python2.7 \
python2.7-dev \
python3 \
python3-dev \
python3.5 \
python3.5-dev \
rabbitmq-server \
xvfb \
chromium-chromedriver

RUN ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/chromedriver
RUN pip install tox

VOLUME /src
WORKDIR /src

CMD [ "tox" ]

