# mysql binlog 详细
## 命令
```
#查询是否开启binlog
show variables like 'log_%';

#查询所有binlog 日志
show master logs;

# 重置日志
reset master;

# 查看日志事件
show binlog events;
# 查看日期的最大的位置
show master status;

# 数据恢复，去除需要的删除的逻辑处理，再执行
mysqlbinlog  binlog.000001 --stop-position=939 |mysql -u root -p

# 生成新的日志文件
flush logs;


``` 
## 误区
不是所有的mysql 都有mysqlbinlog ，8版本的， 8.0.23 版本是有mysqlbinlog工具
```