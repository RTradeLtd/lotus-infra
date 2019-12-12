# lotus-infra

This repository contains infrastructure tooling for the filecoin `lotus` client, and running the associated block explorer.

# docker

There are two docker files, one for the lotus node in `node.Dockerfile` and one for the block explorer in `explorer.Dockerfile`. Either of these docker containers can be run standalone, or in tandem to provide complimentary functionality.

# docker-compose

The compose file allows us to spin up an instante of the lotus node with persistent storage, and once that is done a container running the block explorer.

# lotus node specs

The lotus node sits behind an NGINX reverse proxy server, that takes care of handling CORS, as well as enabling caching of `GET` and `HEAD` requests. The NGINX proxy is set with a read timeout of 60 seconds, and the lotus node API is also configured with a 60 second timeout.

Associated files:

* `docker-files/entrypoint.sh`
  * The script ran when the lotus node docker container starts
* `docker-files/lotus_docker_config.toml`
  * This is the actual lotus node configuration file
* `docker-files/nginx_lotus_api_config.conf`
  * This is the NGINX proxy configuration for the API
* `docker-files/nginx_lotus_main.conf`
  * This is the NGINX server configuration

# block explorer specs
