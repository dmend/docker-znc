Dockerfile for znc IRC bouncer
==============================

Usage
-----

```
$ git clone https://github.com/boxelly/docker-znc
$ cd docker-znc
$ cp /path/to/znc.pem znc.pem
$ docker build -t nyarla/znc .
$ docker run -p 0.0.0.0:7000:7000 <ZNC_USER> <ZNC_PASS>
```

Author
------

Naoki OKAMURA (Nyarla) *nyarla[ at ]thotep.net*

License
-------

This product is under the [MIT-license](http://nyarla.mit-license.org/2013)