# lotus-infra

This repository contains infrastructure tooling for the filecoin `lotus` client, and running the associated block explorer.

# building

To build the lotus node under `rtradetech/lotus-node:latest` and the block explorer under `rtradetech/lotus-explorer:latest` run `make docker-build`. If you want both containers in tandem as they are intended to be run `make docker-run`.

# developing

After making your changes you'll want to build and push with `make docker-build && make docker-push`. Note that this will require being appropriately authenticated uner the `rtradetech` organization on dockerhub.

# docker

There are two docker files, one for the lotus node in `node.Dockerfile` and one for the block explorer in `explorer.Dockerfile`. Either of these docker containers can be run standalone, or in tandem to provide complimentary functionality.

# docker-compose

The compose file allows us to spin up an instante of the lotus node with persistent storage, and once that is done a container running the block explorer.

# Container Specifications

## lotus api node

This is a standalone lotus node, intended to expose the swarm port, and an NGINX reverse proxy server offering access to the API. Additinoally the proxy server handles CORS, and caches `GET` and `HEAD` requests. The docker container is based on debian buster.

## block explorer

This is an NGINX web server that offers access to the filecoin lotus block explorer. The docker container is based on alpine linux.