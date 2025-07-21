FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-devel
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip \
        git git-lfs curl wget ca-certificates \
        sudo bzip2 libx11-6 vim net-tools iproute2 && \
    apt clean

RUN pip install jupyter && \
    pip install nvitop && \
    pip cache purge

WORKDIR /root

COPY start.sh /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]