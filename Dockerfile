
FROM ubuntu:16.04

ENV KIBANA_VERSION 6.0.1-linux-x86_64

RUN apt-get update  && \
    apt-get install curl nodejs && \
    mkdir /opt && \
    curl -s https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar zx -C /opt && \
    rm -rf /opt/kibana-${KIBANA_VERSION}/node && \
    mkdir -p /opt/kibana-${KIBANA_VERSION}/node/bin && \
    ln -sf /usr/bin/node /opt/kibana-${KIBANA_VERSION}/node/bin/node && \

ADD ./run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
