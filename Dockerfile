FROM fedora:27

RUN dnf upgrade -y
RUN dnf install -y znc

ADD znc.conf /var/lib/znc/.znc/configs/znc.conf
RUN chown -R znc:znc /var/lib/znc/.znc
USER znc

EXPOSE 6665

CMD ["znc", "--foreground"]
