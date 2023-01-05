# 待办消息新api

## sql

```sql
alter table notice_msg
    modify biz_type int(5) not null comment '业务类型（自定义）';
```
