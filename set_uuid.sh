#!/bin/sh

uf=/usr/local/aw/etc/truenas_host_uuid
if test -f $uf; then
    read uuid < $uf
else
    uuid=`uuidgen`
    echo $uuid > $uf
fi
sed -i '' -e '2i\
'\''sysctl'\'' kern.hostuuid="'"${uuid}"'"' /usr/local/aw/start-server