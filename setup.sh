#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v stow &>/dev/null; then
    echo "Installing stow..."
    brew install stow
fi

echo "Stowing ghostty and nvim..."
stow --target="$HOME/.config" --dir="$DOTFILES_DIR" ghostty nvim

echo "Stowing tmux and zsh..."
stow --target="$HOME" --dir="$DOTFILES_DIR" tmux zsh

echo "Done."
