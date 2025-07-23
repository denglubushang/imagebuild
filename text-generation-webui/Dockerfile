FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip \
        git git-lfs curl wget ca-certificates \
        sudo bzip2 libx11-6 vim net-tools iproute2 && \
    apt clean

RUN wget https://github.com/oobabooga/text-generation-webui/releases/download/v3.8/textgen-portable-3.8-linux-cuda12.4.zip && \
    unzip textgen-portable-3.8-linux-cuda12.4.zip && \
    rm textgen-portable-3.8-linux-cuda12.4.zip

WORKDIR /root/text-generation-webui

CMD ["/root/text-generation-webui/start_linux.sh"]
