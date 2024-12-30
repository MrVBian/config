#!/bin/bash

# 复制 .config 文件夹
mkdir -p ~/.config
cp -r ./config/alacritty ~/.config/
cp -r ./config/ranger ~/.config/
cp -r ./config/tmux ~/.config/

# 复制其他 dotfiles
cp -r .tmux .tmux.conf .tmux-powerlinerc.default .oh-my-zsh .p10k.zsh .zshrc ~/

# 安装必要软件
sudo apt update
sudo apt install -y zsh tmux git

# 切换默认 shell 为 zsh
chsh -s $(which zsh)

echo "Dotfiles setup complete! Please restart your terminal."
