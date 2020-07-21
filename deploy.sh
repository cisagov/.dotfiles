#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

echo "Finding dotfiles to deploy via stow..."

for d in $(find . -maxdepth 1 -mindepth 1 -type d -not -name ".git" -exec basename {} \;)
do
    stow -v -R -t ~ "$d"
done

echo "Dotfile stow deployment complete!"
