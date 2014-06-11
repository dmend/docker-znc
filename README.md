Dockerfile for znc IRC bouncer
==============================

Usage
-----

```
$ git clone https://github.com/dmend/docker-znc
$ cd docker-znc
$ cp /path/to/znc.pem znc.pem
$ docker build -t douglas/znc .
$ docker run -d -p 0.0.0.0:443:7000 douglas/znc:latest <ZNC_USER> <ZNC_PASS>
```

Author
------

Douglas Mendizabal (redrobot) <douglas@redrobot.io>

License
-------

This product is under the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) license.
