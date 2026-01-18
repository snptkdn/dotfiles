#!/bin/bash

# このスクリプトの場所を取得
DOTFILES_DIR=$(cd $(dirname $0); pwd)

echo "Setting up dotfiles..."

# GNU Stow がインストールされているか確認
if ! command -v stow >/dev/null 2>&1; then
    echo "Error: GNU Stow is not installed. Please install it first."
    exit 1
fi

# .config ディレクトリが存在することを確認
mkdir -p ~/.config

# stow を実行
# -v: 詳細表示
# -t ~: ホームディレクトリをターゲットにする
# -R: 既存のリンクを再作成（更新時に便利）
# .config: dotfiles/.config の中身を ~/.config に展開
cd "$DOTFILES_DIR"
stow -v -R -t ~ .config

echo "Done! Symlinks created/updated."
