FROM pytorch/pytorch:2.7.1-cuda12.8-cudnn9-runtime
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# for China
# RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
#    sed -i 's#http://.*.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list
# install supervisord
RUN apt update -y && apt install -y supervisor && \
    mkdir -p /var/log/supervisord && \
    mkdir -p /opt/supervisor && \
    apt clean \

# install system packages
RUN apt update -y && apt install -y \
        python3 python-is-python3 python3-pip \
        git aria2 && \
    apt clean

# install jupyter
RUN pip install jupyter && \
    pip install nvitop  && \
    pip cache purge
COPY jupyter/jupyter.sh   /opt/supervisor/jupyter.sh
COPY jupyter/jupyter.conf /etc/supervisor/conf.d/jupyter.conf

# for China
# RUN python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && \
#     pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install "langchain-chatchat[xinference]" -U

WORKDIR /workspace/chatchat

Run chatchat init 

CMD  ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
# override defaultGraph.ts is useless, need to modify index-CaD4RONs.js 
# COPY defaultGraph.ts /root/ComfyUI/web/scripts/defaultGraph.js
