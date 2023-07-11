--查询风控计划-风险等级统计   pg 库
select
    CASE
        when zyaq_risk = '1' then 'Ⅰ级'
        when zyaq_risk = '2' then 'Ⅱ级'
        when zyaq_risk = '3' then 'Ⅲ级'
        when zyaq_risk = '4' then 'Ⅳ级'
        when zyaq_risk = '5' then 'Ⅴ级'
    END AS name, zyaq_risk AS type, count(1) as count
from t_jxjh_day_plan
where zb_zylx_type not in ('10','11','13','14','15')
--   and ds_unit_id = #{dsUnitId}
--   and TO_CHAR(begin_time,'yyyy-MM-dd') = #{beginTimeBegin}		
group by zyaq_risk


--  查询风控计划-作业类型统计 pg 库
select
    CASE
        when zb_zylx_type = '01' then '生产检修改造'
        when zb_zylx_type = '02' then '输变电工程'
        when zb_zylx_type = '03' then '配农网工程'
        when zb_zylx_type = '04' then '装表接电'
        when zb_zylx_type = '05' then '业扩工程'
        when zb_zylx_type = '06' then '迁改工程'
        when zb_zylx_type = '07' then '网络信息作业'
        when zb_zylx_type = '08' then '通信检修施工'
        when zb_zylx_type = '09' then '外部工程'
        when zb_zylx_type = '12' then '综合能源项目'
        when zb_zylx_type = '16' then '小型基建工程'
        when zb_zylx_type = '17' then '其他'
        END AS name, zb_zylx_type AS type, count(1) as count
from t_jxjh_day_plan
where zb_zylx_type not in ('10','11','13','14','15')
--   and ds_unit_id = #{dsUnitId}
--   and TO_CHAR(begin_time,'yyyy-MM-dd') = #{beginTimeBegin}
group by zb_zylx_type


-- 操作票情况分析 XJPMSTEST 库
SELECT
    b.name,
    b.count,
    SUM (b.count) OVER () AS total,
    round((b.count/SUM (b.count) OVER ())*100,2)||'%'
    AS  percent
FROM
    (
    SELECT
        t.name AS name ,
        sum (count) AS count
    FROM
        (
        SELECT
            CASE
                WHEN tydlc.pzt = 11 THEN '待提交'
                WHEN tydlc.pzt = 21 THEN '待审核'
                WHEN tydlc.pzt = 31 THEN '待打印'
                WHEN tydlc.pzt = 41 THEN '待执行'
                WHEN tydlc.pzt = 51 THEN '已存档'
                WHEN tydlc.pzt = 61 THEN '典型票编制'
                WHEN tydlc.pzt = 71 THEN '典型票审核'
                WHEN tydlc.pzt = 81 THEN '典型票存档'
                WHEN tydlc.pzt =-1
                AND tydlc.PLX != 5 THEN '已作废'
                WHEN tydlc.pzt =-2
                AND tydlc.PLX != 6 THEN '审核'
                WHEN tydlc.pzt =-1
                AND tydlc.PLX = 5 THEN '待执行'
                WHEN tydlc.pzt =-2
                AND tydlc.PLX = 6 THEN '待提交'
            END AS name ,
            count(1) AS count
        FROM
            T_YJ_DWYJ_LP_CZPJL tydlc
        WHERE
            TYDLC.zyfl = 3
            --and tydlc.SSDSID=#{ssdsId}
            --and TO_CHAR(ZPSJ,'yyyy-MM-dd') = #{date}
        GROUP BY
            tydlc.pzt ,
            TYDLC .PLX 
) t
    GROUP BY
        t.name
) b ORDER BY b.count desc


-- 风控计划和工作票,操作票关联表
t_jxjh_day_plan_rel