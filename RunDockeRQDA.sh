#!/bin/bash
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
sudo docker run -it --volume=$XSOCK:$XSOCK:rw \
     --volume=$XAUTH:$XAUTH:rw \
     --env="XAUTHORITY=${XAUTH}" \
     --env="DISPLAY" \
     --name whirl_wheels \
     --workdir=/root/ \
     --volume=/home/fred/R/dockerqda/:/home/dockerqda/ \
     frdvnw/dockerqda:latest
