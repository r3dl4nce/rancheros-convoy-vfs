#!/bin/sh

DOCKER_VOLUMES=/opt/convoy-volumes
DOCKER_PLUGINS=/etc/docker/plugins

if [ -z $@ ]; then
    if [ ! -d $DOCKER_PLUGINS ]; then
        mkdir -p $DOCKER_PLUGINS
    fi

    echo "unix:///var/run/convoy/convoy.sock" > $DOCKER_PLUGINS/convoy.spec

    CMD="daemon --drivers vfs --driver-opts vfs.path=$DOCKER_VOLUMES"
else
    CMD=$@
fi

exec /usr/bin/convoy $CMD


