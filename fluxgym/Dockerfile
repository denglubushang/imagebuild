# Base image with CUDA 12.2
FROM nvidia/cuda:12.2.2-base-ubuntu22.04

# Install pip if not already installed
RUN apt-get update -y && apt-get install -y \
    python3-pip \
    python3-dev \
    git \
    build-essential  # Install dependencies for building extensions

# Define environment variables for UID and GID and local timezone
ENV PUID=${PUID:-1000}
ENV PGID=${PGID:-1000}

# Create a group with the specified GID
RUN groupadd -g "${PGID}" appuser
# Create a user with the specified UID and GID
RUN useradd -m -s /bin/sh -u "${PUID}" -g "${PGID}" appuser

WORKDIR /app

# Get sd-scripts from kohya-ss and install them
RUN git clone -b sd3 https://github.com/kohya-ss/sd-scripts && \
    cd sd-scripts && \
    pip install --no-cache-dir -r ./requirements.txt && \
    cd .. && \
    rm -rf sd-scripts

# Clone fluxgym repository
RUN git clone https://github.com/cocktailpeanut/fluxgym

# Install main application dependencies
RUN cd fluxgym && pip install --no-cache-dir -r ./requirements.txt

# Install Torch, Torchvision, and Torchaudio for CUDA 12.2
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu122/torch_stable.html

# Set ownership after all installations
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Copy fluxgym application code
EXPOSE 7860

ENV GRADIO_SERVER_NAME="0.0.0.0"

WORKDIR /app/fluxgym

# Run fluxgym Python application
CMD ["python3", "./app.py"]