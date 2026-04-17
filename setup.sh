#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v stow &>/dev/null; then
    echo "Installing stow..."
    brew install stow
fi

PACKAGES=(ghostty nvim ohmyposh tmux zsh)

for pkg in "${PACKAGES[@]}"; do
    echo "Stowing $pkg..."
    stow --target="$HOME" --dir="$DOTFILES_DIR" "$pkg"
done

echo "Done."
