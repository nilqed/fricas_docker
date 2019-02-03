#!/bin/sh
sudo docker rmi nilqed/fricas:latest
sudo docker build -t nilqed/fricas:latest . > log
sudo docker images


