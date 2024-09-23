#!/bin/bash
set -e

echo "Initializing mojo project..."

if [ ! -f mojoproject.yaml ]; then
    magic init . --format mojoproject
    echo "mojo project initialized."
else
    echo "mojo project already initialized."
fi

# magic shell-hook を設定し、bashの初期化ファイルに追加
magic shell-hook --shell bash >> ~/.bashrc

# シェルプロファイルに.bashrcを読み込む設定を追加（ログインシェル用）
echo 'source ~/.bashrc' >> ~/.bash_profile