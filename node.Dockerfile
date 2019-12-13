###########
# stage 1 #
###########
FROM golang:1.13 AS build-env
RUN apt-get update -y && \
    apt-get install sudo curl git mesa-opencl-icd ocl-icd-opencl-dev gcc git bzr jq pkg-config -y
RUN git clone https://github.com/filecoin-project/lotus.git && \
    cd lotus && \
    git pull && \
    git checkout master && \
    make clean all && \
    make install

###########
# stage 2 #
###########
FROM debian:buster
RUN apt-get update -y && \
    apt-get install sudo mesa-opencl-icd ocl-icd-opencl-dev nginx -y
COPY --from=build-env /usr/local/bin/lotus /usr/local/bin/lotus
COPY configs/lotus_node/config.toml /root/.lotus/config.toml
COPY scripts/lotus_node_entrypoint.sh /bin/entrypoint.sh
COPY nginx/conf.d/lotus_node.conf /etc/nginx/sites-enabled/lotus_node.conf
COPY nginx/nginx.lotus_node.conf /etc/nginx/nginx.conf
EXPOSE 1235/tcp
EXPOSE 8080/tcp
ENTRYPOINT ["/bin/entrypoint.sh"]