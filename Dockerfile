FROM centos:7
LABEL maintainer "Taha Derouiche taha.derouiche@gmail.com"

ARG CURATOR_VERSION=5.1.1

COPY curator.repo /etc/yum.repos.d/curator.repo
RUN yum install -y elasticsearch-curator-${CURATOR_VERSION} && yum clean all

ENV LC_ALL=en_US.utf8

RUN groupadd -r --gid 1000 curator && \
    useradd -r --uid 1000 --gid 1000 \
    -d /usr/share/curator curator


RUN  mkdir -p /config
COPY purge_data.yml /config/purge_data.yml
COPY curator.yml /usr/share/curator/.curator/curator.yml

RUN chown -R curator:curator  /usr/share/curator /config
USER curator

ENTRYPOINT ["/opt/elasticsearch-curator/curator"]
CMD  ["/config/purge_data.yml" ]