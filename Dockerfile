# Dockerfile for znc
# Version: 0.02

FROM        ubuntu:12.04
MAINTAINER  Naoki OKAMURA (Nyarla) <nyarla@thotep.net>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"            > /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu precise-security main universe" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN echo "deb http://archive.ubuntu.com/ubuntu quantal-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu quantal-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install znc/quantal-backports znc-dbg/quantal-backports znc-dev/quantal-backports znc-extra/quantal-backports znc-perl/quantal-backports znc-python/quantal-backports znc-tcl/quantal-backports -y

RUN mkdir -p /znc
ADD run     /znc/run
ADD znc.pem /znc/znc.pem
RUN chmod +x /znc/run

RUN adduser --group znc
RUN useradd -g znc znc
RUN chown -R znc:znc /znc

EXPOSE 7000
USER znc
ENTRYPOINT ["/znc/run"]

