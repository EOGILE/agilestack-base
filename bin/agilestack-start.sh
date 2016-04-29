#!/usr/bin/env bash

if [[ $# > 2 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "A tool to easily start an Agilestack plugin"
    echo
    echo "Syntax: $0 <plugin name> [<container name>]"
    echo "  - plugin name:     The name of the plugin to start. The 'agilestack-' prefix can be omitted. "
    echo "                     Defaults to the current folder name"
    echo "  - container name:  The name to give the new container. defaults to the plugin name"
    exit 1
fi

plugin_name=$1
if [ -z "${plugin_name}" ]; then
    plugin_name=${PWD##*/} # Current folder name
fi
if [[ "${plugin_name}" != agilestack-* ]]; then
    plugin_name="agilestack-${plugin_name}"
fi

container_name=$2
if [ -z "${container_name}" ]; then
    container_name="${plugin_name}"
fi

docker run -itd --name "$container_name" --net agilestacknet \
    -v ${HOME}/agilestack/shared:/shared:ro \
    -v ${HOME}/agilestack/shared/${plugin_name}:/shared/${plugin_name}:rw \
    ${plugin_name}
