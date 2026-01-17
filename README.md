This config should work on Linux and Mac.

For example, here's how I would install it on Debian:
```sh
# Get tools and config
sudo apt install lazygit tmux nvim fish gdb
git clone https://github.com/alorans/dotfiles ~/.config

# Dependencies
sudo apt install fzf curl npm cargo build-essential pkg-config unzip
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux and nvim once to install their configurations
```
