-- REFRESH sbx_monetization.mi_all_apps_d_all_sho_stg4;

SELECT
    day PERIOD,
    'mi_all_apps_d_all_sho_stg4' TB_NAME,
    CONCAT(cast(percentage AS STRING),'%') AS PERCENTAGE,
    CASE
        WHEN percentage >= 20 THEN concat('Data increase ', cast(percentage AS STRING),'% from last day')
        WHEN percentage <= -20 THEN concat('Data drop ', cast(percentage AS STRING),'% from last day')
        ELSE 'Normal'
    END AS STATUS
FROM
(
    SELECT
        day,
        count(distinct h_msisdn),
        count(1) count_all,
        lag(count(1)) OVER(ORDER BY day) as PrevCount,
        round(((count(1) - lag(count(1)) OVER(ORDER BY day))/lag(count(1)) OVER(ORDER BY day))*100,2) percentage
    FROM sbx_monetization.mi_all_apps_d_all_sho_stg4
    WHERE day BETWEEN cast(substring(regexp_replace(cast(date_add(to_date(from_unixtime(unix_timestamp(cast(${PERIODE} as string), 'yyyyMMdd'))),-1)  as string),'-',''),1,8) as int) AND cast(substring(regexp_replace(cast(to_date(from_unixtime(unix_timestamp(cast(${PERIODE} as string), 'yyyyMMdd')))  as string),'-',''),1,8) as int)
    GROUP BY day
    ORDER BY day DESC
    LIMIT 1
)x
ORDER BY day DESC;
