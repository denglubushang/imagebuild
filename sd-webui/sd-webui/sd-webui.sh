#!/bin/bash

cd /root/stable-diffusion-webui

export venv_dir=-

# https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Command-Line-Arguments-and-Settings
exec bash webui.sh -f --listen --port 7860 --xformers
