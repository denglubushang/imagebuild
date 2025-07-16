# SwarmUI Dockerfile
FROM ubuntu:22.04

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive
ENV DOTNET_ROOT=/opt/dotnet
ENV PATH="$DOTNET_ROOT:$PATH"
ENV ASPNETCORE_URLS=http://+:7801
ENV SWARMUI_HOST=0.0.0.0
ENV SWARMUI_PORT=7801

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    ca-certificates \
    build-essential \
    libicu70 \
    libssl3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 下载 SwarmUI 源码
RUN git clone https://github.com/mcmonkeyprojects/SwarmUI.git && \
    cd SwarmUI

# 设置工作目录为 SwarmUI
WORKDIR /app/SwarmUI

# 下载并安装 .NET
RUN cd launchtools && \
    rm -f dotnet-install.sh && \
    wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x dotnet-install.sh && \
    cd ..

# 安装 .NET 8.0 运行时和 SDK
RUN ./launchtools/dotnet-install.sh --channel 8.0 --runtime aspnetcore --install-dir $DOTNET_ROOT && \
    ./launchtools/dotnet-install.sh --channel 8.0 --install-dir $DOTNET_ROOT

# 创建非root用户
RUN groupadd -r swarmui && useradd -r -g swarmui -d /app swarmui

# 设置权限
RUN chown -R swarmui:swarmui /app

# 切换到非root用户
USER swarmui

# 暴露端口
EXPOSE 7801

# 启动命令
CMD ["./launch-linux.sh", "--host", "0.0.0.0", "--port", "7801"]
