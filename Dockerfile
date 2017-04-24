FROM quay.io/pires/docker-elasticsearch:5.3.0

MAINTAINER Ross Kukulinski <Ross@Kukulinski.com>

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

RUN NODE_NAME=foobar /elasticsearch/bin/elasticsearch-plugin install -b https://github.com/vvanholl/elasticsearch-prometheus-exporter/releases/download/5.3.0.0/elasticsearch-prometheus-exporter-5.3.0.0.zip
RUN NODE_NAME=foobar /elasticsearch/bin/elasticsearch-plugin install -b https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-gcs/repository-gcs-5.3.0.zip
RUN NODE_NAME=foobar /elasticsearch/bin/elasticsearch-plugin install -b https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-s3/repository-s3-5.3.0.zip
