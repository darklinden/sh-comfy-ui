#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit
# --- For AutoDL Network ---
if [ -f /etc/network_turbo ]; then
    . /etc/network_turbo
fi
# --- For AutoDL Network ---

mkdir -p /root/autodl-tmp/input
ln -s /root/autodl-tmp/input /root/sh-comfy-ui/ComfyUI/input

mkdir -p /root/autodl-tmp/output
ln -s /root/autodl-tmp/output /root/sh-comfy-ui/ComfyUI/output

mkdir -p /root/autodl-fs/models
ln -s /root/autodl-fs/models /root/sh-comfy-ui/ComfyUI/models
