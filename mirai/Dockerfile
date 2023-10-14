FROM ibm-semeru-runtimes:open-11-jre AS build

ARG MCL_VERSION=v2.1.2
ARG PROTOCOL_FIX_PLUGIN_VERSION=v1.12.0
ARG API_HTTP_PLUGIN_VERSION=v2.9.1

WORKDIR /build

COPY run_command.exp /build/
COPY entrypoint.sh /build/

# 安装依赖

RUN apt-get update && apt-get install expect unzip -y 

# mirai 本体安装

RUN export mirai_zip_name=$(echo ${MCL_VERSION} | sed 's/v/mcl-/')".zip" && \  
    curl -LJO https://github.com/iTXTech/mirai-console-loader/releases/download/${MCL_VERSION}/${mirai_zip_name} && \
    unzip ${mirai_zip_name} && \
    rm -f ${mirai_zip_name} && \
    chmod +x ./mcl

# 插件安装

RUN export protocol_fix_plugin_jar_name=$(echo ${PROTOCOL_FIX_PLUGIN_VERSION} | sed 's/v/fix-protocol-version-/')".mirai2.jar " && \
    export api_http_plugin_jar_name=$(echo ${API_HTTP_PLUGIN_VERSION} | sed 's/v/mirai-api-http-/')".mirai2.jar" && \
    curl -LJO https://github.com/cssxsh/fix-protocol-version/releases/download/${PROTOCOL_FIX_PLUGIN_VERSION}/${protocol_fix_plugin_jar_name} && \
    curl -LJO https://github.com/project-mirai/mirai-api-http/releases/download/${API_HTTP_PLUGIN_VERSION}/${api_http_plugin_jar_name} && \
    mkdir -p plugins && \
    mv ${api_http_plugin_jar_name} plugins/ && \
    mv ${protocol_fix_plugin_jar_name} plugins/


RUN chmod +x ./run_command.exp && \
    chmod +x ./entrypoint.sh && \
    ./run_command.exp protocol fetch ANDROID_PHONE 

FROM ibm-semeru-runtimes:open-11-jre AS execute
WORKDIR /app

ARG QSIGN_PROTOCOL_VERSION=8.9.63
ENV QSIGN_PROTOCOL_VERSION=${QSIGN_PROTOCOL_VERSION}

ENV TEMPLATE_DIR=/template

RUN apt-get update && \
    apt-get install expect gettext -y && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /build/ /app/
COPY ./templates /templates

# TODO: build 时同步一次 protocol 信息

VOLUME ["/app/data", "/app/bots", "/app/logs", "/app/config"]

EXPOSE 8080

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "./mcl" ]