# 待办消息新api

## sql

```sql
alter table notice_msg
    modify biz_type varchar(10) not null comment '业务类型（自定义）';

alter table notice_msg
    add show_type varchar(10) default 'all' not null comment '显示类型,all,app,pc';
    
alter table notice_msg
    modify h5_router varchar(1000) null comment 'H5路由(自定义)';

alter table notice_msg
    modify pc_router varchar(1000) null comment 'PC路由(自定义)';

alter table notice_msg
    alter column group_id set default '';

```
