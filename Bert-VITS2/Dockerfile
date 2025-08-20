# Use NVIDIA CUDA base image for GPU support
FROM nvidia/cuda:11.8-devel-ubuntu20.04

# Set working directory
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DEBIAN_FRONTEND=noninteractive \
    VIRTUAL_ENV=/opt/venv \
    PATH="/opt/venv/bin:$PATH" \
    CUDA_HOME=/usr/local/cuda \
    PATH="/usr/local/cuda/bin:$PATH" \
    LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# Install system dependencies and Python
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    ffmpeg \
    libsndfile1 \
    libasound2-dev \
    portaudio19-dev \
    python3-dev \
    python3-pip \
    python3-venv \
    pkg-config \
    cmake \
    libsox-dev \
    libsoxr-dev \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Create virtual environment
RUN python3 -m venv /opt/venv

# Activate virtual environment and upgrade pip
RUN . /opt/venv/bin/activate && pip install --upgrade pip

# Clone Bert-VITS2 project
RUN git clone https://github.com/fishaudio/Bert-VITS2.git && \
    cd Bert-VITS2 && \
    git checkout master

# Change working directory to Bert-VITS2
WORKDIR /app/Bert-VITS2

# Activate virtual environment and install dependencies
RUN . /opt/venv/bin/activate && \
    pip install -r requirements.txt --no-cache-dir

# Install additional required dependencies in virtual environment
RUN . /opt/venv/bin/activate && \
    pip install soxr --no-cache-dir

# Upgrade transformers to a compatible version in virtual environment
RUN . /opt/venv/bin/activate && \
    pip install --upgrade transformers>=4.35.0 --no-cache-dir

# Install PyTorch GPU version (CUDA 11.8 compatible)
RUN . /opt/venv/bin/activate && \
    pip install \
    torch==2.1.0+cu118 \
    torchaudio==2.1.0+cu118 \
    torchvision==0.16.0+cu118 \
    --index-url https://download.pytorch.org/whl/cu118 \
    --no-cache-dir

# Create necessary directories
RUN mkdir -p Data logs models filelists configs

# Set permissions
RUN chmod +x *.py

# Set default command (using virtual environment)
CMD ["/opt/venv/bin/python", "webui.py"]
