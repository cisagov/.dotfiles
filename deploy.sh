#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

echo "Finding dotfiles to deploy via stow..."

find . -maxdepth 1 -mindepth 1 -type d -not -name ".git" -exec basename {} \; > tmp
while IFS= read -r d
do
  stow -v -R -t ~ "$d"
done < tmp
rm tmp

echo "Dotfile stow deployment complete!"
