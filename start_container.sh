#!/bin/bash

pth=$(echo $HOME)
docker run -d --name gitolite-docker -p 2222:22 --volume $pth/gitolite-docker/repos:/home/git/repositories  --volume $pth/gitolite-docker/ssh:/home/git/.ssh  --volume $pth/gitolite-docker/gitolite:/home/git/.gitolite gitolite-docker
