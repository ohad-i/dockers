#!/bin/bash

docker run -ti --net=host -e DISPLAY -v /tmp/.X11-unixi --rm $1 bash

#docker run -ti --net=host -e DISPLAY -v /tmp/.X11-unixi \
#--privileged \
# $1 bash
