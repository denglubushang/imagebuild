FROM python:3.12-slim-bookworm AS stage-1
ARG TARGETARCH

ARG HUGGINGFACE_MODEL=fish-speech-1.5
ARG HF_ENDPOINT=https://huggingface.co
# 添加HF token参数
ARG HF_TOKEN

WORKDIR /opt/fish-speech

# 在stage-1中也需要安装git
RUN apt-get update && apt-get install -y git && \
    pip install huggingface_hub && \
    # 先登录
    huggingface-cli login --token ${HF_TOKEN} && \
    # 下载第一个模型
    HF_ENDPOINT=${HF_ENDPOINT} huggingface-cli download --resume-download fishaudio/${HUGGINGFACE_MODEL} --local-dir checkpoints/${HUGGINGFACE_MODEL} && \
    # 下载第二个模型
    HF_ENDPOINT=${HF_ENDPOINT} huggingface-cli download --resume-download fishaudio/openaudio-s1-mini --local-dir checkpoints/openaudio-s1-mini && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

FROM python:3.12-slim-bookworm
ARG TARGETARCH

ARG DEPENDENCIES="  \
    ca-certificates \
    libsox-dev \
    build-essential \
    cmake \
    libasound-dev \
    portaudio19-dev \
    libportaudio2 \
    libportaudiocpp0 \
    ffmpeg \
    git"

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    set -ex \
    && rm -f /etc/apt/apt.conf.d/docker-clean \
    && echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' >/etc/apt/apt.conf.d/keep-cache \
    && apt-get update \
    && apt-get -y install --no-install-recommends ${DEPENDENCIES} \
    && echo "no" | dpkg-reconfigure dash

WORKDIR /opt/fish-speech

RUN git clone https://github.com/fishaudio/fish-speech.git .

RUN --mount=type=cache,target=/root/.cache,sharing=locked \
    set -ex \
    && pip install -e .[stable]

COPY --from=stage-1 /opt/fish-speech/checkpoints /opt/fish-speech/checkpoints


CMD ["./entrypoint.sh"]