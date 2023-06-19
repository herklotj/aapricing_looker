view: business_rules_quotability {
  derived_table: {
    sql:
SELECT  concat(  year(quote_dttm), '-', month(quote_dttm), '-', '01' ) AS Quote_Month,
        rct_mi_13 as scheme,
        COUNT(*) AS Quotes,
        SUM(rct_noquote_an) AS No_Quotes,
        CASE WHEN min_age < 25 then 1 else 0 end as age_25_flag,
        CASE WHEN min_age > 79 then 1 else 0 end as age_80plus_flag


FROM aapricing.v_business_rules_quotability


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
