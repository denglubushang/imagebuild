#!/bin/sh
git clone https://github.com/cocktailpeanut/fluxgym.git /app/fluxgym;
git clone -b sd3 https://github.com/kohya-ss/sd-scripts /app/fluxgym/sd-scripts;

cd /app/fluxgym/sd-scripts &&
pip install -r requirements.txt &&
echo "fluxgym requirements installed successfully.";

cd /app/fluxgym &&
pip install -r requirements.txt &&
echo "fluxgym requirements installed successfully.";

pip install --pre torch==2.4 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121 &&
echo "PyTorch installed successfully.";
pip install jupyterlab

echo "Downloading models..." &&
wget -O /app/fluxgym/models/unet/flux1-dev.sft https://huggingface.co/cocktailpeanut/xulf-dev/resolve/main/flux1-dev.sft?download=true &&
wget -O /app/fluxgym/models/unet/flux1-schnell.safetensors https://huggingface.co/cocktailpeanut/xulf-schnell/resolve/main/flux1-schnell.safetensors?download=true &&
wget -O /app/fluxgym/models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true &&
wget -O /app/fluxgym/models/clip/t5xxl_fp16.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors?download=true &&
wget -O /app/fluxgym/models/vae/ae.sft https://huggingface.co/cocktailpeanut/xulf-dev/resolve/main/ae.sft?download=true &&
echo "Models downloaded successfully.";

export GRADIO_SERVER_NAME="0.0.0.0"
nohup bash -c "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token= --NotebookApp.password= --NotebookApp.allow_origin=* & python /app/fluxgym/app.py" > combined.log 2>&1 &&

python --version