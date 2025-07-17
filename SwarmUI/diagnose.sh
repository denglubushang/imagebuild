#!/bin/bash

echo "=== SwarmUI ComfyUI Backend Diagnosis ==="
echo ""

echo "1. Checking ComfyUI processes:"
ps aux | grep "main.py" | grep -v grep
echo ""

echo "2. Checking port bindings:"
netstat -tlnp | grep -E "(7821|7822|8188)"
echo ""

echo "3. Testing ComfyUI API endpoints:"
for port in 7821 7822 8188; do
    echo "Testing port $port:"
    curl -s --connect-timeout 5 "http://localhost:$port/system_stats" || echo "Failed to connect to port $port"
    echo ""
done

echo "4. Checking SwarmUI configuration:"
if [ -f "/root/SwarmUI/Data/settings.json" ]; then
    echo "Settings file exists:"
    cat /root/SwarmUI/Data/settings.json
else
    echo "Settings file not found!"
fi
echo ""

echo "5. Checking environment variables:"
echo "SWARMUI_COMFYUI_HOST: $SWARMUI_COMFYUI_HOST"
echo "SWARMUI_HOST: $SWARMUI_HOST"
echo "COMFYUI_LISTEN: $COMFYUI_LISTEN"
echo ""

echo "6. Checking ComfyUI startup arguments:"
ps aux | grep "main.py" | grep -v grep | sed 's/.*main.py/  main.py/'
echo "" 