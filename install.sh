#!/usr/bin/env bash
# =============================================================================
# install.sh — symlink dotfiles into $HOME
# Usage: bash ~/dotfiles/install.sh
# =============================================================================
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Color helpers
green() { echo -e "\033[0;32m$*\033[0m"; }
yellow() { echo -e "\033[1;33m$*\033[0m"; }
red()   { echo -e "\033[0;31m$*\033[0m"; }

# Files to symlink: source (relative to dotfiles/) → target in $HOME
declare -A LINKS=(
  ["zsh/zshrc"]=".zshrc"
  ["zsh/zshenv"]=".zshenv"
  ["zsh/p10k.zsh"]=".p10k.zsh"
  ["zsh/fzf.zsh"]=".fzf.zsh"
  ["git/gitconfig"]=".gitconfig"
)

echo ""
yellow "🔗 Installing dotfiles from $DOTFILES_DIR"
echo ""

for src_rel in "${!LINKS[@]}"; do
  target_rel="${LINKS[$src_rel]}"
  src="$DOTFILES_DIR/$src_rel"
  target="$HOME/$target_rel"

  if [[ ! -f "$src" ]]; then
    yellow "  ⚠️  Skipping $src_rel (file not found)"
    continue
  fi

  # Backup existing file (not symlink)
  if [[ -f "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak.$(date +%Y%m%d_%H%M%S)"
    yellow "  📦 Backed up existing $target_rel"
  fi

  ln -sf "$src" "$target"
  green "  ✅ $target_rel → $src_rel"
done

echo ""
green "Done! Open a new terminal or run: source ~/.zshrc"
echo ""
yellow "⚠️  Don't forget to create ~/.zsh_secrets with your tokens (not tracked by git)"
