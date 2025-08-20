#!/bin/bash

if [ "$1" = "webui" ]; then
    python webUI.py
elif [ "$1" = "flask" ]; then
    python flask_api.py
elif [ "$1" = "inference" ]; then
    python inference_main.py "${@:2}"
elif [ "$1" = "train" ]; then
    python train.py "${@:2}"
elif [ "$1" = "bash" ]; then
    bash
else
    echo "Usage: docker run [OPTIONS] image [COMMAND]"
    echo "Commands:"
    echo "  webui     - Start Gradio Web UI"
    echo "  flask     - Start Flask API server"
    echo "  inference - Run inference with arguments"
    echo "  train     - Run training with arguments"
    echo "  bash      - Start bash shell"
    echo ""
    echo "Examples:"
    echo "  docker run -p 7860:7860 image webui"
    echo "  docker run -p 6842:6842 image flask"
    echo "  docker run image inference -m model.pth -c config.json -n input.wav"
    echo "  docker run -it image bash"
fi

