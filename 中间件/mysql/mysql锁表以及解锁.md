# mysql锁表以及解锁
## 解锁
mysql-> unlock tables;
## 加锁
锁定表,避免在备份过程中,表被更新操作
mysql-> lock tables table_name read;
为表创建一个写的锁,防止写入
mysql-> lock tables table_name write;