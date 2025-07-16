#!/bin/bash

# 首次运行时执行安装
if [ ! -f "/root/SwarmUI/src/SwarmUI.csproj" ]; then
    echo "首次启动，正在安装SwarmUI..."
    cd /root
    ./install-linux.sh --launch-mode none
fi

cd /root/SwarmUI

# 等待系统完全启动
sleep 5

# 启动SwarmUI
exec ./launch-linux.sh --host 0.0.0.0 --port 7801