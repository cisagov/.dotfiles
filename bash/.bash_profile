#!/bin/bash

# Workaround to get macOS to use .bashrc
if [[ "$OSTYPE" == "darwin"* ]] && [ -r "$HOME/.bashrc" ]; then
  # shellcheck source=/dev/null
  source "$HOME/.bashrc"
fi
