#!/bin/bash

# Workaround to get macOS to use .bashrc
if [[ "$OSTYPE" == "darwin"* ]] && [ -r "$HOME/.bashrc" ]; then
  # shellcheck disable=SC1090
  source "$HOME/.bashrc"
fi
