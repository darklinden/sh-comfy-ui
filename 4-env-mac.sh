#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit

CWD=$(pwd)
CWD=$CWD/ComfyUI

cd $CWD || exit

if [ ! -d "/usr/local/anaconda3" ]; then
    echo "Anaconda3 is not installed"
    exit 1
fi

# use conda
. "/usr/local/anaconda3/etc/profile.d/conda.sh"
echo "Using conda: "$(which conda)

if [ ! -d $CWD"/conda_env" ]; then
    # Take action if $VENV_DIR exists. #
    echo "Creating virtual environment"
    mkdir $CWD"/conda_env"
    conda create --prefix $CWD/conda_env python=3.9
    conda activate $CWD/conda_env
    pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
    pip install -r requirements.txt
else
    echo "Virtual environment folder already exists"
    conda activate $CWD/conda_env
fi

PYTORCH_MPS_HIGH_WATERMARK_RATIO=0.0 python main.py --dont-upcast-attention --use-split-cross-attention
