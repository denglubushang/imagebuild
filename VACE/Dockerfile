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

# for China
# RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && \
#     pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN cd /root && git clone https://github.com/comfyanonymous/ComfyUI && \
    cd ComfyUI && pip install -r requirements.txt

WORKDIR /root/ComfyUI

#Download comfyui-manager
RUN cd /root/ComfyUI/custom_nodes && git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager

# Download Wan2.1vace main model (720p version)
RUN cd models/diffusion_models/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_vace_1.3B_fp16.safetensors -o wan2.1_vace_1.3B_fp16.safetensors

# Download wan2.1 text encoders
RUN cd models/text_encoders/ && \
    aria2c -k 1M -s 10 -x 10 https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors -o umt5_xxl_fp16.safetensors 

# Download wan2.1 VAE
RUN cd models/vae/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors -o wan_2.1_vae.safetensors

#Download wan21lora model
RUN cd models/loras/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_bidirect2_T2V_1_3B_lora_rank32.safetensors -o Wan21_CausVid_bidirect2_T2V_1_3B_lora_rank32.safetensors

# Copy comfyui supervisor configuration
COPY comfyui/comfyui.sh         /opt/supervisor/comfyui.sh
COPY comfyui/comfyui.conf       /etc/supervisor/conf.d/comfyui.conf

#Copy wan2.1vace default workflow
COPY comfyui/wan_vace_i2v.json /root/ComfyUI/user/default/workflows/wan_vace_i2v.json
COPY comfyui/wan_vace_t2v.json /root/ComfyUI/user/default/workflows/wan_vace_t2v.json
COPY comfyui/wan_vace_v2v.json /root/ComfyUI/user/default/workflows/wan_vace_v2v.json

CMD  ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
# override defaultGraph.ts is useless, need to modify index-CaD4RONs.js 
# COPY defaultGraph.ts /root/ComfyUI/web/scripts/defaultGraph.js
