#!/bin/bash

echo "=========================================="
echo "系统代理信息检查"
echo "=========================================="
echo ""

# 1. 检查环境变量
echo "1. 环境变量代理设置："
echo "------------------------------------------"
if env | grep -i proxy; then
    env | grep -i proxy
else
    echo "未发现代理环境变量"
fi
echo ""

# 2. 检查 APT 代理设置
echo "2. APT 包管理器代理设置："
echo "------------------------------------------"
if [ -f /etc/apt/apt.conf.d/proxy.conf ]; then
    echo "APT 代理配置文件存在："
    cat /etc/apt/apt.conf.d/proxy.conf
else
    echo "未发现 APT 代理配置文件"
fi
echo ""

# 3. 检查 Docker 代理设置
echo "3. Docker 代理设置："
echo "------------------------------------------"
if [ -f /etc/systemd/system/docker.service.d/http-proxy.conf ]; then
    echo "Docker 代理配置文件存在："
    cat /etc/systemd/system/docker.service.d/http-proxy.conf
else
    echo "未发现 Docker 代理配置文件"
fi

# 检查 Docker 守护进程环境变量
echo "Docker 守护进程环境变量："
sudo systemctl show --property=Environment docker 2>/dev/null || echo "无法获取 Docker 环境变量"
echo ""

# 4. 检查 Git 代理设置
echo "4. Git 代理设置："
echo "------------------------------------------"
echo "全局 Git 代理设置："
git config --global --get http.proxy 2>/dev/null || echo "未设置 HTTP 代理"
git config --global --get https.proxy 2>/dev/null || echo "未设置 HTTPS 代理"
git config --global --get http.noProxy 2>/dev/null || echo "未设置 NO_PROXY"

echo "本地 Git 代理设置："
git config --local --get http.proxy 2>/dev/null || echo "未设置本地 HTTP 代理"
git config --local --get https.proxy 2>/dev/null || echo "未设置本地 HTTPS 代理"
echo ""

# 5. 检查 pip 代理设置
echo "5. Python pip 代理设置："
echo "------------------------------------------"
if [ -f ~/.pip/pip.conf ]; then
    echo "用户级 pip 配置文件："
    cat ~/.pip/pip.conf
else
    echo "未发现用户级 pip 代理配置"
fi

if [ -f /etc/pip.conf ]; then
    echo "系统级 pip 配置文件："
    cat /etc/pip.conf
else
    echo "未发现系统级 pip 代理配置"
fi
echo ""

# 6. 检查 wget 代理设置
echo "6. Wget 代理设置："
echo "------------------------------------------"
if [ -f ~/.wgetrc ]; then
    echo "用户级 wget 配置文件："
    cat ~/.wgetrc
else
    echo "未发现用户级 wget 代理配置"
fi

if [ -f /etc/wgetrc ]; then
    echo "系统级 wget 配置文件："
    cat /etc/wgetrc | grep -i proxy
else
    echo "未发现系统级 wget 代理配置"
fi
echo ""

# 7. 检查 curl 代理设置
echo "7. Curl 代理设置："
echo "------------------------------------------"
if [ -f ~/.curlrc ]; then
    echo "用户级 curl 配置文件："
    cat ~/.curlrc
else
    echo "未发现用户级 curl 代理配置"
fi

if [ -f /etc/curlrc ]; then
    echo "系统级 curl 配置文件："
    cat /etc/curlrc | grep -i proxy
else
    echo "未发现系统级 curl 代理配置"
fi
echo ""

# 8. 检查网络连接测试
echo "8. 网络连接测试："
echo "------------------------------------------"
echo "测试 HTTP 连接："
curl -s --connect-timeout 5 http://httpbin.org/ip 2>/dev/null | head -1 || echo "HTTP 连接失败"

echo "测试 HTTPS 连接："
curl -s --connect-timeout 5 https://httpbin.org/ip 2>/dev/null | head -1 || echo "HTTPS 连接失败"
echo ""

# 9. 检查当前 IP 地址
echo "9. 当前网络信息："
echo "------------------------------------------"
echo "外网 IP 地址："
curl -s --connect-timeout 5 ifconfig.me 2>/dev/null || echo "无法获取外网 IP"

echo "本地 IP 地址："
ip route get 1.1.1.1 | awk '{print $7}' | head -1 2>/dev/null || echo "无法获取本地 IP"
echo ""

echo "=========================================="
echo "代理信息检查完成"
echo "==========================================" 