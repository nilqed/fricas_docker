#!/bin/sh
echo Testing "nilqed/fricas:latest"
docker run -t -i --name fricas_test_tmp nilqed/fricas:latest fricas -nox
docker stop fricas_test_tmp
docker rm fricas_test_tmp
docker ps -a
echo done.


