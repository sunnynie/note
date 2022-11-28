# sql
hrm_employee ,
```sql
alter table hrm_employee
             add station int default 0 not null comment '岗位,读取字典 0.空岗位 读取字典 hrm_employee_station'

alter table hrm_employee
    add annual_cash tinyint default 0 not null comment '年度兑现, 0.不对象 1.兑现'

alter table hrm_recruit_employ
    add employment_category int default 0 not null comment '用工类别,0 默认 字典:hrm_employment_category'

create table hrm_recruit_employ_file
(
    hrm_recruit_employ_id varchar(100)            not null comment '录用Id',
    file_name             varchar(300) default '' not null comment '附件名称',
    file_url              varchar(200) default '' not null comment '附件路径'
)
    comment '员工录用附件'
create index hrm_recruit_employ_file_hrm_recruit_employ_id_index
    on hrm_recruit_employ_file (hrm_recruit_employ_id)

alter table hrm_salary_change_record
    alter column old_post set default '';

create table hrm_salary_change_record_file
(
    hrm_salary_change_id varchar(100)            not null,
    file_url             varchar(200)            not null,
    file_name            varchar(200) default '' not null
)
    comment '员工调薪附件表';

create index hrm_salary_change_record_hrm_salary_change_id_index
    on hrm_salary_change_record_file (hrm_salary_change_id);


create table hrm_employee_quit_info_file
(
    hrm_employee_quit_info_id varchar(100)            not null comment '员工离职id',
    file_url                  varchar(200) default '' not null comment '附件路径',
    file_name                 varchar(300) default '' not null comment '附件名称'
)
    comment '员工离职附件表';

create index index_name
    on hrm_employee_quit_info_file (hrm_employee_quit_info_id);


```

# 代码分支 
    top-ui: hotfix/员工职位_ncq
    top-hrm: hotfix/员工职位_ncq

# top
    读取字典配置: hrm_employee_station
