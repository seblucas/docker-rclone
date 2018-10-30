#!/bin/sh
ARCH=`arch`
if [[ ${ARCH:0:3} == 'arm' ]]
then
  export RCLONE_ARCH='arm'
fi
if [[ ${ARCH:0:5} == 'aarch' ]]
then
  export RCLONE_ARCH='arm64'
fi
if [[ ${ARCH:0:6} == 'x86_64' ]]
then
  export RCLONE_ARCH='amd64'
fi
echo "https://downloads.rclone.org/$1/rclone-$1-linux-$RCLONE_ARCH.zip"
wget -q "https://downloads.rclone.org/$1/rclone-$1-linux-$RCLONE_ARCH.zip" -P /tmp
unzip "/tmp/rclone-$1-linux-$RCLONE_ARCH.zip" -j -d /tmp
