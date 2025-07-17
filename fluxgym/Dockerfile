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
        python3 python-is-python3 python3-pip wget\
        git aria2 && \
    apt clean

# install jupyter
RUN pip install jupyter && \
    pip install nvitop && \
    pip cache purge
COPY jupyter/jupyter.sh   /opt/supervisor/jupyter.sh
COPY jupyter/jupyter.conf /etc/supervisor/conf.d/jupyter.conf

RUN git clone https://github.com/cocktailpeanut/fluxgym.git /app/fluxgym && \
    git clone -b sd3 https://github.com/kohya-ss/sd-scripts /app/fluxgym/sd-scripts && \
    cd /app/fluxgym/sd-scripts && \
    pip install -r requirements.txt && \
    cd /app/fluxgym && \
    pip install -r requirements.txt

# Downloading models
RUN wget -O /app/fluxgym/models/unet/flux1-dev.sft https://huggingface.co/cocktailpeanut/xulf-dev/resolve/main/flux1-dev.sft?download=true && \
    wget -O /app/fluxgym/models/unet/flux1-schnell.safetensors https://huggingface.co/cocktailpeanut/xulf-schnell/resolve/main/flux1-schnell.safetensors?download=true && \
    wget -O /app/fluxgym/models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true && \
    wget -O /app/fluxgym/models/clip/t5xxl_fp16.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors?download=true && \
    wget -O /app/fluxgym/models/vae/ae.sft https://huggingface.co/cocktailpeanut/xulf-dev/resolve/main/ae.sft?download=true

WORKDIR /app/fluxgym
CMD ["python3", "/app/fluxgym/app.py"]

