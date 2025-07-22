FROM nvidia/cuda:12.4.0-devel-centos7
ENV PYTHONUNBUFFERED=1

# replace mirror
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

# install system packages
RUN yum update -y && yum install -y \
        python3 python3-pip \
        python3-devel gcc gcc-c++ make \
        git curl wget ca-certificates \
        sudo bzip2 libX11 vim net-tools iproute && \
    yum clean all

RUN pip3 install --upgrade pip setuptools wheel && \
    pip3 install jupyter jupyterlab && \
    pip3 install nvitop && \
    pip3 cache purge

WORKDIR /root

COPY start.sh /root/start.sh

CMD ["/bin/bash", "/root/start.sh"]