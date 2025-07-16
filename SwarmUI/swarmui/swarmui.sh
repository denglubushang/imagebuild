#!/bin/bash
cd /root/SwarmUI

# 等待系统完全启动
sleep 5

# 启动SwarmUI
exec ./launch-linux.sh --host 0.0.0.0 --port 7801