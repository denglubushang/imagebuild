# Use CUDA-enabled Python base image
FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    software-properties-common \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    libgcc-s1 \
    libstdc++6 \
    vim net-tools iproute2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the project
RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git .


RUN pip3 install --no-cache-dir -r requirements_versions.txt

# Install PyTorch (CUDA 12.1 version)
RUN pip3 install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

RUN cd models/Stable-diffusion && wget --continue -O v1-5-pruned.safetensors "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors"

RUN pip3 install --no-cache-dir joblib

# Set startup command
CMD ["python3", "launch.py", "--listen", "--port", "7860", "--enable-insecure-extension-access"]
