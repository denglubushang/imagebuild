#!/bin/bash

# 日志生成器脚本 (Bash版本)
# 每秒输出一行标准格式的日志信息，循环输出固定的四句日志

echo "开始生成标准格式日志，按 Ctrl+C 停止..."

# 固定的四句日志，包含级别、模块和消息
log_entries=(
    "INFO:SYSTEM:系统启动完成，开始正常运行"
    "INFO:REQUEST:正在处理用户请求，响应时间正常"
    "INFO:DATABASE:数据库连接稳定，查询性能良好"
    "INFO:RESOURCE:内存使用率正常，系统资源充足"
)

count=1
while true; do
    # 获取当前时间（包含毫秒）
    current_time=$(date '+%Y-%m-%d %H:%M:%S.%3N')
    
    # 循环选择日志条目
    entry_index=$(( (count - 1) % ${#log_entries[@]} ))
    entry="${log_entries[$entry_index]}"
    
    # 解析日志条目
    IFS=':' read -r level module message <<< "$entry"
    
    # 生成标准日志格式
    log_message=$(printf "%s [%5s] [%10s] %s" "$current_time" "$level" "$module" "$message")
    
    # 输出到控制台
    echo "$log_message"
    
    # 同时写入日志文件
    echo "$log_message" >> app.log
    
    count=$((count + 1))
    sleep 1  # 暂停1秒
done
