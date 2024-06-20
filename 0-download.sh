#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit

# clone the repository
git clone https://github.com/comfyanonymous/ComfyUI.git ComfyUI

CWD=$(pwd)
CWD=$CWD/ComfyUI

# git clone install plugins
git clone https://github.com/AIGODLIKE/AIGODLIKE-COMFYUI-TRANSLATION $CWD/custom_nodes/AIGODLIKE-COMFYUI-TRANSLATION
git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet $CWD/custom_nodes/ComfyUI-Advanced-ControlNet
git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved $CWD/custom_nodes/ComfyUI-AnimateDiff-Evolved
git clone https://github.com/asagi4/ComfyUI-CADS $CWD/custom_nodes/ComfyUI-CADS
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts $CWD/custom_nodes/ComfyUI-Custom-Scripts
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack $CWD/custom_nodes/ComfyUI-Impact-Pack
git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack $CWD/custom_nodes/ComfyUI-Inspire-Pack
git clone https://github.com/ltdrdata/ComfyUI-Manager.git $CWD/custom_nodes/ComfyUI-Manager
git clone https://github.com/shiimizu/ComfyUI-TiledDiffusion $CWD/custom_nodes/ComfyUI-TiledDiffusion
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite $CWD/custom_nodes/ComfyUI-VideoHelperSuite
git clone https://github.com/spinagon/ComfyUI-seamless-tiling $CWD/custom_nodes/ComfyUI-seamless-tiling
git clone https://github.com/blepping/ComfyUI-sonar $CWD/custom_nodes/ComfyUI-sonar
git clone https://github.com/BlenderNeko/ComfyUI_ADV_CLIP_emb $CWD/custom_nodes/ComfyUI_ADV_CLIP_emb
git clone https://github.com/BlenderNeko/ComfyUI_Cutoff $CWD/custom_nodes/ComfyUI_Cutoff
git clone https://github.com/Davemane42/ComfyUI_Dave_CustomNode $CWD/custom_nodes/ComfyUI_Dave_CustomNode
git clone https://github.com/BlenderNeko/ComfyUI_Noise $CWD/custom_nodes/ComfyUI_Noise
git clone https://github.com/BlenderNeko/ComfyUI_SeeCoder $CWD/custom_nodes/ComfyUI_SeeCoder
git clone https://github.com/cubiq/ComfyUI_essentials $CWD/custom_nodes/ComfyUI_essentials
git clone https://github.com/comfyanonymous/ComfyUI_experiments $CWD/custom_nodes/ComfyUI_experiments
git clone https://github.com/ssitu/ComfyUI_fabric $CWD/custom_nodes/ComfyUI_fabric
git clone https://github.com/lilly1987/ComfyUI_node_Lilly $CWD/custom_nodes/ComfyUI_node_Lilly
git clone https://github.com/TinyTerra/ComfyUI_tinyterraNodes $CWD/custom_nodes/ComfyUI_tinyterraNodes
git clone https://github.com/kohya-ss/ControlNet-LLLite-ComfyUI.git $CWD/custom_nodes/ControlNet-LLLite-ComfyUI
git clone https://github.com/szhublox/ambw_comfyui $CWD/custom_nodes/ambw_comfyui
git clone https://github.com/laksjdjf/attention-couple-ComfyUI $CWD/custom_nodes/attention-couple-ComfyUI
git clone https://github.com/laksjdjf/cd-tuner_negpip-ComfyUI $CWD/custom_nodes/cd-tuner_negpip-ComfyUI
git clone https://github.com/melMass/comfy_mtb $CWD/custom_nodes/comfy_mtb
git clone https://github.com/Haoming02/comfyui-diffusion-cg $CWD/custom_nodes/comfyui-diffusion-cg
git clone https://github.com/Fannovel16/comfyui_controlnet_aux $CWD/custom_nodes/comfyui_controlnet_aux
git clone https://github.com/LEv145/images-grid-comfy-plugin $CWD/custom_nodes/images-grid-comfy-plugin
git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui $CWD/custom_nodes/masquerade-nodes-comfyui
git clone https://github.com/mcmonkeyprojects/sd-dynamic-thresholding $CWD/custom_nodes/sd-dynamic-thresholding
git clone https://git.mmaker.moe/mmaker/sd-webui-color-enhance $CWD/custom_nodes/sd-webui-color-enhance
git clone https://github.com/twri/sdxl_prompt_styler $CWD/custom_nodes/sdxl_prompt_styler

# download the model
wget -c https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -P $CWD/models/checkpoints/
