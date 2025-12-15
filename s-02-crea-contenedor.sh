#!/bin/bash
docker run -i -t \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${UNAM_HOME}:${UNAM_HOME} \
--name c1-bdd-proy-sch \
--hostname h1-bdd-proy-sch.fi.unam \
--expose 1521 \
--shm-size=2gb \
--net=bdd-proy-net \
--ip 172.20.0.21 \
--add-host h2-bdd-proy-sakcc.fi.unam:172.20.0.22 \
-e DISPLAY=$DISPLAY respaldo_bddproy:latest bash
