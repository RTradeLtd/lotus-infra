# stage 1 build
FROM node:12.13.1-buster AS build-env
RUN apt-get update && apt-get install -y sudo curl git
RUN mkdir /build && cd /build && git clone https://github.com/openworklabs/filecoin-explorer.git
RUN cd /build/filecoin-explorer && git pull  && git checkout master && git checkout master && yarn && npm run build
# stage 2 build
FROM nginx:1.17.6-alpine
COPY --from=build-env /build/filecoin-explorer/build /var/www/filecoin-explorer
COPY docker-files/nginx_explorer.conf /etc/nginx/conf.d/explorer.conf
RUN rm /etc/nginx/conf.d/default.conf
EXPOSE 80/tcp
CMD ["nginx", "-g", "daemon off;"]
