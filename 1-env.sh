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

pip install torch torchvision torchaudio
pip install -r requirements.txt

# add plugin for https://github.com/ZHO-ZHO-ZHO/ComfyUI-InstantID

git clone https://github.com/ZHO-ZHO-ZHO/ComfyUI-InstantID.git \
    $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID

cd $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID
pip install -r requirements.txt

# 下载 InstantID/ControlNetModel 中的 config.json 和 diffusion_pytorch_model.safetensors ，
# 将模型地址填入 📷ID ControlNet Loader 节点中（例如：ComfyUI/custom_nodes/ComfyUI-InstantID/checkpoints/controlnet
mkdir -p $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/checkpoints/controlnet
wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/config.json?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/checkpoints/controlnet/config.json
wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/checkpoints/controlnet/diffusion_pytorch_model.safetensors

# 下载 InstantID/ip-adapter 中的 ip-adapter.bin ,
# 将其地址填入 📷Ipadapter_instantid Loader 节点中（例如：ComfyUI/custom_nodes/ComfyUI-InstantID/checkpoints）
wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/checkpoints/ip-adapter.bin

# 下载 DIAMONIK7777/antelopev2 中的所有模型，
# 将其放入 ComfyUI//custom_nodes/ComfyUI-InstantID/models/antelopev2 中
mkdir -p $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2
wget -c https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/1k3d68.onnx?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2/1k3d68.onnx
wget -c https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/2d106det.onnx?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2/2d106det.onnx
wget -c https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/genderage.onnx?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2/genderage.onnx
wget -c https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/glintr100.onnx?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2/glintr100.onnx
wget -c https://huggingface.co/DIAMONIK7777/antelopev2/resolve/main/scrfd_10g_bnkps.onnx?download=true \
    -O $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-InstantID/models/antelopev2/scrfd_10g_bnkps.onnx
