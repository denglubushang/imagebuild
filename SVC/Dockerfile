# 使用CUDA 11.8 + Python 3.8作为基础镜像（支持GPU）
FROM nvidia/cuda:11.8-devel-ubuntu20.04

# 设置工作目录
WORKDIR /app

# 设置环境变量
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive
ENV CUDA_HOME=/usr/local/cuda
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}

# 安装Python 3.8和系统依赖
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3.8-dev \
    python3.8-distutils \
    python3-pip \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    ffmpeg \
    libsndfile1 \
    libsndfile1-dev \
    portaudio19-dev \
    libasound2-dev \
    libffi-dev \
    libssl-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# 设置Python 3.8为默认版本
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1

# 安装PyTorch GPU版本（CUDA 11.8兼容）
RUN pip3 install --no-cache-dir torch==1.13.1+cu118 torchaudio==0.13.1+cu118 -f https://download.pytorch.org/whl/torch_stable.html

# 从GitHub克隆项目代码
RUN git clone https://github.com/svc-develop-team/so-vits-svc.git /app && \
    cd /app && \
    git checkout 4.1-Stable

# 复制GPU版本的requirements文件到容器中
COPY requirements_gpu.txt /app/requirements.txt

# 安装Python依赖
RUN pip3 install --no-cache-dir -r requirements.txt

# 下载预训练模型（ContentVec）
RUN wget -P pretrain/ https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/hubert_base.pt -O pretrain/checkpoint_best_legacy_500.pt

# 设置权限
RUN chmod +x *.py

# 暴露端口（Web UI和Flask API）
EXPOSE 7860 6842

# 复制启动脚本
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# 默认启动Web UI
CMD ["/app/run.sh" "webui"]
