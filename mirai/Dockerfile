FROM amazoncorretto:11

ARG MCL_VERSION 

WORKDIR /root
RUN export zip_name=$(echo ${MCL_VERSION} | sed 's/v/mcl-/') && \  
    yum install unzip -y && \
    curl -LJO https://github.com/iTXTech/mirai-console-loader/releases/download/${MCL_VERSION}/${zip_name}.zip && \
    unzip ${zip_name}.zip && \
    chmod +x mcl && \
    rm -f /tmp/mcl.zip && \
    ./mcl --dry-run

VOLUME ["/root/plugins", "/root/config", "/root/data", "/root/bots", "/root/logs"]

CMD [ "./mcl" ]