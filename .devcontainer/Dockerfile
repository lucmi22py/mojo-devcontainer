# ベースイメージを指定
FROM mcr.microsoft.com/devcontainers/base:jammy

# デフォルトのシェルをbashに設定
SHELL ["/bin/bash", "-c"]

# 'vscode' ユーザーとして実行
USER vscode

# 'magic'をインストールし、PATHを設定
RUN curl -sSL https://magic.modular.com | bash && \
    echo 'export PATH="$HOME/.modular/bin:$PATH"' >> ~/.bashrc

# 環境変数PATHを永続的に設定
ENV PATH="/home/vscode/.modular/bin:$PATH"

# 必要に応じて、作業ディレクトリを設定（例: /workspace）
# WORKDIR /workspace
