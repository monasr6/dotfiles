# dotfiles

Personal dotfiles for `ctrl` — zsh, git, nvim, and more.

## 📦 What's included

| File | Description |
|---|---|
| `zsh/zshrc` | Main zsh config (aliases, plugins, history, keybindings) |
| `zsh/zshenv` | Environment variables loaded for all shells |
| `zsh/p10k.zsh` | Powerlevel10k prompt config |
| `zsh/fzf.zsh` | FZF shell integration |
| `git/gitconfig` | Git user config and aliases |

## 🚀 Fresh machine setup

```bash
# 1. Clone
git clone https://github.com/monasr6/dotfiles.git ~/dotfiles

# 2. Install symlinks
bash ~/dotfiles/install.sh

# 3. Create your secrets file (NOT tracked by git)
cat > ~/.zsh_secrets << 'EOF'
export TEST="test"
EOF
chmod 600 ~/.zsh_secrets

# 4. Install Oh My Zsh (if not installed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 5. Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions          ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting       ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search  ~/.zsh/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions               ~/.zsh/zsh-completions

# 6. Symlink plugins into OMZ
ln -sf ~/.zsh/zsh-autosuggestions          ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -sf ~/.zsh/zsh-syntax-highlighting      ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -sf ~/.zsh/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/history-substring-search
ln -sf ~/.zsh/zsh-completions              ~/.oh-my-zsh/custom/plugins/zsh-completions

# 7. Install tools
sudo apt install -y fzf lsd ranger
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /usr/local -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /usr/local/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```


## ⚙️ Adding new files

```bash
cp ~/.something ~/dotfiles/category/something
# then add a line to install.sh LINKS map
git add . && git commit -m "add .something"
```
