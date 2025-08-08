#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ComfyUI风格日志生成器脚本
模拟ComfyUI的日志输出格式和风格
"""

import time
import datetime
import sys
import logging
import random
import os
from logging.handlers import RotatingFileHandler

def setup_comfyui_logging():
    """配置ComfyUI风格的日志系统"""
    # 创建根logger
    root_logger = logging.getLogger()
    root_logger.setLevel(logging.DEBUG)
    
    # 清除已有的处理器
    root_logger.handlers.clear()
    
    # 创建控制台处理器
    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.DEBUG)
    
    # 确保logs目录存在
    logs_dir = "/app/logs" if os.path.exists("/app") else "./logs"
    os.makedirs(logs_dir, exist_ok=True)
    
    # 创建文件处理器（带轮转）
    file_handler = RotatingFileHandler(
        os.path.join(logs_dir, 'comfyui.log'), 
        maxBytes=50*1024*1024,  # 50MB (ComfyUI默认大小)
        backupCount=3,
        encoding='utf-8'
    )
    file_handler.setLevel(logging.DEBUG)
    
    # ComfyUI风格的格式化器
    formatter = logging.Formatter(
        '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S'
    )
    
    # 设置格式化器
    console_handler.setFormatter(formatter)
    file_handler.setFormatter(formatter)
    
    # 添加处理器到根logger
    root_logger.addHandler(console_handler)
    root_logger.addHandler(file_handler)
    
    return root_logger

def create_comfyui_loggers():
    """创建ComfyUI风格的logger"""
    loggers = {}
    modules = [
        'comfy', 'comfy.model_management', 'comfy.nodes', 
        'comfy.utils', 'comfy.samplers', 'comfy.controlnet'
    ]
    
    for module in modules:
        logger = logging.getLogger(module)
        loggers[module] = logger
    
    return loggers

def generate_comfyui_log():
    """生成ComfyUI风格的日志信息"""
    # 配置日志系统
    setup_comfyui_logging()
    loggers = create_comfyui_loggers()
    
    # ComfyUI风格的日志消息
    log_patterns = [
        # 系统启动相关
        {"logger": "comfy", "level": logging.INFO, "message": "ComfyUI starting up..."},
        {"logger": "comfy", "level": logging.INFO, "message": "Loading models..."},
        {"logger": "comfy", "level": logging.INFO, "message": "Models loaded successfully"},
        
        # 模型管理相关
        {"logger": "comfy.model_management", "level": logging.INFO, "message": "Loading model: stable-diffusion-v1-5"},
        {"logger": "comfy.model_management", "level": logging.DEBUG, "message": "Model loaded to GPU memory: 2.1GB"},
        {"logger": "comfy.model_management", "level": logging.WARNING, "message": "Low VRAM detected, using CPU offloading"},
        
        # 节点执行相关
        {"logger": "comfy.nodes", "level": logging.INFO, "message": "Executing node: CLIPTextEncode"},
        {"logger": "comfy.nodes", "level": logging.DEBUG, "message": "Node execution time: 45ms"},
        {"logger": "comfy.nodes", "level": logging.INFO, "message": "Executing node: KSampler"},
        {"logger": "comfy.nodes", "level": logging.DEBUG, "message": "Sampling steps: 20, CFG: 7.0"},
        
        # 采样器相关
        {"logger": "comfy.samplers", "level": logging.INFO, "message": "Using sampler: Euler a"},
        {"logger": "comfy.samplers", "level": logging.DEBUG, "message": "Step 1/20: noise_level=0.9"},
        {"logger": "comfy.samplers", "level": logging.DEBUG, "message": "Step 10/20: noise_level=0.5"},
        {"logger": "comfy.samplers", "level": logging.DEBUG, "message": "Step 20/20: noise_level=0.1"},
        
        # 工具函数相关
        {"logger": "comfy.utils", "level": logging.INFO, "message": "Saving image: output_001.png"},
        {"logger": "comfy.utils", "level": logging.DEBUG, "message": "Image saved with metadata"},
        {"logger": "comfy.utils", "level": logging.INFO, "message": "Workflow completed successfully"},
        
        # ControlNet相关
        {"logger": "comfy.controlnet", "level": logging.INFO, "message": "Loading ControlNet model: canny"},
        {"logger": "comfy.controlnet", "level": logging.DEBUG, "message": "ControlNet preprocessing completed"},
        {"logger": "comfy.controlnet", "level": logging.INFO, "message": "ControlNet applied successfully"},
        
        # 错误和警告
        {"logger": "comfy", "level": logging.WARNING, "message": "CUDA out of memory, trying to free some memory"},
        {"logger": "comfy", "level": logging.ERROR, "message": "Failed to load model: file not found"},
        {"logger": "comfy", "level": logging.INFO, "message": "Memory freed, retrying operation"},
        
        # 性能相关
        {"logger": "comfy", "level": logging.INFO, "message": "Generation completed in 12.5 seconds"},
        {"logger": "comfy", "level": logging.DEBUG, "message": "Peak memory usage: 8.2GB"},
        {"logger": "comfy", "level": logging.INFO, "message": "Queue processing: 3 items remaining"}
    ]
    
    count = 1
    try:
        while True:
            # 随机选择日志模式
            pattern = random.choice(log_patterns)
            logger = loggers[pattern["logger"]]
            
            # 使用logging模块输出日志
            logger.log(pattern["level"], pattern["message"])
            
            count += 1
            time.sleep(1)  # 暂停1秒
            
    except KeyboardInterrupt:
        logging.getLogger("comfy").info("ComfyUI shutting down...")
        sys.exit(0)

if __name__ == "__main__":
    print("开始生成ComfyUI风格日志，按 Ctrl+C 停止...")
    generate_comfyui_log()
