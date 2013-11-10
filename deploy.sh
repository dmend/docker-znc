#!/usr/bin/env bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <USER> <HOST>"
    exit 1;
fi;

workdir=`cd $(dirname $0) && pwd`

user=$1
host=$2
sshhost="${user}@${host}"

path="service/znc"

if [ "${user}" = "root" ]; then
    path="/root/${path}"
else
    path="/home/${user}/${path}"
fi;

cd $workdir

rsync -avz --delete --exclude-from .rsyncignore . "${sshhost}:${path}"
