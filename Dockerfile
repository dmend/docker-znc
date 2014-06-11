# Dockerfile for znc
# Version: 0.03

FROM        ubuntu:14.04
MAINTAINER  Douglas Mendizábal (redrobot) <mail@doug.gt>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "America/Chicago" > /etc/timezone
RUN dpkg-reconfigure tzdata

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe"            > /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu trusty-security main universe" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install znc -y

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

