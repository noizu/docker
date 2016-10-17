# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.phpfpm:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

ENV NEWRELIC 3e2e1846e7a0687b1d6789a3615d84b2e42e20c8
COPY ./scripts/setup.sh /tmp/scripts/boe.phpfpm.server/setup.sh
RUN /tmp/scripts/boe.phpfpm.server/setup.sh

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
ENTRYPOINT ["/tmp/scripts/boe.phpfpm.server/docker-entrypoint.sh"]
CMD ["nginx"]

#================================#
# Bin Place                      #
#================================#
COPY ./config/nginx/ /usr/share/senginx/conf/
COPY ./scripts/ /tmp/scripts/boe.phpfpm.server/
COPY ./config/etc/ /etc/
