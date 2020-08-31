#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

echo "Finding dotfiles to deploy via stow..."

find . -maxdepth 1 -mindepth 1 -type d -not -name ".git" -exec echo stow -v -R -t ~ "$(basename {})" \;

echo "Dotfile stow deployment complete!"
