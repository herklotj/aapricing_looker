view: business_rules_quotability {
  derived_table: {
    sql:
SELECT  concat(  year(quote_dttm), '-', month(quote_dttm), '-', '01' ) AS Quote_Month,
        rct_mi_13 as scheme,
        COUNT(*) AS Quotes,
        SUM(rct_noquote_an) AS No_Quotes,
        CASE WHEN min_age < 25 then 1 else 0 end as age_25_flag,
        CASE WHEN min_age > 79 then 1 else 0 end as age_80plus_flag


FROM (


SELECT rr.*,
c.quote_id,
c.cover_start_dt,
c.quote_dttm,
c.customer_key,
c.provenance_code,
c.member_score_unbanded,
c.rct_modelnumber,
c.rct_noquote_an,
c.motor_transaction_type,
c.business_purpose,
rct_mi_13,

LEAST ( ( CASE WHEN d1.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d1.birth_dt) / 12 ) end ),
      ( CASE WHEN d2.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d2.birth_dt) / 12 ) end ),
      ( CASE WHEN d3.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d3.birth_dt) / 12 ) end ),
      ( CASE WHEN d4.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d4.birth_dt) / 12 ) end )   ) as min_age


FROM actian.qs_radar_return rr
JOIN qs_cover c ON rr.quote_id = c.quote_id AND to_date(rr.quote_dttm) >= '2020-01-01' /*to_date(SYSDATE) - to_date(rr.quote_dttm) <= 365 AND to_date(SYSDATE) - to_date(rr.quote_dttm) >= 1*/
JOIN qs_mi_outputs mi ON rr.quote_id = mi.quote_id
JOIN qs_drivers d1 on c.quote_id = d1.quote_id AND d1.driver_id = 0
LEFT JOIN qs_drivers d2 ON c.quote_id = d2.quote_id AND d2.driver_id = 1
LEFT JOIN qs_drivers d3 ON c.quote_id = d3.quote_id AND d3.driver_id = 2
LEFT JOIN qs_drivers d4 ON c.quote_id = d4.quote_id AND d4.driver_id = 3

WHERE
(CASE WHEN business_purpose = 'CrossQuote' THEN 'XQ' WHEN business_purpose = 'Renewal' and hour(rr.quote_dttm) < 7 THEN 'RWL' WHEN motor_transaction_type = 'MidTermAdjustmen' THEN 'MTA' ELSE 'NB' END) = 'NB'

) a


GROUP BY
concat(  year(quote_dttm), '-', month(quote_dttm), '-', '01' ),
rct_mi_13,
CASE WHEN min_age < 25 then 1 else 0 end,
CASE WHEN min_age > 79 then 1 else 0 end


            ;;
  }


  dimension: quote_month{
    type: date_month
    sql:  quote_month ;;
  }

  dimension: scheme{
    type: string
    sql:  scheme ;;
  }

  dimension: age_25_flag{
    type: string
    sql:  age_25_flag ;;
  }

  dimension: age_80plus_flag{
    type: string
    sql:  age_80plus_flag ;;
  }


  measure: quotes {
    type: number
    sql: sum(quotes);;

  }

  measure: no_quotes {
    type: number
    sql: sum(no_quotes);;

  }


  measure: quotability_min {
    type: number
    sql: 1 - (no_quotes *1.000 / Quotes * 1.000);;

  }




  measure: total_declines {
    type: number
    sql: sum(No_Quotes);;

  }


  measure: total_quotes {
    type: number
    sql: sum(Quotes);;

  }



}
