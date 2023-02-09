# 服务器上java日志查看
## 常规的查看滚动日志
```shell
tail -f xxx.log
```
## 常规的常看当前记录前的几条
```shell
tail -n 100 -f xxx.log
```
## 通过grep 查看日志的指定关键字
```shell
grep -C 10 keyword catalina.out 显示file文件中匹配keyword字串那行以及上下10行
grep -B 10 keyword catalina.out 显示keyword及前10行
grep -A 10 keyword catalina.out 显示keyword及后10行
```