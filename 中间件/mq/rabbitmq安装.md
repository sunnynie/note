# rabbitmq 安装

## docker 安装

```shell
docker search rabbitmq
docker pull rabbitmq
docker run -d --hostname my-rabbit --name rabbit -p 15672:15672 -p 5673:5672 rabbitmq
```

## 创建用户

```shell
#创建用户
rabbitmqctl add_user admin admin
#创建用户角色
rabbitmqctl set_user_tags admin administrator
#用户设置空间权限
rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
```

## 开启web功能
```
 rabbitmq-plugins enable rabbitmq_management
```