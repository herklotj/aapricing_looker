view: business_rules_mi {
  derived_table: {
    sql:

SELECT  CAST(quote_dttm AS DATE) AS Quote_Date,
        rct_mi_13 as scheme,
        COUNT(*) AS Quotes,
        SUM(rct_noquote_an) AS No_Quotes,
        CASE WHEN min_age < 25 then 1 else 0 end as age_25_flag,
        CASE WHEN min_age > 79 then 1 else 0 end as age_80plus_flag


 FROM aapricing.v_business_rules_mi


GROUP BY
CAST(quote_dttm AS DATE),
rct_mi_13,
CASE WHEN min_age < 25 then 1 else 0 end,
CASE WHEN min_age > 79 then 1 else 0 end

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
    sql: 1 - max(no_quotes *1.000 / Quotes * 1.000);;

  }


  measure: quotability_max {
    type: number
    sql: 1 - min (no_quotes * 1.000 / Quotes * 1.000);;

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
