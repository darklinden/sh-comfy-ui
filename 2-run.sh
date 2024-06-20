#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit
# --- For AutoDL Network ---
if [ -f /etc/network_turbo ]; then
    . /etc/network_turbo
fi
# --- For AutoDL Network ---

GLOBAL_PYTHON=$(which python3)
echo "Using global python: $GLOBAL_PYTHON"
if [ -z "$GLOBAL_PYTHON" ]; then
    echo "Python3 is not installed"
    exit 1
fi

if echo "$GLOBAL_PYTHON" | grep -q "conda"; then
    # code if "conda" is found in $GLOBAL_PYTHON
    echo ''
    echo "Using conda environment"
    echo ''
else
    # code if "conda" is not found in $GLOBAL_PYTHON
    echo ''
    echo "Using virtual environment"
    echo ''

    VENV_DIR=$SCRIPT_DIR/ComfyUI/venv
    ACTIVATE=$VENV_DIR/bin/activate

    if [ ! -d $VENV_DIR ]; then
        # Take action if $VENV_DIR exists. #
        mkdir $VENV_DIR
        $GLOBAL_PYTHON -m venv $VENV_DIR
    else
        echo "Virtual environment folder already exists"
    fi

    if grep -Faq "$VENV_DIR" $ACTIVATE; then
        # code if found
        echo ''
        echo "Virtual environment is ready to use"
        echo ''
    else
        # code if not found
        echo ''
        echo "Virtual environment is incorrect, recreating ..."
        echo ''

        rm -rf $VENV_DIR

        # Take action if $VENV_DIR exists. #
        mkdir $VENV_DIR
        $GLOBAL_PYTHON -m venv $VENV_DIR
    fi

    . $VENV_DIR/bin/activate || exit
fi

cd $SCRIPT_DIR/ComfyUI || exit

python main.py
