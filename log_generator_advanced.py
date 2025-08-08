#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
高级日志生成器脚本
使用Python标准logging模块，模拟真实应用程序的多模块日志
"""

import time
import datetime
import sys
import logging
import random
from logging.handlers import RotatingFileHandler

def setup_logging():
    """配置日志系统"""
    # 创建根logger
    root_logger = logging.getLogger()
    root_logger.setLevel(logging.DEBUG)
    
    # 清除已有的处理器
    root_logger.handlers.clear()
    
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
        '%(asctime)s.%(msecs)03d [%(levelname)5s] [%(name)12s] %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S'
    )
    
    # 设置格式化器
    console_handler.setFormatter(formatter)
    file_handler.setFormatter(formatter)
    
    # 添加处理器到根logger
    root_logger.addHandler(console_handler)
    root_logger.addHandler(file_handler)
    
    return root_logger

def create_module_loggers():
    """创建不同模块的logger"""
    loggers = {}
    modules = ['system', 'database', 'api', 'auth', 'cache', 'worker']
    
    for module in modules:
        logger = logging.getLogger(module)
        loggers[module] = logger
    
    return loggers

def generate_log():
    """生成标准格式的日志信息"""
    # 配置日志系统
    setup_logging()
    loggers = create_module_loggers()
    
    # 定义不同模块的日志消息
    log_patterns = [
        # system模块
        {"logger": "system", "level": logging.INFO, "message": "系统启动完成，服务正常运行"},
        {"logger": "system", "level": logging.INFO, "message": "配置加载成功，所有参数有效"},
        {"logger": "system", "level": logging.WARNING, "message": "磁盘使用率超过80%，建议清理"},
        
        # database模块
        {"logger": "database", "level": logging.INFO, "message": "数据库连接池初始化完成"},
        {"logger": "database", "level": logging.DEBUG, "message": "执行SQL查询，耗时15ms"},
        {"logger": "database", "level": logging.ERROR, "message": "数据库连接超时，正在重试"},
        
        # api模块
        {"logger": "api", "level": logging.INFO, "message": "收到API请求: GET /api/users"},
        {"logger": "api", "level": logging.DEBUG, "message": "请求参数验证通过"},
        {"logger": "api", "level": logging.WARNING, "message": "API响应时间超过阈值: 2.5s"},
        
        # auth模块
        {"logger": "auth", "level": logging.INFO, "message": "用户登录成功: user123"},
        {"logger": "auth", "level": logging.WARNING, "message": "登录失败，密码错误"},
        {"logger": "auth", "level": logging.DEBUG, "message": "JWT token验证通过"},
        
        # cache模块
        {"logger": "cache", "level": logging.INFO, "message": "Redis缓存连接正常"},
        {"logger": "cache", "level": logging.DEBUG, "message": "缓存命中率: 85%"},
        {"logger": "cache", "level": logging.WARNING, "message": "缓存空间不足，开始清理"},
        
        # worker模块
        {"logger": "worker", "level": logging.INFO, "message": "后台任务队列处理中"},
        {"logger": "worker", "level": logging.DEBUG, "message": "任务执行完成，耗时120ms"},
        {"logger": "worker", "level": logging.ERROR, "message": "任务执行失败，已加入重试队列"}
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
        logging.getLogger("system").info("程序已停止")
        sys.exit(0)

if __name__ == "__main__":
    print("开始生成高级日志，按 Ctrl+C 停止...")
    generate_log()
