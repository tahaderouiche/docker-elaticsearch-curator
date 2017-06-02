FROM centos:7
LABEL maintainer "Taha Derouiche taha.derouiche@gmail.com"

ARG CURATOR_VERSION=5.0.4

COPY curator.repo /etc/yum.repos.d/curator.repo

RUN yum install -y elasticsearch-curator cronie && yum clean all
ENV LC_ALL=en_US.utf8

RUN groupadd --gid 1000 curator && \
    useradd --uid 1000 --gid 1000 \
    curator

#USER curator

# COPY curator.yml /usr/share/curator/.curator/curator.yml

CMD ["/bin/bash"]
