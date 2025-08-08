# ComfyUI风格日志生成器

这是一个模拟ComfyUI日志风格的日志生成器，可以持续输出ComfyUI风格的日志信息。

## 功能特点

- ✅ 模拟ComfyUI的日志格式和风格
- ✅ 多模块日志输出（comfy, model_management, nodes等）
- ✅ 日志文件自动轮转（50MB一个文件，保留3个备份）
- ✅ 支持Docker容器化部署
- ✅ 健康检查和自动重启

## 快速开始

### 使用Docker Compose（推荐）

1. **构建并启动容器**：
```bash
docker-compose up -d
```

2. **查看实时日志**：
```bash
docker-compose logs -f comfyui-logger
```

3. **停止容器**：
```bash
docker-compose down
```

### 使用Docker命令

1. **构建镜像**：
```bash
docker build -t comfyui-logger .
```

2. **运行容器**：
```bash
docker run -d \
  --name comfyui-logger \
  -v $(pwd)/logs:/app/logs \
  -p 8080:8080 \
  comfyui-logger
```

3. **查看日志**：
```bash
docker logs -f comfyui-logger
```

## 日志输出示例

```
2024-01-15 14:30:01 - comfy - INFO - ComfyUI starting up...
2024-01-15 14:30:02 - comfy.model_management - INFO - Loading model: stable-diffusion-v1-5
2024-01-15 14:30:03 - comfy.nodes - INFO - Executing node: CLIPTextEncode
2024-01-15 14:30:04 - comfy.samplers - INFO - Using sampler: Euler a
2024-01-15 14:30:05 - comfy.utils - INFO - Saving image: output_001.png
```

## 文件结构

```
.
├── Dockerfile                 # Docker镜像构建文件
├── docker-compose.yml        # Docker Compose配置文件
├── log_generator_comfyui.py  # 日志生成器脚本
├── logs/                     # 日志文件目录（挂载）
└── README.md                 # 说明文档
```

## 日志文件

- **位置**: `/app/logs/comfyui.log`（容器内）
- **挂载**: `./logs/comfyui.log`（宿主机）
- **轮转**: 50MB一个文件，保留3个备份
- **编码**: UTF-8

## 环境变量

- `TZ`: 时区设置（默认：Asia/Shanghai）
- `PYTHONUNBUFFERED`: Python输出缓冲（默认：1）

## 健康检查

容器包含健康检查功能：
- 检查Python进程是否运行
- 30秒检查一次
- 最多重试3次

## 停止和清理

```bash
# 停止容器
docker-compose down

# 删除镜像
docker rmi comfyui-logger

# 清理日志文件
rm -rf logs/
```

## 故障排除

1. **容器无法启动**：
   ```bash
   docker-compose logs comfyui-logger
   ```

2. **日志文件权限问题**：
   ```bash
   sudo chown -R $USER:$USER logs/
   ```

3. **时区问题**：
   确保宿主机和容器时区一致

## 自定义配置

可以修改 `log_generator_comfyui.py` 中的以下参数：
- 日志轮转大小：`maxBytes=50*1024*1024`
- 备份文件数量：`backupCount=3`
- 日志输出间隔：`time.sleep(1)`
