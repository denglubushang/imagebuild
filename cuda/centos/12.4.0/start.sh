#!/bin/bash

# 检查 Python 版本 - 适配 CentOS 7 python36
python_version=$(python3 --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2)
if [ "$?" -ne 0 ]; then
    echo "错误: 未找到 Python 3，请确保已安装 Python 3.6+"
    echo "尝试使用 python36..."
    python_version=$(python36 --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2)
    if [ "$?" -ne 0 ]; then
        echo "错误: 未找到 Python 3.6，请检查安装"
        exit 1
    fi
fi

# 检查 Python 版本是否满足要求
required_version="3.6"
if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then
    echo "错误: Python 版本过低 ($python_version)，需要 Python 3.6+"
    exit 1
fi

echo "检测到 Python 版本: $python_version"

# 检查 Jupyter 是否已安装
if ! command -v jupyter &> /dev/null; then
    echo "错误: Jupyter 未安装，请先安装 Jupyter Lab"
    exit 1
fi

# 设置默认环境变量
if [ "$JUPYTER_PASSWORD" == "" ]; then
    JUPYTER_PASSWORD="1234567890"
fi

if [ "$JUPYTER_PORT" == "" ]; then
    JUPYTER_PORT="8888"
fi

if [ "$JUPYTER_PREFERRED_DIR" == "" ]; then
    JUPYTER_PREFERRED_DIR="/root"
fi

if [ "$JUPYTER_SHELL" == "" ]; then
    JUPYTER_SHELL="/bin/bash"
fi

# 检查目录是否存在
if [ ! -d "$JUPYTER_PREFERRED_DIR" ]; then
    echo "警告: 目录 $JUPYTER_PREFERRED_DIR 不存在，创建中..."
    mkdir -p "$JUPYTER_PREFERRED_DIR"
fi

# 设置环境变量以兼容 CentOS 7
export PYTHONPATH="${PYTHONPATH}:/usr/lib/python3.6/site-packages:/usr/local/lib/python3.6/site-packages"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib:/usr/lib64"

# 检查端口是否被占用
if netstat -tuln | grep ":$JUPYTER_PORT " > /dev/null; then
    echo "警告: 端口 $JUPYTER_PORT 已被占用，尝试使用其他端口"
    JUPYTER_PORT=$((JUPYTER_PORT + 1))
fi

echo "启动 Jupyter Lab..."
echo "端口: $JUPYTER_PORT"
echo "工作目录: $JUPYTER_PREFERRED_DIR"
echo "访问密码: $JUPYTER_PASSWORD"

# 启动 Jupyter Lab，添加错误处理
exec jupyter lab \
    --allow-root \
    --no-browser \
    --port="$JUPYTER_PORT" \
    --ip=0.0.0.0 \
    --FileContentsManager.delete_to_trash=False \
    --ServerApp.terminado_settings='{"shell_command":["'"$JUPYTER_SHELL"'"]}' \
    --ServerApp.token="$JUPYTER_PASSWORD" \
    --ServerApp.allow_origin=* \
    --ServerApp.preferred_dir="$JUPYTER_PREFERRED_DIR" \
    --ServerApp.open_browser=False \
    --ServerApp.trust_xheaders=True \
    --ServerApp.disable_check_xsrf=True
