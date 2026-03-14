#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
SCRIPT_DIR="$(realpath "${BASEDIR}")"

cd "${SCRIPT_DIR}" || exit

cd "${SCRIPT_DIR}/ComfyUI/custom_nodes" || exit

# pull plugins

FOLDERS=$(ls -d */ | cut -f1 -d'/')

for FOLDER in $FOLDERS; do
    if [ -d "$FOLDER/.git" ]; then
        echo "Updating $FOLDER..."
        cd "$FOLDER" || continue
        git pull
        cd ..
    else
        echo "Skipping $FOLDER (not a git repository)"
    fi
done
