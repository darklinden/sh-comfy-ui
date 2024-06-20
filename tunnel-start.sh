#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

echo "Load environment variables ..."

if [ -f $SCRIPT_DIR/.env ]; then
    echo "Loading environment variables from $SCRIPT_DIR/.env ..."
    set -a
    source $SCRIPT_DIR/.env
    set +a
fi

if [ -z "$REMOTE_HOST" ]; then
    echo "REMOTE_HOST is not set. Please set REMOTE_HOST in .env file."
    exit 1
fi

echo "Starting ssh tunnel to $REMOTE_HOST 8188 ..."
ssh -L 8188:localhost:8188 -N -f $REMOTE_HOST

open http://127.0.0.1:8188
