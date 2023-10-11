#!/bin/bash

TEMPLATE_DIR="/templates"
APP_DIR="/app"



find "$TEMPLATE_DIR" -type f -print0 | while IFS= read -r -d '' file; do
    # 计算目标文件的路径
    dest_file="$APP_DIR${file#$TEMPLATE_DIR}"
    dest_dir=$(dirname "$dest_file")

    # 创建目标文件所在的目录，如果它还不存在
    mkdir -p "$dest_dir"

    # 使用 envsubst 处理文件，并保存到目标文件中
    envsubst < "$file" > "$dest_file"
done

exec "$@"