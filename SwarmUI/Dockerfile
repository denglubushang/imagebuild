FROM pytorch/pytorch:2.7.1-cuda12.8-cudnn9-runtime
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

RUN apt update -y && apt install -y supervisor && \
    mkdir -p /var/log/supervisord && \
    mkdir -p /opt/supervisor && \
    apt clean \

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip python3-venv wget\
        git aria2 && \
    apt clean

# install jupyter
RUN pip install jupyter && \
    pip install nvitop && \
    pip cache purge
COPY jupyter/jupyter.sh   /opt/supervisor/jupyter.sh
COPY jupyter/jupyter.conf /etc/supervisor/conf.d/jupyter.conf

RUN cd /root && wget https://github.com/mcmonkeyprojects/SwarmUI/releases/download/0.6.5-Beta/install-linux.sh -O install-linux.sh && \
    chmod +x install-linux.sh && \
    ./install-linux.sh

WORKDIR /root/SwarmUI

COPY swarmui/swarmui.sh         /opt/supervisor/swarmui.sh
COPY swarmui/swarmui.conf       /etc/supervisor/conf.d/swarmui.conf

CMD  ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]