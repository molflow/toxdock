FROM ubuntu:16.04

# alias tox='docker run -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v "$PWD":/src -v /var/run/docker.sock:/var/run/docker.sock -u $(id -u):$(id -g) --rm --privileged --group-add=docker toxdock tox'

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
build-essential \
python-pip \
python2.7 \
python2.7-dev \
python3 \
python3-dev \
python3-venv \
python3.5 \
python3.5-dev \
rabbitmq-server \
xvfb \
chromium-chromedriver \
apt-transport-https \
ca-certificates \
curl \
software-properties-common \
lsb-release

RUN ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/chromedriver
RUN pip install tox

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -yqq install docker-ce
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
RUN mv /tmp/docker-compose /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

VOLUME /src
WORKDIR /src

CMD [ "tox" ]

