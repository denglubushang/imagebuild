# Use official Python 3.10 image as base
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    ffmpeg \
    libsndfile1 \
    libasound2-dev \
    portaudio19-dev \
    python3-dev \
    pkg-config \
    cmake \
    libsox-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Clone Bert-VITS2 project to working directory
RUN git clone https://github.com/fishaudio/Bert-VITS2.git . && \
    git checkout master

# Install project dependencies
RUN pip install -r requirements.txt --no-cache-dir

# Install additional required dependencies that are not in requirements.txt
RUN pip install soxr --no-cache-dir

# Upgrade transformers to a compatible version
RUN pip install --upgrade transformers>=4.35.0 --no-cache-dir

# Install PyTorch CPU version (updated to 2.1.0)
RUN pip install \
    torch==2.1.0+cpu \
    torchaudio==2.1.0+cpu \
    torchvision==0.16.0+cpu \
    --index-url https://download.pytorch.org/whl/cpu \
    --no-cache-dir

# Create necessary directories
RUN mkdir -p Data logs models filelists configs

# Set permissions
RUN chmod +x *.py

# Set default command
CMD ["python", "webui.py"]
