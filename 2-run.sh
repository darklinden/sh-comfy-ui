#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit

CWD=$(pwd)
CWD=$CWD/ComfyUI

cd $CWD || exit

VENV_DIR=$CWD"/venv"
source $VENV_DIR/bin/activate

# PYTORCH_MPS_HIGH_WATERMARK_RATIO=0.0
# --dont-upcast-attention --use-split-cross-attention
python main.py
