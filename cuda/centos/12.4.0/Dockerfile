FROM nvidia/cuda:12.4.0-devel-centos7
ENV PYTHONUNBUFFERED=1

# install system packages
RUN yum update -y && yum install -y \
        python3 python3-pip \
        git curl wget ca-certificates \
        sudo bzip2 libX11 vim net-tools iproute && \
    yum clean all

RUN pip3 install jupyter && \
    pip3 install nvitop && \
    pip3 cache purge

WORKDIR /root

COPY start.sh /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]