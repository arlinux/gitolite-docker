#!/bin/bash


docker run -d --name gitolite-docker -p 2222:22 --volume /home/ashok/gitolite-docker/repos:/home/git/repositories  --volume /home/ashok/gitolite-docker/ssh:/home/git/.ssh  --volume /home/ashok/gitolite-docker/gitolite:/home/git/.gitolite gitolite-docker
