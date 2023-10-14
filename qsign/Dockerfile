FROM ghcr.io/fuqiuluo/unidbg-fetch-qsign:master AS source

FROM ibm-semeru-runtimes:open-11-jre AS runner

WORKDIR /app

COPY --from=source /app/ /app/

ARG QSIGN_PROTOCOL_VERSION=8.9.73
ENV QSIGN_PROTOCOL_VERSION=${QSIGN_PROTOCOL_VERSION}
CMD java -jar unidbg-fetch-qsign-all.jar --basePath=./txlib/${QSIGN_PROTOCOL_VERSION}

EXPOSE 8080