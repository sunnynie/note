# 员工档案根据授权部门查看数据
- git分支:
    - top-hrm : hotfix/人员档案授权部门列表
    - ```sql
       sql:    
      create table hrm_user_auth_dept_data
      (
      user_id    varchar(100)            not null comment '用户id',
      dept_id    varchar(100) default '' not null comment '部门Id',
      subject_id varchar(100) default '' not null comment '分公司id',
      dept_name  varchar(100) default '' not null comment '部门名称'
      )
      comment '人员授权部门数据表';
      create index index_user_id_subejct_id
  on hrm_user_auth_dept_data (user_id, subject_id);

    ```

# 招聘管理审批未结束
- git 分支:
    - top-technology: hotfix_hrm招聘管理流程不结束
    - top-hrm : hotfix/人员档案授权部门列表
  
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

create table hrm_recruit_file
(
    hrm_recruit_id varchar(100)            not null comment '招聘审批id',
    file_url       varchar(300) default '' not null comment '附件路径',
    file_name      varchar(300) default '' not null comment '附件名称'
)
    comment '员工招聘附件表';

create index index_name
    on hrm_recruit_file (hrm_recruit_id);


```

# 代码分支 
    top-ui: hotfix/员工职位_ncq
    top-hrm: hotfix/员工职位_ncq

# top
    读取字典配置: hrm_employee_station 人员岗位类型
    读取字典配置: hrm_employment_category 用工类别
