# 人员统计
## 分支
- hrm: feature/人员统计
- top-technology: feature/人员统计
## sql
## 数据字典修改
![img_1.png](../img/人员职位字典.png)
## 补充sql 注解
```sql
alter table hrm_employee
    modify political_type int null comment '政治面貌: 0.群众 1. 党员 2.团员3.预备党员';


```
## 需求分析
- 部门选择:选择的部门包含当前及一下的所有部门
-  第一列数据
   - 期初员工数量: 当月月1号员工数量(包含之前的人员,非离职)
   - 期末员工数量: 当月当天员工数量(包含之前的人员,非离职)
   - 离职员工数量: 当月的离职员工
   - 新增员工数量: 当月的新增员工
   - 党员人数:当前所有的党员人数(包含之前的人员,非离职)
   - 党员占比:当前所有的党员占比(包含之前的人员,非离职)
- 第二列
   - 平均员工数量变化情况: 每天的人数的变化,平均值=(期初人数+期末人数)/2
   - 入职离职情况: 当月的人员入职,离职情况
   - 职称占比: 根据部门id,查询所有非离职的职称比例
- 第三列
  - 男女比例
  - 年龄情况
  - 学历情况
  - 用工形式
  - 以上的查询,都是根据部门,不分时间,查询所有
- - -
# 员工档案根据授权部门查看数据
- git分支:
    - top-hrm : hotfix/人员档案授权部门列表
    - sql: 
- 新sql:
  ```sql
    alter table hrm_employee_quit_info
    modify handover_info varchar(1000) null comment '所属部门工作交接情况';
  ```
```sql
create table hrm_user_auth_dept
(
    hrm_user_auth_dept_id varchar(100)            not null comment '主键id'
        primary key,
    hrm_user_auth_name    varchar(100) default '' not null comment '授权规则名称',
    subject_id            varchar(100)            not null comment '分公司id',
    create_by             varchar(64)             not null comment '创建人',
    create_time           datetime                null comment '创建时间'
)
    comment '用户授权部门';



create table hrm_user_auth_dept_data
(
  user_id               varchar(100)            not null comment '用户id',
  dept_id               varchar(100) default '' not null comment '部门Id',
  subject_id            varchar(100) default '' not null comment '分公司id',
  dept_name             varchar(100) default '' not null comment '部门名称',
  user_name             varchar(100) default '' not null comment '用户名',
  hrm_user_auth_dept_id varchar(100)            not null comment '人员授权表id'
)
  comment '人员授权部门数据表';

create index index_user_id_subejct_id
  on hrm_user_auth_dept_data (user_id, subject_id);



```

---

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
---
# 代码分支 
    top-ui: hotfix/员工职位_ncq
    top-hrm: hotfix/员工职位_ncq

# top
    读取字典配置: hrm_employee_station 人员岗位类型
    读取字典配置: hrm_employment_category 用工类别
