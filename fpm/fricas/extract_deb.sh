#!/bin/sh
FRICAS_VERSION=1.3.5
docker run --name fpm_fricas -t -i fpm:fricas fpm --version
docker cp fpm_fricas:/root/fricas_${FRICAS_VERSION}_amd64.deb .
docker stop fpm_fricas
docker rm fpm_fricas
ls -l *.deb
