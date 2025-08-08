#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
日志生成器脚本
使用Python标准logging模块，每秒输出一行标准格式的日志信息
"""

import time
import datetime
import sys
import logging
from logging.handlers import RotatingFileHandler

def setup_logging():
    """配置日志系统"""
    # 创建logger
    logger = logging.getLogger('LogGenerator')
    logger.setLevel(logging.DEBUG)
    
    # 清除已有的处理器
    logger.handlers.clear()
    
    # 创建控制台处理器
    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.DEBUG)
    
    # 创建文件处理器（带轮转）
    file_handler = RotatingFileHandler(
        'app.log', 
        maxBytes=10*1024*1024,  # 10MB
        backupCount=5,
        encoding='utf-8'
    )
    file_handler.setLevel(logging.DEBUG)
    
    # 创建格式化器
    formatter = logging.Formatter(
        '%(asctime)s.%(msecs)03d [%(levelname)5s] [%(name)10s] %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S'
    )
    
    # 设置格式化器
    console_handler.setFormatter(formatter)
    file_handler.setFormatter(formatter)
    
    # 添加处理器到logger
    logger.addHandler(console_handler)
    logger.addHandler(file_handler)
    
    return logger

def generate_log():
    """生成标准格式的日志信息"""
    # 配置日志系统
    logger = setup_logging()
    
    # 固定的日志条目，包含级别、模块和消息
    log_entries = [
        {"level": logging.INFO, "module": "SYSTEM", "message": "系统启动完成，开始正常运行"},
        {"level": logging.DEBUG, "module": "REQUEST", "message": "正在处理用户请求，响应时间正常"},
        {"level": logging.ERROR, "module": "DATABASE", "message": "数据库连接稳定，查询性能良好"},
        {"level": logging.WARNING, "module": "RESOURCE", "message": "内存使用率正常，系统资源充足"}
    ]
    
    count = 1
    try:
        while True:
            # 循环选择日志条目
            entry_index = (count - 1) % len(log_entries)
            entry = log_entries[entry_index]
            
            # 使用logging模块输出日志
            logger.log(entry['level'], entry['message'], extra={'module': entry['module']})
            
            count += 1
            time.sleep(1)  # 暂停1秒
            
    except KeyboardInterrupt:
        logger.info("程序已停止")
        sys.exit(0)

if __name__ == "__main__":
    print("开始生成标准格式日志，按 Ctrl+C 停止...")
    generate_log()
