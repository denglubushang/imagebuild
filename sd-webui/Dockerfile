FROM cuda:12.2.2-devel-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# 设置环境变量以支持 root
ENV can_run_as_root=1

RUN apt update -y && apt install -y supervisor && \
    mkdir -p /var/log/supervisord && \
    mkdir -p /opt/supervisor && \
    apt clean

# install system packages
RUN apt update -y && apt install -y \
        wget git python3 python3-venv python3-pip libgl1 libglib2.0-0 git-lfs \
        bzip2 libx11-6 vim net-tools iproute2 curl && \
    apt clean

# install jupyter
RUN pip install jupyter && \
    pip install nvitop && \
    pip cache purge
    
COPY jupyter/jupyter.sh   /opt/supervisor/jupyter.sh
COPY jupyter/jupyter.conf /etc/supervisor/conf.d/jupyter.conf

WORKDIR /root

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

WORKDIR /root/stable-diffusion-webui

RUN pip install -r requirements.txt

COPY sd-webui/sd-webui.sh   /opt/supervisor/sd-webui.sh
COPY sd-webui/sd-webui.conf /etc/supervisor/conf.d/sd-webui.conf

CMD  ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
