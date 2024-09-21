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
WORKDIR /workspaces/mojo
SHELL ["/bin/bash", "-c"]

# Magicを直接インストール
RUN curl -sSL https://magic.modular.com | bash

# Magicのパスを通す（インストールスクリプトによって異なる場合があります）
ENV PATH="/home/vscode/.modular/bin:${PATH}"

# プロジェクトの初期化: magic.yamlが存在しない場合のみプロジェクトを初期化
RUN if [ ! -f ./magic.yaml ]; then magic init . --format mojoproject; fi

# magic shell-hook を設定し、bashの初期化ファイルに追加
RUN magic shell-hook --shell bash >> ~/.bashrc

# シェルプロファイルに.bashrcを読み込む設定を追加（ログインシェル用）
RUN echo 'source ~/.bashrc' >> ~/.bash_profile

# デフォルトのシェルをbashに設定
ENV SHELL=/bin/bash

# エントリーポイントをbashに設定
CMD [ "bash" ]
