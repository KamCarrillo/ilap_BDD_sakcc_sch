#!/bin/bash


docker run -i -t \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${UNAM_HOME}:${UNAM_HOME} \
--name c2-bdd-proy-sakcc \
--hostname h2-bdd-proy-sakcc.fi.unam \
--expose 1521 \
--shm-size=2gb \
--net=bdd-proy-net \
--ip 172.20.0.22 \
--add-host h1-bdd-proy-sch.fi.unam:172.20.0.21 \
-e DISPLAY=$DISPLAY proyfin:1.0 bash
