FROM pytorch/pytorch:2.7.1-cuda12.8-cudnn9-runtime
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# for China
# RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
#    sed -i 's#http://.*.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list
# install supervisord
RUN apt update -y && apt install -y supervisor && \
    mkdir -p /var/log/supervisord && \
    mkdir -p /opt/supervisor && \
    apt clean \

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip \
        git aria2 && \
    apt clean

# install jupyter
RUN pip install jupyter && \
    pip install nvitop && \
    pip cache purge
COPY jupyter/jupyter.sh   /opt/supervisor/jupyter.sh
COPY jupyter/jupyter.conf /etc/supervisor/conf.d/jupyter.conf

# install sshd
RUN apt-get install -y openssh-server && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    mkdir -p /run/sshd && \
    apt clean
COPY sshd/sshd.sh         /opt/supervisor/sshd.sh
COPY sshd/sshd.conf       /etc/supervisor/conf.d/sshd.conf

# for China
# RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && \
#     pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN cd /root && git clone https://github.com/comfyanonymous/ComfyUI && \
    cd ComfyUI && pip install -r requirements.txt

WORKDIR /root/ComfyUI

# Create model directories
RUN mkdir -p models/diffusion_models models/text_encoders models/vae

# Download HunyuanVideo main model (720p version)
RUN cd models/diffusion_models/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/TencentARC/HunyuanVideo/resolve/main/hunyuan_video_t2v_720p_bf16.safetensors -o hunyuan_video_t2v_720p_bf16.safetensors

# Download HunyuanVideo text encoders
RUN cd models/text_encoders/ && \
    aria2c -k 1M -s 10 -x 10 https://huggingface.co/TencentARC/HunyuanVideo/resolve/main/clip_l.safetensors -o clip_l.safetensors && \
    aria2c -k 1M -s 10 -x 10 https://huggingface.co/TencentARC/HunyuanVideo/resolve/main/llava_llama3_fp8_scaled.safetensors -o llava_llama3_fp8_scaled.safetensors

# Download HunyuanVideo VAE
RUN cd models/vae/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/TencentARC/HunyuanVideo/resolve/main/hunyuan_video_vae_bf16.safetensors -o hunyuan_video_vae_bf16.safetensors

# Copy HunyuanVideo supervisor configuration
COPY hunyuanvideo/hunyuanvideo.sh         /opt/supervisor/hunyuanvideo.sh
COPY hunyuanvideo/hunyuanvideo.conf       /etc/supervisor/conf.d/hunyuanvideo.conf

CMD  ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
# override defaultGraph.ts is useless, need to modify index-CaD4RONs.js 
# COPY defaultGraph.ts /root/ComfyUI/web/scripts/defaultGraph.js
