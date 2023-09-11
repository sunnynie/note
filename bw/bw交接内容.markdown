### hmdj_evaluate_group_sign (评价指标会签表)
| 字段名                     | 类型        | 默认值 | 注释                         | 
| -------------------------- | ----------- | ------ | ---------------------------- | 
| id                         | varchar(40) | NULL   | id                           | 
| evaluate_group_id          | varchar(40) | NULL   | 指标分组id                   | 
| user_id                    | varchar(40) | NULL   | 用户id                       | 
| deal_result                | varchar(10) | NULL   | 0. 不同意 1.同意             | 
| one_sign                   | varchar(10) | NULL   | 一键会签 0.否 1. 是           | 
| deal_end                   | varchar(10) | NULL   | 处理结束 0.否 1.是            | 
| create_time                | timestamp   | NULL   | 创建时间                     | 
| update_time                | timestamp   | NULL   | 更新时间                     | 

### hmdj_evaluate_template (评价模板)
| 字段名           | 类型        | 默认值 | 注释                 | 
| ---------------- | ----------- | ------ | -------------------- | 
| id               | varchar(40) | NOT NULL |                       | 
| dw_id            | varchar(40) | NULL   | 党委id               | 
| dw_name          | varchar(100) | NULL   | 党委名称             | 
| evaluate_id      | varchar(100) | NULL   | 指数模板             | 
| create_time      | timestamp   | NULL   | 创建时间             | 
| create_by        | varchar(100) | NULL   | 创建者               | 
| evaluate_name    | varchar(100) | NULL   | 评价指数名称         | 
| dzb_id           | varchar(100) | NULL   | 党支部id             | 
| dzb_name         | varchar(100) | NULL   | 党支部名称           | 
| create_id        | varchar(100) | NULL   | 创建者id             | 

### hmdj_evaluate_rules(积分榜规则)
| 字段名            | 类型        | 默认值 | 注释                 | 
| ----------------- | ----------- | ------ | -------------------- | 
| party_branch_id   | varchar(100) | NULL   | 党支部id             | 
| rule1             | varchar(10)  | NULL   | 规则1                | 
| type              | varchar(100) | NULL   | 类型: 1.月度,2.季度,3.年度 | 
| rule2             | varchar(10)  | NULL   | 规则2                | 
| date              | varchar(100) | NULL   | 日期字符串,年月        | 

# 会签流程
```mermaid
graph TB
有权限的用户进入总和评价页面 --待提交的记录--> 待提交的记录
待提交的记录 --会签记录表中,插入该部门下的所有党员的会签数据-->该部门下的党员角色
该部门下的党员角色 --非这两个角色,不会自动--> 手动会签操作
该部门下的党员角色 ----积分管理员和党建角色,提交会签自动会签----> 自动会签操作
自动会签操作 --一个党员--> 自动将指标库状态设置成已发布
自动会签操作 --多个党员--> 继续下个会签
手动会签操作 --会签还没有100%同意--> 继续下个会签 
继续下个会签 --会签100%通过--> 自动将指标库状态设置成已发布
手动会签操作 --一个党员不同意--> 指标库状态不成功

```