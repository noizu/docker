# vim:set ft=dockerfile:
FROM registry.noizu.com/noizu.phpfpm:latest
MAINTAINER Noizu Labs Keith Brings "keith.brings@noizu.com"

# Setup Compass
ADD scripts/setup.sh /tmp/scripts/noizu.phpfpm.build/setup.sh
RUN /tmp/scripts/noizu.phpfpm.build/setup.sh

# Setup Elixir, Erlang, Make, Git and WGET
ADD scripts/build.sh /tmp/scripts/noizu.phpfpm.build/build.sh
CMD /tmp/scripts/noizu.phpfpm.build/build.sh

# Setup volumes
VOLUME ["/src"]
