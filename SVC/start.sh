#!/bin/bash
if [ "$1" = "webui" ]; then
    echo "启动Web界面..."
    python webUI.py --server_name 0.0.0.0 --server_port 7860
elif [ "$1" = "train" ]; then
    echo "开始训练..."
    python train.py -c configs/config.json -m 44k
elif [ "$1" = "inference" ]; then
    echo "启动推理模式..."
    python inference_main.py
elif [ "$1" = "api" ]; then
    echo "启动API服务..."
    python flask_api.py
else
    echo "  webui    - 启动Web界面 (端口7860)"
    echo "  train    - 开始训练模型"
    echo "  inference - 启动推理模式"
    echo "  api      - 启动API服务"
fi
