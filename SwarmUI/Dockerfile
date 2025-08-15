FROM pytorch/pytorch:2.7.1-cuda12.8-cudnn9-runtime
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

RUN apt update -y && apt install -y supervisor && \
    mkdir -p /var/log/supervisord && \
    mkdir -p /opt/supervisor && \
    apt clean

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip python3-venv wget \
        git aria2 curl && \
    apt clean

# install jupyter
RUN pip install jupyter && \
    pip install nvitop && \
    pip cache purge
COPY jupyter/jupyter.sh   /opt/supervisor/jupyter.sh
COPY jupyter/jupyter.conf /etc/supervisor/conf.d/jupyter.conf

# Download SwarmUI
COPY install.sh /root/install.sh
RUN chmod +x /root/install.sh && /root/install.sh

RUN mkdir -p /root/SwarmUI/Data

COPY swarmui/swarmui.sh         /opt/supervisor/swarmui.sh
COPY swarmui/swarmui.conf       /etc/supervisor/conf.d/swarmui.conf

# 确保启动脚本有执行权限
RUN chmod +x /opt/supervisor/swarmui.sh

# 设置DotNET环境变量
ENV DOTNET_ROOT=/root/SwarmUI/.dotnet
ENV PATH="$DOTNET_ROOT:$PATH"

# 设置SwarmUI的ComfyUI后端配置
ENV SWARMUI_COMFYUI_HOST=0.0.0.0
ENV SWARMUI_HOST=0.0.0.0
ENV COMFYUI_LISTEN=0.0.0.0

# 暴露端口
EXPOSE 7801 8888

CMD  ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

