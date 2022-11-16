# sql
hrm_employee ,
```sql
alter table hrm_employee
             add station int default 0 not null comment '岗位,读取字典 0.空岗位 读取字典 hrm_employee_station'
```

# 代码分支 
    top-ui: hotfix/员工职位_ncq
    top-hrm: hotfix/员工职位_ncq

# top
    读取字典配置: hrm_employee_station
