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