view: business_rules_mi {
  derived_table: {
    sql:

SELECT  CAST(quote_dttm AS DATE) AS Quote_Date,
        rct_mi_13 as scheme,
        COUNT(*) AS Quotes,
        SUM(rct_noquote_an) AS No_Quotes


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
rct_mi_13


FROM actian.qs_radar_return rr
JOIN qs_cover c ON rr.quote_id = c.quote_id AND to_date(SYSDATE) - to_date(rr.quote_dttm) <= 7 AND to_date(SYSDATE) - to_date(rr.quote_dttm) >= 0
JOIN qs_mi_outputs mi ON rr.quote_id = mi.quote_id

WHERE rct_mi_13 = '103' AND
(CASE WHEN business_purpose = 'CrossQuote' THEN 'XQ' WHEN business_purpose = 'Renewal' and hour(rr.quote_dttm) < 7 THEN 'RWL' WHEN motor_transaction_type = 'MidTermAdjustmen' THEN 'MTA' ELSE 'NB' END) = 'NB'

) a


GROUP BY
CAST(quote_dttm AS DATE),
rct_mi_13

        ;;
  }


  dimension: Quote_Date{
    type: date
    sql:  Quote_Date ;;
  }

  dimension: scheme{
    type: string
    sql:  scheme ;;
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
    sql: 1 - max(no_quotes *1.000 / Quotes * 1.000);;

  }


  measure: quotability_max {
    type: number
    sql: 1 - min (no_quotes * 1.000 / Quotes * 1.000);;

  }



}
