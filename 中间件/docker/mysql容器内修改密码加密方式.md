# mysql 容器内修改密码加密方式

## 容器进入怒
```
# 进入docker容器内
sudo docker exec -it mysql bash
# mysql 密码登录
mysql -u root -p
# 切换数据库
use mysql;
# 更新密码的加密方式
alter user 'root'@'%' identified with mysql_native_password by 'root';
# 刷新权限
flush privileges;
``` 