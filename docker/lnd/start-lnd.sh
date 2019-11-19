#!/usr/bin/env bash

CONFIG_FILE=/home/lnd/lnd.conf

echo "LND BTC starting with network: $NETWORK"

PARAMS=$(echo \
    "--configfile=$CONFIG_FILE" \
    "--bitcoin.$NETWORK" \
    "--debuglevel=$DEBUG"
)

exec lnd $PARAMS "$@"
