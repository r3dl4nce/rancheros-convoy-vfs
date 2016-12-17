# 
#  Convoy drivers with VFS path for Docker
#
FROM alpine:3.4
MAINTAINER r3dl4nce <r3dl4nce@gmail.com>

WORKDIR /tmp
RUN apk add --no-cache --virtual .bootstrap-deps curl   \
    && curl -SL -O  https://github.com/rancher/convoy/releases/download/v0.5.0/convoy.tar.gz   \ 
    && gunzip convoy.tar.gz  \
    && tar xvf convoy.tar    \
    && cp convoy/convoy* /usr/bin/  \
    && rm -rf convoy.tar.gz  \
    && rm -rf convoy         \
    && apk del .bootstrap-deps


COPY convoy-start.sh /convoy-start.sh
RUN chmod +x /convoy-start.sh    


ENTRYPOINT ["/convoy-start.sh"]


