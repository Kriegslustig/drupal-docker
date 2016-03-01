FROM ubuntu:15.10

MAINTAINER Kriegslustig <github@ls7.ch>

ENV DEBIAN_FRONTEND noninteractive

CMD ["/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf"

RUN mkdir /provision
ADD provision /provision
RUN /provision/provision.sh

EXPOSE 80

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV PATH "$PATH:/root/.composer/vendor/bin"

