# 使用Python 3.11官方镜像作为基础镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 设置环境变量
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8
ENV TZ=Asia/Shanghai

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# 复制日志生成器脚本
COPY log_generator_comfyui.py /app/

# 创建日志目录
RUN mkdir -p /app/logs

# 设置容器启动命令
CMD ["python", "log_generator_comfyui.py"]
