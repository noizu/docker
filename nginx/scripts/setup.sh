#!/bin/bash
source /tmp/scripts/noizu.debian/common.sh

#-------------------------------------------------------------------------------
# Refresh Apt Cache
#-------------------------------------------------------------------------------
update_apt

#-------------------------------------------------------------------------------
# Setup Repos for Nginx Install
#-------------------------------------------------------------------------------
print_heading "Setup Requirements for SeNginx Build"
apt-get install -y make gcc ca-certificates curl libpcre3-dev libssl-dev apache2-utils
early_exit $?

#-------------------------------------------------------------------------------
# Install Nginx
#-------------------------------------------------------------------------------
print_heading "Building nginx"
cd /usr/share/ &&
tar -xvf senginx.tar.gz && \
cd senginx-1.6.2 && \
./se-configure.sh --with-http_ssl_module --prefix=/usr/share/senginx && \
make && \
make install && \
ln -s /usr/share/senginx/sbin/nginx /usr/sbin/nginx
early_exit $?

print_heading "Removing build tools to reduce container size"
cd / && \
rm -rf /usr/share/senginx-1.6.2/ && \
rm -rf /usr/share/senginx.tar.gz && \
yes "" | apt-get remove make gcc
early_exit $?

#---------------------- PATHS -------------------------------------------------
#nginx path prefix: "/usr/share/senginx"
#nginx binary file: "/usr/share/senginx/sbin/nginx"
#nginx configuration prefix: "/usr/share/senginx/conf"
#nginx configuration file: "/usr/share/senginx/conf/nginx.conf"
#nginx pid file: "/usr/share/senginx/logs/nginx.pid"
#nginx error log file: "/usr/share/senginx/logs/error.log"
#nginx http access log file: "/usr/share/senginx/logs/access.log"
#nginx http client request body temporary files: "client_body_temp"
#nginx http proxy temporary files: "proxy_temp"
#nginx http fastcgi temporary files: "fastcgi_temp"
#nginx http uwsgi temporary files: "uwsgi_temp"
#nginx http scgi temporary files: "scgi_temp"
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# Purging Apt Cache
#-------------------------------------------------------------------------------
purge_apt
