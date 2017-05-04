FROM quay.io/pires/docker-elasticsearch:5.3.2

MAINTAINER Kelly Campbell <kellyc@stratisiot.com>

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

RUN NODE_NAME=foobar /elasticsearch/bin/elasticsearch-plugin install -b https://distfiles.compuscene.net/elasticsearch/elasticsearch-prometheus-exporter-5.3.2.0.zip
RUN NODE_NAME=foobar /elasticsearch/bin/elasticsearch-plugin install -b https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-gcs/repository-gcs-5.3.2.zip
RUN NODE_NAME=foobar /elasticsearch/bin/elasticsearch-plugin install -b https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-s3/repository-s3-5.3.2.zip
