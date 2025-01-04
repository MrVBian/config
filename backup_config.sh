#!/bin/bash

# 定义目标目录
CONFIG_DIR=~/config

# # 检查是否已经存在 config 目录
# if [ -d "$CONFIG_DIR" ]; then
# 	echo "目录 $CONFIG_DIR 已经存在。请手动删除或选择其他路径。"
# 	exit 1
# fi

# 创建 config 目录和子目录
mkdir -p "$CONFIG_DIR/config"
echo "创建目录 $CONFIG_DIR"

# 需要拷贝的 .config 子目录
CONFIG_FILES=("alacritty" "ranger" "tmux")

# 拷贝 .config 下的文件夹
for config in "${CONFIG_FILES[@]}"; do
	if [ -d "$HOME/.config/$config" ]; then
		cp -r "$HOME/.config/$config" "$CONFIG_DIR/config/"
		echo "拷贝 $HOME/.config/$config 到 $CONFIG_DIR/config/"
	else
		echo "警告: $HOME/.config/$config 不存在，跳过..."
	fi
done

# 需要拷贝的其他 dotfiles
DOTFILES=(
	".tmux"
	".tmux.conf"
	".tmux-powerlinerc.default"
	".oh-my-zsh"
	".p10k.zsh"
	".zshrc"
)

# 拷贝其他文件和目录
for file in "${DOTFILES[@]}"; do
	if [ -e "$HOME/$file" ]; then
		cp -r "$HOME/$file" "$CONFIG_DIR/"
		echo "拷贝 $HOME/$file 到 $CONFIG_DIR/"
	else
		echo "警告: $HOME/$file 不存在，跳过..."
	fi
done

# 显示结果
echo "备份完成！目录结构如下："
tree "$CONFIG_DIR"

# 提示下一步操作
echo "接下来你可以进入 $CONFIG_DIR，初始化 Git 仓库，并将其推送到 GitHub。"
