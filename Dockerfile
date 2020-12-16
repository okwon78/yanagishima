FROM openjdk:11.0.9

ARG YANAGISHIMA_VERSION=22.0

WORKDIR /opt/yanagishima

RUN apt-get update && \ 
    apt-get install -y gradle git && \
    apt-get install -y build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/oracle-jdk8-installer;

# RUN git clone https://github.com/yanagishima/yanagishima.git && \
#     cd yanagishima && \
#     git checkout -b refs/tags/$YANAGISHIMA_VERSION && \
#     ./gradlew distZip && \
#     cd build/distributions && \
#     unzip yanagishima-$YANAGISHIMA_VERSION.zip && \
#     cd yanagishima-$YANAGISHIMA_VERSION

EXPOSE 8080

COPY conf ${WORKDIR}/conf
COPY script ${WORKDIR}/script


CMD ["bash", "script/docker-entrypoint.sh"]
