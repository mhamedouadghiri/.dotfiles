#!/bin/bash
set -euo pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$HOME" == "$SCRIPT_DIR" ]; then
  echo "YOU ARE IN YOUR HOME DIRECTORY..."
  echo "ABORTING..."
  exit
fi

for f in .vimrc .bash_aliases .gitconfig ; do
  if [ -e "$HOME/$f" ]; then
    rm "$HOME/$f"
  fi
  cp "$SCRIPT_DIR/$f" "$HOME/$f"
done

echo "source <(kubectl completion bash)" >> "$HOME"/.bashrc
echo "alias k='kubectl'" >> "$HOME"/.bashrc
echo "complete -F __start_kubectl k" >> "$HOME"/.bashrc

echo "SETUP COMPLETE"
echo "OPEN A NEW TERMINAL TO TAKE EFFECT"
