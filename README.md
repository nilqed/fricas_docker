##### fricas_docker

See [nilqed/fricas](https://hub.docker.com/r/nilqed/fricas/)
For a manual build checkout and use `./build`.


-- stop/remove all containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

-- copy container -> host
docker cp <containerId>:/file/path/within/container /host/path/target
