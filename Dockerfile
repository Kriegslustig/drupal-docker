FROM ubuntu:15.10

MAINTAINER Kriegslustig <github@ls7.ch>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN mkdir /provision
ADD provision /provision
RUN /provision/provision.sh

RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

EXPOSE 80
EXPOSE 3306

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

CMD ["/bin/bash", "-c", "set -e && /usr/local/bin/supervisord -c /etc/supervisord.conf"]

ENV PATH "$PATH:/root/.composer/vendor/bin"

