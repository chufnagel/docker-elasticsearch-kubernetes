FROM docker.bulogics.com/docker-elasticsearch:6.4.2_kc2

MAINTAINER kellyc@stratisiot.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false
