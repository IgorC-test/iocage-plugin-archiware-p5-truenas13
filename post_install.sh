#!/bin/sh
mkdir /usr/local/aw
cd /usr/local/aw
echo "downloading package"
# currently TrueNAS 13.1 uses 12.3-RELEASE for its jails
# if needed switch to awpst*-freebsd12.tgz and add
# mv /usr/local/aw/binaries/FreeBSD/amd64/12 /usr/local/aw/binaries/FreeBSD/amd64/13
# before executing start-server
fetch http://p5-downloads.s3.amazonaws.com/awpst723-freebsd13.tgz
echo "unpacking tar"
tar -xvf /usr/local/aw/awpst*-freebsd13.tgz -C /usr/local/aw/
echo "deleting tgz"
rm /usr/local/aw/awpst*-freebsd13.tgz
echo "setting uuid"
fetch http://p5-downloads.s3.amazonaws.com/set_uuid.sh
chmod +x ./set_uuid.sh
./set_uuid.sh
echo "starting server"
/usr/local/aw/start-server
echo "Archiware P5 now installed" > /root/PLUGIN_INFO
