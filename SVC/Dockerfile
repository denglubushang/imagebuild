# So-VITS-SVC Docker镜像
# 支持GPU加速的歌声转换系统，从GitHub直接克隆源代码

# 使用NVIDIA官方PyTorch镜像作为基础
FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV CUDA_VISIBLE_DEVICES=0

# 设置工作目录
WORKDIR /app

# 安装系统依赖和git
RUN apt-get update && apt-get install -y \
    python3.9 python3.9-dev python3-pip wget curl git ffmpeg libsndfile1 \
    libasound2-dev portaudio19-dev libportaudio2 libportaudiocpp0 pulseaudio libgl1-mesa-glx libglib2.0-0 \
    libsm6 libxext6 libxrender-dev libgomp1 build-essential cmake pkg-config libopenblas-dev liblapack-dev gfortran \
    && rm -rf /var/lib/apt/lists/*

# 设置Python3.9为默认
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1

# 升级pip
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN pip install pip<24.1

# 安装PyTorch和相关依赖（与CUDA 11.8兼容）
RUN pip3 install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 -f https://download.pytorch.org/whl/torch_stable.html

# 从GitHub克隆源代码（替换本地COPY）
RUN git clone https://github.com/svc-develop-team/so-vits-svc.git /app && \
    cd /app && \
    git checkout 4.1-Stable

# 复制启动脚本和健康检查脚本
COPY start.sh /app/start.sh

# 安装Python依赖
RUN pip3 install -r requirements.txt

# 安装额外的系统级依赖
RUN pip3 install --no-cache-dir \
    praat-parselmouth \
    pyworld \
    scikit-maad \
    local_attention \
    && rm -rf /root/.cache/pip

# 创建必要的目录结构
RUN mkdir -p /app/pretrain /app/logs/44k /app/dataset_raw /app/filelists /app/trained

# 设置文件权限
RUN chmod +x /app/webUI.py /app/train.py /app/inference_main.py /app/start.sh

# 下载预训练模型（可选，ContentVec模型）
RUN wget -O /app/pretrain/checkpoint_best_legacy_500.pt https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main/hubert_base.pt

# 设置默认启动命令
CMD ["bash", "/app/start.sh", "webui"]
