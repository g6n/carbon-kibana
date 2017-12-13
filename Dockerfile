
FROM ubuntu:16.04

ENV KIBANA_VERSION 6.0.1-linux-x86_64

RUN apt-get update  && \
    apt-get install -y curl nodejs && \
    curl -s https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar zx -C /opt

ADD ./run.sh /run.sh

RUN chmod +x /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
