# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.nginx:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

# Setup Elixir, Erlang, Make, Git and WGET
ADD scripts/setup.sh /tmp/noizu.phpfpm.base/setup.sh
ADD bin/mypeb-master.tar.gz /opt/peb
RUN /tmp/noizu.phpfpm.base/setup.sh

ADD config/etc/php5/ /etc/php5/
