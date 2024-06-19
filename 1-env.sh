#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit

CWD=$(pwd)
CWD=$CWD/ComfyUI

cd $CWD || exit

GLOBAL_PYTHON=$(which python3)
echo "Using global python: $GLOBAL_PYTHON"
if [ -z "$GLOBAL_PYTHON" ]; then
    echo "Python3 is not installed"
    exit 1
fi

VENV_DIR=$CWD"/venv"
ACTIVATE=$VENV_DIR"/bin/activate"

if [ ! -d $VENV_DIR ]; then
    # Take action if $VENV_DIR exists. #
    mkdir $VENV_DIR
    $GLOBAL_PYTHON -m venv $VENV_DIR
else
    echo "Virtual environment folder already exists"
fi

if grep -Faq "$VENV_DIR" $ACTIVATE; then
    # code if found
    echo "Virtual environment is ready to use"
else
    # code if not found
    echo "Virtual environment is incorrect, recreating..."

    rm -rf $VENV_DIR

    # Take action if $VENV_DIR exists. #
    mkdir $VENV_DIR
    $GLOBAL_PYTHON -m venv $VENV_DIR
fi

source $VENV_DIR/bin/activate

pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
pip install -r requirements.txt
