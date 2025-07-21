FROM pytorch/pytorch:2.6.0-cuda12.4-cudnn9-devel
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip python3-venv wget \
        git aria2 curl ss vim && \
    apt clean

RUN pip install jupyter && \
    pip install nvitop

WORKDIR /root

COPY start.sh /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]