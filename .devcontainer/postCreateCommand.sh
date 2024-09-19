#!/bin/bash

# mojoproject.tomlの存在をチェック
if [ -f mojoproject.toml ]; then
    echo "mojoproject.tomlはすでに存在します。"
else
    echo "mojoproject.tomlが存在しないため、新しいプロジェクトを作成します。"
    magic init . --format mojoproject
fi

# SHELL_CONFIG="$HOME/.bashrc"

# if ! grep -q "magic shell" "$SHELL_CONFIG"; then
#     echo "新しいターミナルを開くたびに仮想環境に入るように設定します..."
#     echo "magic shell" >> "$SHELL_CONFIG"
# fi

# # 現在のシェルセッションにも設定を適用
# source "$SHELL_CONFIG"
