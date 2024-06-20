#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit

# --- For AutoDL Network ---
if [ -f /etc/network_turbo ]; then
    . /etc/network_turbo
fi
# --- For AutoDL Network ---

# clone the repository
git clone https://github.com/comfyanonymous/ComfyUI.git $SCRIPT_DIR/ComfyUI

# clone or pull plugins
git clone https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION $SCRIPT_DIR/ComfyUI/custom_nodes/AIGODLIKE-COMFYUI-TRANSLATION
git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-Advanced-ControlNet
git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-AnimateDiff-Evolved
git clone https://github.com/asagi4/ComfyUI-CADS $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-CADS
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-Custom-Scripts
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-Impact-Pack
git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-Inspire-Pack
git clone https://github.com/ltdrdata/ComfyUI-Manager.git $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-Manager
git clone https://github.com/shiimizu/ComfyUI-TiledDiffusion $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-TiledDiffusion
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite
git clone https://github.com/spinagon/ComfyUI-seamless-tiling $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-seamless-tiling
git clone https://github.com/blepping/ComfyUI-sonar $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI-sonar
git clone https://github.com/BlenderNeko/ComfyUI_ADV_CLIP_emb $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_ADV_CLIP_emb
git clone https://github.com/BlenderNeko/ComfyUI_Cutoff $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_Cutoff
git clone https://github.com/Davemane42/ComfyUI_Dave_CustomNode $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_Dave_CustomNode
git clone https://github.com/BlenderNeko/ComfyUI_Noise $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_Noise
git clone https://github.com/BlenderNeko/ComfyUI_SeeCoder $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_SeeCoder
git clone https://github.com/cubiq/ComfyUI_essentials $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_essentials
git clone https://github.com/comfyanonymous/ComfyUI_experiments $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_experiments
git clone https://github.com/ssitu/ComfyUI_fabric $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_fabric
git clone https://github.com/lilly1987/ComfyUI_node_Lilly $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_node_Lilly
git clone https://github.com/TinyTerra/ComfyUI_tinyterraNodes $SCRIPT_DIR/ComfyUI/custom_nodes/ComfyUI_tinyterraNodes
git clone https://github.com/kohya-ss/ControlNet-LLLite-ComfyUI.git $SCRIPT_DIR/ComfyUI/custom_nodes/ControlNet-LLLite-ComfyUI
git clone https://github.com/szhublox/ambw_comfyui $SCRIPT_DIR/ComfyUI/custom_nodes/ambw_comfyui
git clone https://github.com/laksjdjf/attention-couple-ComfyUI $SCRIPT_DIR/ComfyUI/custom_nodes/attention-couple-ComfyUI
git clone https://github.com/laksjdjf/cd-tuner_negpip-ComfyUI $SCRIPT_DIR/ComfyUI/custom_nodes/cd-tuner_negpip-ComfyUI
git clone https://github.com/melMass/comfy_mtb $SCRIPT_DIR/ComfyUI/custom_nodes/comfy_mtb
git clone https://github.com/Haoming02/comfyui-diffusion-cg $SCRIPT_DIR/ComfyUI/custom_nodes/comfyui-diffusion-cg
git clone https://github.com/Fannovel16/comfyui_controlnet_aux $SCRIPT_DIR/ComfyUI/custom_nodes/comfyui_controlnet_aux
git clone https://github.com/LEv145/images-grid-comfy-plugin $SCRIPT_DIR/ComfyUI/custom_nodes/images-grid-comfy-plugin
git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui $SCRIPT_DIR/ComfyUI/custom_nodes/masquerade-nodes-comfyui
git clone https://github.com/mcmonkeyprojects/sd-dynamic-thresholding $SCRIPT_DIR/ComfyUI/custom_nodes/sd-dynamic-thresholding
git clone https://git.mmaker.moe/mmaker/sd-webui-color-enhance $SCRIPT_DIR/ComfyUI/custom_nodes/sd-webui-color-enhance
git clone https://github.com/twri/sdxl_prompt_styler $SCRIPT_DIR/ComfyUI/custom_nodes/sdxl_prompt_styler

# download the model
wget -c https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -O $SCRIPT_DIR/ComfyUI/models/checkpoints/sd_xl_base_1.0.safetensors
