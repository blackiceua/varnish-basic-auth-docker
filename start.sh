#!/bin/bash
set -e

if [ -z "$PROXY_TARGET_PORT" ]; then
	export PROXY_TARGET_PORT=80
fi

envs=`printenv`

for env in $envs
do
    IFS== read name value <<< "$env"

    sed -i "s|\${${name}}|\"${value}\"|g" $VCL_CONFIG
done

exec bash -c \
  "exec varnishd -F \
  -f $VCL_CONFIG \
  $VARNISHD_PARAMS"