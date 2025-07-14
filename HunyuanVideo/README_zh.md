# HunyuanVideo Docker 镜像

这是一个包含HunyuanVideo文本到视频生成模型的Docker镜像，基于ComfyUI构建。

## 功能特性

- 基于PyTorch 2.7.1和CUDA 12.8
- 预装HunyuanVideo模型（720p版本）
- 包含所有必要的文本编码器和VAE模型
- 集成Jupyter Lab环境
- SSH服务支持
- 使用Supervisor管理服务

## 构建镜像

```bash
docker build -t hunyuanvideo:latest .
```

## 运行容器

```bash
docker run -d \
  --name hunyuanvideo \
  --gpus all \
  -p 8188:8188 \
  -p 8888:8888 \
  -p 2222:22 \
  -v /path/to/output:/root/ComfyUI/output \
  hunyuanvideo:latest
```

## 端口说明

- `8188`: ComfyUI Web界面
- `8888`: Jupyter Lab
- `2222`: SSH服务

## 环境变量

- `JUPYTER_PASSWORD`: Jupyter密码（默认：1234567890）
- `JUPYTER_PORT`: Jupyter端口（默认：8888）
- `SSH_PASSWORD`: SSH密码
- `SSH_PUBLIC_KEY`: SSH公钥

## 使用方法

1. 访问 `http://localhost:8188` 进入ComfyUI界面
2. 加载预配置的工作流文件 `hunyuanvideo_workflow.json`
3. 修改文本提示词
4. 点击运行生成视频

## 模型文件

镜像包含以下预下载的模型文件：

- `hunyuan_video_t2v_720p_bf16.safetensors`: 主模型（720p版本）
- `clip_l.safetensors`: CLIP文本编码器
- `llava_llama3_fp8_scaled.safetensors`: LLaVA文本编码器
- `hunyuan_video_vae_bf16.safetensors`: VAE模型

## 注意事项

- 需要NVIDIA GPU支持
- 建议使用至少16GB显存
- 首次运行可能需要下载额外的模型文件 