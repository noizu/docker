# vim:set ft=dockerfile:
FROM debian:wheezy
MAINTAINER Keith Brings "keith.brings@noizu.com"

#====================================#
# Remove /var/log from unionfs       #
#====================================#
VOLUME /var/log

#====================================#
# Binplace Consul.io binary          #
#====================================#
ADD ./bin/consul /bin/consul

#====================================#
# Setup Locale Environment           #
#====================================#
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV MIRROR us

# Configure Base,
# 1. Switch from httpredir to ftp.$MIRROR for apt-get.
#    - httpredir does a poor job of selecting the best mirror.
#    - This change reduces initial setup times by hours.
#    - For production we can set MIRROR to us to select a closer apt mirror.
# 2. Update Apt
# 3. Set locals to english, utf-8
# 4. Set Deb to NonInteractive mode to reduce missing terminal warning messages.
# 5. Add apt-utils to speed up some operations that delay in noninteractive mode with out it.
# 6. Configure consul.io
# 7. Purge apt cache to reduce image size.
RUN echo "" && \
    echo "2. Update Apt" && \
    echo "------------------------------------------------------------------------------" && \
    apt-get update && \
    echo "" && \
    echo "3. Set locals to english, utf-8"  && \
    echo "------------------------------------------------------------------------------" && \
    apt-get install -y locales rsyslog && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    echo "" && \
    echo "4. Set Deb to NonInteractive mode to reduce missing terminal warning messages." && \
    echo "------------------------------------------------------------------------------" && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    export DEBIAN_FRONTEND=noninteractive && \
    echo "" && \
    echo "5. Add apt-utils to speed up some operations that delay in noninteractive mode with out it."  && \
    echo "------------------------------------------------------------------------------" && \
    apt-get install -y apt-utils && \
    echo "" && \
    echo "6. Configure consul.io"  && \
    echo "------------------------------------------------------------------------------" && \
    mkdir /etc/consul.d && \
    echo "" && \
    echo "7. Purge apt cache to reduce image size."  && \
    echo "------------------------------------------------------------------------------" && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /var/cache/apt/partial/* && \
    rm -f /var/cache/apt/*.deb && \
    echo "" && echo "fin."


#====================================#
# Binplace Common.sh script          #
#====================================#
ADD ./scripts/common.sh /tmp/scripts/noizu.debian/common.sh
