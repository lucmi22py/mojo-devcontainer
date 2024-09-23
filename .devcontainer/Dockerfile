# Ubuntu 22.04 LTSの公式イメージをベースに使用
FROM ubuntu:22.04

# パッケージインストール時にインタラクティブなプロンプトが表示されないように設定
ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    build-essential \
    ca-certificates \
    sudo \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 非rootユーザー 'vscode' を作成し、sudo権限を付与
RUN useradd -m vscode && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd && \
    chmod 0440 /etc/sudoers.d/nopasswd

USER vscode
SHELL ["/bin/bash", "-c"]

# カレントディレクトリ名を引数として受け取る
ARG CURRENT_DIR
WORKDIR /workspaces/${CURRENT_DIR}

# Magicを直接インストール
RUN curl -sSL https://magic.modular.com | bash

# Magicのパスを通す（インストールスクリプトによって異なる場合があります）
ENV PATH="/home/vscode/.modular/bin:${PATH}"

# デフォルトのシェルをbashに設定
ENV SHELL=/bin/bash

# エントリーポイントをbashに設定
CMD [ "bash" ]
