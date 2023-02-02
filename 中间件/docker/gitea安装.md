# gitea 安装

- 参考网址 [文档 - Docs (gitea.io)](https://docs.gitea.io/zh-cn/)
- docker 安装

  docker-gitea.yml,内容如下:

  ````yml
  version: "3"

  networks:
    gitea:
      external: false

  services:
    server:
      image: gitea/gitea:1.17.4
      container_name: gitea
      environment:
        - USER_UID=1000
        - USER_GID=1000
      restart: always
      networks:
        - gitea
      volumes:
        - ./gitea:/data
        - /etc/timezone:/etc/timezone:ro
        - /etc/localtime:/etc/localtime:ro
      ports:
  -     - "3000:3000"
  -     - "222:22"
  +     - "8080:3000"
  +     - "2221:22"
  ```
  ````
- 使用nginx 作为反向代理

  ```
  server {
      listen 80;
      server_name git.example.com;

      location / {
          proxy_pass http://localhost:3000;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
      }
  }
  ```
- 使用nginx作为反向代理服务并将gitea路由到一个子路由

  ```
  server {
      listen 80;
      server_name git.example.com;

      # 注意: /git/ 最后需要有一个路径符号
      location /git/ { 
          # 注意: 反向代理后端 URL 的最后需要有一个路径符号
          proxy_pass http://localhost:3000/;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
      }
  }
  ```
  然后必须在gitea的配置文件中正确的使用[sever]ROOT_URL=http://git.example.com/git/的配置
