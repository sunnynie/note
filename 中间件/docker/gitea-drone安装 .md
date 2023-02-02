# gitea-drone安装

## docker-compose.yml

```yaml
version: '3'
services:
  gitea:
    image: gitea/gitea:latest
    container_name: gitea
    ports:
      # 访问gitea使用映射出来的3000端口
      - "3000:3000"
      - "10022:22"
    volumes:
      # 数据目录挂载出来
      - /data/gitea/data:/data
    restart: always

  drone-server:
    image: drone/drone:latest
    container_name: drone-server
    ports:
      # 访问drone使用映射出来的8080端口
      - "8080:80"
      - "8443:443"
    volumes:
      # 数据目录挂载出来
      - /data/drone:/var/lib/drone/
    restart: always
    environment:
      # 打开 debug 模式
      - DRONE_DEBUG=true
      # 启动日志，默认是关闭的
      - DRONE_LOGS_TRACE=true
      # 启动 debug 日志，默认是关闭的
      - DRONE_LOGS_DEBUG=true
      - DRONE_OPEN=true
      # 设置 drone-server 使用的 host 名称，可以是 ip 地址加端口号；容器中可以使用容器名称代替
      - DRONE_SERVER_HOST=drone-server
      - DRONE_GIT_ALWAYS_AUTH=false
      # 秘钥信息设置，主要是用在 drone-server 与 drone-runner 之间的 RPC 请求
      - DRONE_RPC_SECRET=rpc_secret
      # 秘钥信息设置，主要是用在 drone-server 与 drone-runner 直接的请求
      - DRONE_SECRET=secret
        # 协议，可选 http、https
      - DRONE_SERVER_PROTO=http
      - DRONE_GIT_USERNAME=userName
      - DRONE_GIT_PASSWORD=password
      - DRONE_USER_CREATE=username:userName,admin:true # 开启管理员账户
      # 开启 gitea
      - DRONE_GITEA_SERVER=true
      - DRONE_GITEA_CLIENT_ID=gitea生成的OAuth2客户端ID
      - DRONE_GITEA_CLIENT_SECRET=gitea生成的OAuth2客户端密钥
  drone-runner-docker:
    image: drone/drone-runner-docker:latest
    container_name: drone-runner-docker
    depends_on:
      - drone-server
    volumes:
      # 构建镜像需要调用宿主机的 docker.sock 文件
      - /var/run/docker.sock:/var/run/docker.sock
    restart: always
    #privileged: true
    environment:
      # 打开 debug 模式
      - DRONE_DEBUG=true
      # 开始日志，默认是关闭的
      - DRONE_LOGS_TRACE=true
      # 启动 debug 日志，默认是关闭的
      - DRONE_LOGS_DEBUG=true
      # 和 drone-server 通讯的协议
      - DRONE_RPC_PROTO=http
      # 设置 drone-server 使用的 host 名称，可以是 ip 地址加端口号，不需要带 http 前缀
      - DRONE_RPC_HOST=drone-server
      # 秘钥，用于 drone-server 与 drone-agent 之间的 RPC 请求
      - DRONE_RPC_SECRET=rpc_secret
      # 秘钥，用于 drone-server 与 drone-agent 直接的请求
      - DRONE_SECRET=secret
      # 限制 runner 并发执行的流水线任务数量
      - DRONE_RUNNER_CAPACITY=5
      # 自定义 runner 的名称
      - DRONE_RUNNER_NAME=drone-runner-docker
```

- gogs 是用于管理代码的服务,同gitlab,github 这些,只是比较轻量,比较是适合个人或者小团队使用
- drone-server为drone的管理提供了web页面,用于管理从git上获取仓库中的流水线任务
- drone-runner-docker 一个单独的守护线程,它会轮询droneServer,获取需要的流水线任务,然后执行.这个runner是用来构建docker镜像的,它还有drone/drone-runner-kube,drone/drone-runner-ssh等其它特定作用的执行器
