#  bot_deploy

Mirai HTTP-API 服务 Docker compose 仓库，供快速部署

## 使用说明

安装必要的依赖：

Ubuntu:

```
# apt install docker.io docker-compose
```

创建环境变量文件：

```
$ cp .env.example .env
```

在刚刚创建的 .env 文件中配置你的 bot 账户和密码

构建镜像：

```
docker compose build
```

启动 mirai：
```
docker compose run mirai
```

此时会进入 mirai 控制台，需要进行一下认证操作（过验证码），此时登陆凭据会存储下来

完成后 Ctrl+C 退出

将整个服务跑在后台：
```
docker compose up -d
```

此时可以通过本机的 8080 端口访问到 mirai 的 HTTP/WS 服务（默认不需要认证）


## PS

如果 `docker compose` 命令无法执行，说明你的 compose 版本较低，将其改为 `docker-compose` 再试试


