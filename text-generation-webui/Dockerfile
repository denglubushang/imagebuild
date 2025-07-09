# BUILDER
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

WORKDIR /builder
ARG TORCH_CUDA_ARCH_LIST="${TORCH_CUDA_ARCH_LIST:-3.5;5.0;6.0;6.1;7.0;7.5;8.0;8.6+PTX}"
ARG BUILD_EXTENSIONS="${BUILD_EXTENSIONS:-}"
ARG APP_UID="${APP_UID:-6972}"
ARG APP_GID="${APP_GID:-6972}"

RUN apt update && \
    apt install --no-install-recommends -y git vim build-essential python3-dev pip bash curl && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/app/

RUN git clone https://github.com/oobabooga/text-generation-webui.git 

WORKDIR /home/app/text-generation-webui

RUN GPU_CHOICE=A LAUNCH_AFTER_INSTALL=FALSE INSTALL_EXTENSIONS=TRUE ./start_linux.sh --verbose

COPY /user_data/CMD_FLAGS.txt /home/app/text-generation-webui/user_data


WORKDIR /home/app/text-generation-webui
# set umask to ensure group read / write at runtime
CMD umask 0002 && export HOME=/home/app/text-generation-webui && ./start_linux.sh --listen