FROM ghcr.io/fuqiuluo/unidbg-fetch-qsign:master

ARG QSIGN_PROTOCOL_VERSION=8.9.73
ENV QSIGN_PROTOCOL_VERSION=${QSIGN_PROTOCOL_VERSION}
CMD java -jar unidbg-fetch-qsign-all.jar --basePath=./txlib/${QSIGN_PROTOCOL_VERSION}

EXPOSE 8080