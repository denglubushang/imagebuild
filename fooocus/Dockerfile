FROM ghcr.io/lllyasviel/fooocus:edge

# 确保以root权限执行apt命令
USER root

RUN apt update -y && apt install -y aria2 && apt clean

# 创建必要的目录结构
RUN mkdir -p /content/app/models/vae_approx/ && \
    mkdir -p /content/app/models/prompt_expansion/fooocus_expansion/ && \
    mkdir -p /content/data/models/checkpoints/ && \
    mkdir -p /content/data/models/loras/

RUN cd /content/app/models/vae_approx/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/lllyasviel/misc/resolve/main/xlvaeapp.pth -o xlvaeapp.pth

RUN cd /content/app/models/vae_approx/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/lllyasviel/misc/resolve/main/vaeapp_sd15.pt -o vaeapp_sd15.pt

RUN cd /content/app/models/vae_approx/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/mashb1t/misc/resolve/main/xl-to-v1_interposer-v4.0.safetensors -o xl-to-v1_interposer-v4.0.safetensors

RUN cd /content/app/models/prompt_expansion/fooocus_expansion/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/lllyasviel/misc/resolve/main/fooocus_expansion.bin -o pytorch_model.bin

RUN cd /content/data/models/checkpoints/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/lllyasviel/fav_models/resolve/main/fav/juggernautXL_v8Rundiffusion.safetensors -o juggernautXL_v8Rundiffusion.safetensors

RUN cd /content/data/models/loras/ && aria2c -k 1M -s 10 -x 10 https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_offset_example-lora_1.0.safetensors -o sd_xl_offset_example-lora_1.0.safetensors

# 切换回非root用户（如果需要的话）
USER user

