# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.debian.jessie:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

# ENV NGINX_VERSION 1.9.3-1~jessie (Install Latest)
RUN groupadd -g 70827001 nginx && useradd -u 70827002 -g nginx nginx

#================================#
# Setup                          #
#================================#
COPY ./scripts/setup.sh /tmp/scripts/noizu.nginx/setup.sh
COPY ./bin/senginx-1.6.2.tar.gz /usr/share/senginx.tar.gz
RUN /tmp/scripts/noizu.nginx/setup.sh
COPY ./scripts/docker-entrypoint.sh /tmp/scripts/noizu.nginx/docker-entrypoint.sh

#================================#
# Ports                          #
#================================#
EXPOSE 80 443

#================================#
# Bin Place                      #
#================================#
COPY ./config/nginx/ /usr/share/senginx/conf/
