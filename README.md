# lotus-infra

This repository contains infrastructure tooling for the filecoin `lotus` client, and running the associated block explorer.

# building

To build the lotus node under `rtradetech/lotus-node:latest` and the block explorer under `rtradetech/lotus-explorer:latest` run `make docker-build`. If you want both containers in tandem as they are intended to be run `make docker-run`.

# developing

After making your changes you'll want to build and push with `make docker-build && make docker-push`. Note that this will require being appropriately authenticated under the `rtradetech` organization on dockerhub.

# Container Specifications

## lotus api node

This is a standalone lotus node, intended to expose the swarm port, and an NGINX reverse proxy server offering access to the API. Additinoally the proxy server handles CORS, and caches `GET` and `HEAD` requests. The docker container is based on debian buster.


The container is set to build the lotus node from `https://github.com/filecoin-project/lotus.git` on the master branch.

## block explorer

This is an NGINX web server that offers access to the filecoin lotus block explorer. The docker container is based on alpine linux.

The container is set to build the block explroer from `https://github.com/openworklabs/filecoin-explorer.git` on the master branch.