FROM pytorch/pytorch:2.7.1-cuda12.8-cudnn9-runtime
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

RUN apt update -y && apt install -y supervisor && \
    mkdir -p /var/log/supervisord && \
    mkdir -p /opt/supervisor && \
    apt clean \

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip python3-venv wget\
        git aria2 curl && \
    apt clean

# install jupyter
RUN pip install jupyter && \
    pip install nvitop && \
    pip cache purge
COPY jupyter/jupyter.sh   /opt/supervisor/jupyter.sh
COPY jupyter/jupyter.conf /etc/supervisor/conf.d/jupyter.conf

# 下载并准备SwarmUI，但不在构建时运行
RUN cd /root && \
    git clone https://github.com/mcmonkeyprojects/SwarmUI.git && \
    cd SwarmUI

WORKDIR /root/SwarmUI

# 下载并安装 .NET（避免在构建时启动SwarmUI）
RUN cd launchtools && \
    rm -f dotnet-install.sh && \
    wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x dotnet-install.sh && \
    cd .. && \
    ./launchtools/dotnet-install.sh --channel 8.0 --runtime aspnetcore && \
    ./launchtools/dotnet-install.sh --channel 8.0

# 添加.NET到PATH
ENV DOTNET_ROOT=/root/.dotnet
ENV PATH="$DOTNET_ROOT:$PATH"

COPY swarmui/swarmui.sh         /opt/supervisor/swarmui.sh
COPY swarmui/swarmui.conf       /etc/supervisor/conf.d/swarmui.conf

CMD  ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]