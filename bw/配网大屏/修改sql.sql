-- pg 库创建表 (drud 连接池报错)
CREATE TABLE dual (

);

-- pg 库
CREATE TABLE t_jxjh_day_plan_rel (
	plan_id varchar(50) NOT NULL, -- 计划id
	gzp_id varchar(50) NULL, -- 工作票
	czp_id varchar(50) NULL, -- 操作票
	pzzy_id varchar(50) NULL, -- 标准作业id
	CONSTRAINT t_jxjh_day_plan_rel_pk PRIMARY KEY (plan_id)
);
COMMENT ON TABLE t_jxjh_day_plan_rel IS '风控计划关联工作票、操作票,标准作业 关联表';


COMMENT ON COLUMN t_jxjh_day_plan_rel.plan_id IS '计划id';
COMMENT ON COLUMN t_jxjh_day_plan_rel.gzp_id IS '工作票';
COMMENT ON COLUMN t_jxjh_day_plan_rel.czp_id IS '操作票';
COMMENT ON COLUMN t_jxjh_day_plan_rel.pzzy_id IS '标准作业id';

--风控计划  指导卡 关联
CREATE TABLE t_jxjh_day_plan_zdk_rel (
	plan_id varchar(40) NULL, -- 计划id
	zdk_name varchar(100) NULL, -- 指导卡名称
	form_value varchar(100) NULL -- 表单值
);
COMMENT ON TABLE t_jxjh_day_plan_zdk_rel IS '风控计划  指导卡 关联';

-- Column comments

COMMENT ON COLUMN t_jxjh_day_plan_zdk_rel.plan_id IS '计划id';
COMMENT ON COLUMN t_jxjh_day_plan_zdk_rel.zdk_name IS '指导卡名称';
COMMENT ON COLUMN t_jxjh_day_plan_zdk_rel.form_value IS '表单值';


-- DROP TABLE %t_jxjh_day_plan_rel_access;

CREATE TABLE %t_jxjh_day_plan_rel_access (
	access_code varchar(100) NULL, -- 授权码
	"disable" varchar(1) NULL -- 是否有效 0.有效 1.无效
);
COMMENT ON TABLE %t_jxjh_day_plan_rel_access IS '风控计划关联授权表';

-- Column comments

COMMENT ON COLUMN %t_jxjh_day_plan_rel_access.access_code IS '授权码';
COMMENT ON COLUMN %t_jxjh_day_plan_rel_access."disable" IS '是否有效 0.有效 1.无效';