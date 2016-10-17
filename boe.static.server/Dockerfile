# Boe.Static.Server Container
FROM registry.noizu.com/noizu.nginx:latest
MAINTAINER Keith Brings <keith.brings@noizu.com>

#====================================================#
# Static Conent                                      #
#====================================================#
VOLUME /src

#================================#
# Ports                          #
#================================#
EXPOSE 80 443

#================================#
# EntryPoint                     #
#================================#
ENTRYPOINT ["/tmp/scripts/noizu.nginx/docker-entrypoint.sh"]
CMD ["nginx"]

#================================#
# Bin Place                      #
#================================#
COPY ./config/nginx/ /usr/share/senginx/conf/
COPY ./config/consul/ /etc/consul.d/
