FROM nvidia/cuda:12.4.0-devel-centos7
ENV PYTHONUNBUFFERED=1

# replace mirror
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

# install system packages
RUN yum update -y && yum install -y \
        python36 python36-pip python36-devel \
        gcc gcc-c++ make \
        git curl wget ca-certificates \
        sudo bzip2 libX11 vim net-tools iproute && \
    yum clean all && \
    ln -sf /usr/bin/python3.6 /usr/bin/python3 && \
    ln -sf /usr/bin/pip3.6 /usr/bin/pip3 && \
    ln -sf /usr/bin/python3.6 /usr/bin/python && \
    ln -sf /usr/bin/pip3.6 /usr/bin/pip

RUN pip3 install --upgrade pip setuptools wheel && \
    pip3 install "jupyter<2.0" "jupyterlab<4.0" && \
    pip3 install nvitop && \
    pip3 cache purge

WORKDIR /root

COPY start.sh /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]