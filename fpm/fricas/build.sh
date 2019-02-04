#!/bin/sh
docker rmi fpm:fricas
docker build -t fpm:fricas . > log
tail log
docker images



