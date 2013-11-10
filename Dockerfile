# Dockerfile for znc
# 
# Version: 0.01
FROM        ubuntu:latest
MAINTAINER  Naoki OKAMURA (Nyarlra) <nyarla@thotep.net>

RUN echo "deb http://archive.ubuntu.com/ubuntu raring main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y znc

RUN mkdir -p /znc
ADD run     /znc/run
ADD znc.pem /znc/znc.pem
RUN chmod +x /znc/run

RUN adduser --group znc
RUN useradd -g znc znc
RUN chown -R znc:znc /znc

USER znc
ENTRYPOINT ["/znc/run"]

