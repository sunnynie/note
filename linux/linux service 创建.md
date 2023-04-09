# linux service 创建
## shell 实例脚本
```
#!/usr/sh
cd /home/test
touch a.sh
```
赋予脚本执行权限：在脚本目录下执行 chmod +x ./test.sh

##   安装sytemd: sudo apt-get install systemd 如果已经安装跳过
## 编写启动服务配置
```
cd /etc/systemd/system
sudo nano test.service
```
test.service 文件内容如下：
```
[Unit]
Description=test

[Service]  
ExecStart=/home/test/test.sh
Restart=no
Type=oneshot

[Install]
WanteBy=multi-user.target
```
上述文件的具体含义：

Unit区块的Description字段给出当前服务的简单描述，在[Unit]区块中可以添加此服务的依赖。

Service区块中ExecStart为脚本的具体路径，Restart为脚本执行结束后的处理方式，Type为脚本的运行方式。

Install为服务安装的相关配置

## 设置服务启动
```
sudo systemctl enable test
```
## 如果有更改服务配置文件test.service,需要执行一下命令
```
sudo systemctl daemon-reload
```