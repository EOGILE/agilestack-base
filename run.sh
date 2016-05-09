#!/usr/bin/env bash

appname=$1
if [ -z "${appname}" ]; then
    echo "Syntax: $0 <project-name>"
    exit 1
fi

cd $(dirname $0)

if ! (docker network inspect agilestacknet > /dev/null 2>&1); then
    docker network create agilestacknet
fi

if ! (docker volume inspect agilestack-shared > /dev/null 2>&1); then
    docker volume create --name agilestack-shared
fi

/opt/bin/docker-compose -f docker-compose-base.yml -f docker-compose-${appname}.yml pull
/opt/bin/docker-compose -f docker-compose-base.yml -f docker-compose-${appname}.yml up -d
