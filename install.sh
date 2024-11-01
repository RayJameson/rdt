#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

case "$SHELL" in
    *zsh)
        ZSH_DIR=${ZDOTDIR:-$HOME}
        echo "Adding completion function for zsh"
        if [[ ! -d "$HOME"/.zfunc ]]; then
            mkdir "$HOME/.zfunc"
            echo "fpath+=$HOME/.zfunc" >> "$ZSH_DIR/.zshrc"
            # NOTE: potential bug, in case if ~/.zfunc dir exists but not added to "fpath" in the .zshrc
        fi
        cp -u ./completion/zsh/_rdt "$HOME/.zfunc"
        echo "Added completion function file to ~/.zfunc dir"
        ;;
    *bash | *ksh | *fish)
        echo "Only zsh completion is supported atm"
        ;;
    *)
        echo "Unknown shell type, can't install completion"
        ;;
esac

script_location=${1:-/usr/local/bin}
chmod +x ./rdt
cp ./rdt "$script_location"
echo "Installed rdt to $script_location"
