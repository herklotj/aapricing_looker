view: business_rules {
  derived_table: {
    sql: SELECT  CAST(quote_dttm AS DATE) AS Quote_Date,
        rct_modelnumber,
        CASE WHEN business_purpose = 'CrossQuote' THEN 'XQ' WHEN business_purpose = 'Renewal' and hour(quote_dttm) < 7 THEN 'RWL' WHEN motor_transaction_type = 'MidTermAdjustmen' THEN 'MTA' ELSE 'NB' END AS quote_type,
        rct_mi_13 as scheme,
        Member_Score_Band,
        CASE WHEN min_age < 25 then 1 else 0 end as age_25_flag,
        CASE WHEN min_age > 79 then 1 else 0 end as age_80plus_flag,
        COUNT(*) AS Quotes,
        SUM(rct_noquote_an) AS No_Quotes,
        SUM(CASE WHEN radar_no_bus_rules_failed > 0 THEN 1 ELSE 0 END) AS Refer_Count,
        SUM(rct_br001_covertype) AS rct_br001_covertype,
        SUM(rct_br002_piratedarea) AS rct_br002_piratedarea,
        SUM(rct_br003_postalsector) AS rct_br003_postalsector,
        SUM(rct_br004_postalarea) AS rct_br004_postalarea,
        SUM(rct_br005_quotelag) AS rct_br005_quotelag,
        SUM(rct_br006_insuredprevdeclinedcancelled) AS rct_br006_insuredprevdeclinedcancelled,
        SUM(rct_br007_ncdgreaterthanresidencyyears) AS rct_br007_ncdgreaterthanresidencyyears,
        SUM(rct_br008_ncdgreaterthanlicenceyears) AS rct_br008_ncdgreaterthanlicenceyears,
        SUM(rct_br009_nonmotoringconvictions) AS rct_br009_nonmotoringconvictions,
        SUM(rct_br010_ncdwayearned) AS rct_br010_ncdwayearned,
        SUM(rct_br011_ncdpdeclined) AS rct_br011_ncdpdeclined,
        SUM(rct_br012_driverage) AS rct_br012_driverage,
        SUM(rct_br013_driverlicencetype) AS rct_br013_driverlicencetype,
        SUM(rct_br014_driverlicenceyears) AS rct_br014_driverlicenceyears,
        SUM(rct_br015_driverresidency) AS rct_br015_driverresidency,
        SUM(rct_br016_driversnb) AS rct_br016_driversnb,
        SUM(rct_br017_maindriver) AS rct_br017_maindriver,
        SUM(rct_br018_relationshiptoph) AS rct_br018_relationshiptoph,
        SUM(rct_br019_anydriver) AS rct_br019_anydriver,
        SUM(rct_br020_classofuse) AS rct_br020_classofuse,
        SUM(rct_br021_carowner) AS rct_br021_carowner,
        SUM(rct_br022_registeredkeeper) AS rct_br022_registeredkeeper,
        SUM(rct_br023_vehicleage) AS rct_br023_vehicleage,
        SUM(rct_br024_lhd) AS rct_br024_lhd,
        SUM(rct_br025_modifications) AS rct_br025_modifications,
        SUM(rct_br026_minvehiclevalue) AS rct_br026_minvehiclevalue,
        SUM(rct_br027_maxvehiclevalue) AS rct_br027_maxvehiclevalue,
        SUM(rct_br028_vehiclesecurity) AS rct_br028_vehiclesecurity,
        SUM(rct_br029_overnightaddress) AS rct_br029_overnightaddress,
        SUM(rct_br030_carregunavilable) AS rct_br030_carregunavilable,
        SUM(rct_br031_vehiclenotyetpurchased) AS rct_br031_vehiclenotyetpurchased,
        SUM(rct_br032_mileage) AS rct_br032_mileage,
        SUM(rct_br033_drivernonminorconvictions) AS rct_br033_drivernonminorconvictions,
        SUM(rct_br034_policyconvictions) AS rct_br034_policyconvictions,
        SUM(rct_br035_policywsclaims) AS rct_br035_policywsclaims,
        SUM(rct_br036_policynonwsclaims) AS rct_br036_policynonwsclaims,
        SUM(rct_br037_policyclaimsandconvictions) AS rct_br037_policyclaimsandconvictions,
        SUM(rct_br039_vehicledecline) AS rct_br039_vehicledecline,
        SUM(rct_br040_fueltype) AS rct_br040_fueltype,
        SUM(rct_br041_excess) AS rct_br041_excess,
        SUM(rct_br042_insufficientdata) AS rct_br042_insufficientdata,
        SUM(rct_br043_noofmtas) AS rct_br043_noofmtas,
        SUM(rct_br044_occupation) AS rct_br044_occupation,
        SUM(rct_br045_businesstype) AS rct_br045_businesstype,
        SUM(rct_br046_classofuse_occbustype) AS rct_br046_classofuse_occbustype,
        SUM(rct_br047_strategic) AS rct_br047_strategic,
        SUM(rct_br048_vehicleimported) AS rct_br048_vehicleimported,
        SUM(rct_br049_vehiclescrapped) AS rct_br049_vehiclescrapped,
        SUM(rct_br050_vehicleexported) AS rct_br050_vehicleexported,
        SUM(rct_br051_vehicleimportednoneu) AS rct_br051_vehicleimportednoneu,
        SUM(rct_br052_vehiclefinancepresent) AS rct_br052_vehiclefinancepresent,
        SUM(rct_br053_vehiclelosstype) AS rct_br053_vehiclelosstype,
        SUM(rct_br054_vehicletheftindicator) AS rct_br054_vehicletheftindicator,
        SUM(rct_br055_vehiclemileagedata) AS rct_br055_vehiclemileagedata,
        SUM(rct_br056_vehiclestolen) AS rct_br056_vehiclestolen,
        SUM(rct_br057_noofpreviouskeepers) AS rct_br057_noofpreviouskeepers,
        SUM(rct_br058_vicresult) AS rct_br058_vicresult,
        SUM(rct_br059_cueclaimscount) AS rct_br059_cueclaimscount,
        SUM(rct_br060_cuepiclaimscount) AS rct_br060_cuepiclaimscount,
        SUM(rct_br061_delphinoaddresstrace) AS rct_br061_delphinoaddresstrace,
        SUM(rct_br062_electoralrollnameandaddressmatch) AS rct_br062_electoralrollnameandaddressmatch,
        SUM(rct_br63_ccjorbankruptcy) AS rct_br63_ccjorbankruptcy,
        SUM(rct_br64_caisaccounts) AS rct_br64_caisaccounts,
        SUM(rct_br65_capssearches) AS rct_br65_capssearches,
        SUM(rct_br66_creditscore) AS rct_br66_creditscore,
        SUM(rct_br67_throttle) AS rct_br67_throttle,
        SUM(rct_br68_phdrivingstatus) AS rct_br68_phdrivingstatus,
        SUM(rct_br69_parentfronting) AS rct_br69_parentfronting,
        SUM(rct_br70_vehicleperformance) AS rct_br70_vehicleperformance,
        SUM(rct_br71_placeholder_01) AS rct_br71_placeholder_01,
        SUM(rct_br72_placeholder_02) AS rct_br72_placeholder_02,
        SUM(rct_br73_placeholder_03) AS rct_br73_placeholder_03,
        SUM(rct_br74_placeholder_04) AS rct_br74_placeholder_04,
        SUM(rct_br75_placeholder_05) AS rct_br75_placeholder_05,
        SUM(rct_br76_placeholder_06) AS rct_br76_placeholder_06,
        SUM(rct_br77_placeholder_07) AS rct_br77_placeholder_07,
        SUM(rct_br78_placeholder_08) AS rct_br78_placeholder_08,
        SUM(rct_br79_placeholder_09) AS rct_br79_placeholder_09,
        SUM(rct_br80_placeholder_10) AS rct_br80_placeholder_10

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
case when member_score_unbanded > 0 and member_score_unbanded < 1.1 then '<1.1'
when member_score_unbanded >= 1.1 then '>=1.1'
else 'Non Score' end as Member_Score_Band,
rct_mi_13,

LEAST ( ( CASE WHEN d1.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d1.birth_dt) / 12 ) end ),
      ( CASE WHEN d2.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d2.birth_dt) / 12 ) end ),
      ( CASE WHEN d3.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d3.birth_dt) / 12 ) end ),
      ( CASE WHEN d4.birth_dt IS NULL then NULL ELSE int( Months_between(c.cover_start_dt, d4.birth_dt) / 12 ) end )   ) as min_age

FROM actian.qs_radar_return rr
JOIN qs_cover c ON rr.quote_id = c.quote_id AND to_date(SYSDATE) - to_date(rr.quote_dttm) <= 7 AND to_date(SYSDATE) - to_date(rr.quote_dttm) >= 0

INNER JOIN qs_drivers d1 on rr.quote_id = d1.quote_id AND d1.driver_id = 0
LEFT JOIN qs_mi_outputs mi ON rr.quote_id = mi.quote_id

LEFT JOIN qs_drivers d2 ON rr.quote_id = d2.quote_id AND d2.driver_id = 1
LEFT JOIN qs_drivers d3 ON rr.quote_id = d3.quote_id AND d3.driver_id = 2
LEFT JOIN qs_drivers d4 ON rr.quote_id = d4.quote_id AND d4.driver_id = 3

) a


GROUP BY
CAST(quote_dttm AS DATE),
rct_modelnumber,
CASE WHEN business_purpose = 'CrossQuote' THEN 'XQ' WHEN business_purpose = 'Renewal' and hour(quote_dttm) < 7 THEN 'RWL' WHEN motor_transaction_type = 'MidTermAdjustmen' THEN 'MTA' ELSE 'NB' END,
rct_mi_13,
Member_Score_Band,
CASE WHEN min_age < 25 then 1 else 0 end,
CASE WHEN min_age > 79 then 1 else 0 end




     ;;
  }


  dimension: Quote_Date{
    type: date
    sql:  Quote_Date ;;
  }

  dimension: age_25_flag{
    type: string
    sql:  age_25_flag ;;
  }

  dimension: age_80plus_flag{
    type: string
    sql:  age_80plus_flag ;;
  }

  dimension: rct_modelnumber{
    type: string
    sql:  rct_modelnumber ;;
  }

  dimension: quote_type{
    type: string
    sql:  quote_type ;;
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

  measure: Refer_Count {
    type: number
    sql: sum(Refer_Count);;

  }

  measure: rct_br001_covertype {
    type: number
    sql: sum(rct_br001_covertype);;

  }

  measure: rct_br002_piratedarea {
    type: number
    sql: sum(rct_br002_piratedarea);;

  }

  measure: rct_br003_postalsector {
    type: number
    sql: sum(rct_br003_postalsector);;

  }

  measure: rct_br004_postalarea {
    type: number
    sql: sum(rct_br004_postalarea);;

  }

  measure: rct_br005_quotelag {
    type: number
    sql: sum(rct_br005_quotelag);;

  }

  measure: rct_br006_insuredprevdeclinedcancelled {
    type: number
    sql: sum(rct_br006_insuredprevdeclinedcancelled);;

  }

  measure: rct_br007_ncdgreaterthanresidencyyears {
    type: number
    sql: sum(rct_br007_ncdgreaterthanresidencyyears);;

  }

  measure: rct_br008_ncdgreaterthanlicenceyears {
    type: number
    sql: sum(rct_br008_ncdgreaterthanlicenceyears);;

  }

  measure: rct_br009_nonmotoringconvictions {
    type: number
    sql: sum(rct_br009_nonmotoringconvictions);;

  }

  measure: rct_br010_ncdwayearned {
    type: number
    sql: sum(rct_br010_ncdwayearned);;

  }

  measure: rct_br011_ncdpdeclined {
    type: number
    sql: sum(rct_br011_ncdpdeclined);;

  }

  measure: rct_br012_driverage {
    type: number
    sql: sum(rct_br012_driverage);;

  }

  measure: rct_br013_driverlicencetype {
    type: number
    sql: sum(rct_br013_driverlicencetype);;

  }

  measure: rct_br014_driverlicenceyears {
    type: number
    sql: sum(rct_br014_driverlicenceyears);;

  }

  measure: rct_br015_driverresidency {
    type: number
    sql: sum(rct_br015_driverresidency);;

  }

  measure: rct_br016_driversnb {
    type: number
    sql: sum(rct_br016_driversnb);;

  }

  measure: rct_br017_maindriver {
    type: number
    sql: sum(rct_br017_maindriver);;

  }

  measure: rct_br018_relationshiptoph {
    type: number
    sql: sum(rct_br018_relationshiptoph);;

  }

  measure: rct_br019_anydriver {
    type: number
    sql: sum(rct_br019_anydriver);;

  }

  measure: rct_br020_classofuse {
    type: number
    sql: sum(rct_br020_classofuse);;

  }

  measure: rct_br021_carowner {
    type: number
    sql: sum(rct_br021_carowner);;

  }

  measure: rct_br022_registeredkeeper {
    type: number
    sql: sum(rct_br022_registeredkeeper);;

  }

  measure: rct_br023_vehicleage {
    type: number
    sql: sum(rct_br023_vehicleage);;

  }

  measure: rct_br024_lhd {
    type: number
    sql: sum(rct_br024_lhd);;

  }

  measure: rct_br025_modifications {
    type: number
    sql: sum(rct_br025_modifications);;

  }

  measure: rct_br026_minvehiclevalue {
    type: number
    sql: sum(rct_br026_minvehiclevalue);;

  }

  measure: rct_br027_maxvehiclevalue {
    type: number
    sql: sum(rct_br027_maxvehiclevalue);;

  }

  measure: rct_br028_vehiclesecurity {
    type: number
    sql: sum(rct_br028_vehiclesecurity);;

  }

  measure: rct_br029_overnightaddress {
    type: number
    sql: sum(rct_br029_overnightaddress);;

  }


  measure: rct_br030_carregunavilable {
    type: number
    sql: sum(rct_br030_carregunavilable);;

  }


  measure: rct_br031_vehiclenotyetpurchased {
    type: number
    sql: sum(rct_br031_vehiclenotyetpurchased);;

  }


  measure: rct_br032_mileage {
    type: number
    sql: sum(rct_br032_mileage);;

  }


  measure: rct_br033_drivernonminorconvictions {
    type: number
    sql: sum(rct_br033_drivernonminorconvictions);;

  }


  measure: rct_br034_policyconvictions {
    type: number
    sql: sum(rct_br034_policyconvictions);;

  }


  measure: rct_br035_policywsclaims {
    type: number
    sql: sum(rct_br035_policywsclaims);;

  }


  measure: rct_br036_policynonwsclaims {
    type: number
    sql: sum(rct_br036_policynonwsclaims);;

  }


  measure: rct_br037_policyclaimsandconvictions {
    type: number
    sql: sum(rct_br037_policyclaimsandconvictions);;

  }

  measure: rct_br039_vehicledecline {
    type: number
    sql: sum(rct_br039_vehicledecline);;

  }


  measure: rct_br040_fueltype {
    type: number
    sql: sum(rct_br040_fueltype);;

  }

  measure: rct_br041_excess {
    type: number
    sql: sum(rct_br041_excess);;

  }

  measure: rct_br042_insufficientdata {
    type: number
    sql: sum(rct_br042_insufficientdata);;

  }

  measure: rct_br043_noofmtas {
    type: number
    sql: sum(rct_br043_noofmtas);;

  }


  measure: rct_br044_occupation {
    type: number
    sql: sum(rct_br044_occupation);;

  }


  measure: rct_br045_businesstype {
    type: number
    sql: sum(rct_br045_businesstype);;

  }


  measure: rct_br046_classofuse_occbustype {
    type: number
    sql: sum(rct_br046_classofuse_occbustype);;

  }


  measure: rct_br047_strategic {
    type: number
    sql: sum(rct_br047_strategic);;

  }


  measure: rct_br048_vehicleimported {
    type: number
    sql: sum(rct_br048_vehicleimported);;

  }


  measure: rct_br049_vehiclescrapped {
    type: number
    sql: sum(rct_br049_vehiclescrapped);;

  }


  measure: rct_br050_vehicleexported {
    type: number
    sql: sum(rct_br050_vehicleexported);;

  }


  measure: rct_br051_vehicleimportednoneu {
    type: number
    sql: sum(rct_br051_vehicleimportednoneu);;

  }


  measure: rct_br052_vehiclefinancepresent {
    type: number
    sql: sum(rct_br052_vehiclefinancepresent);;

  }


  measure: rct_br053_vehiclelosstype {
    type: number
    sql: sum(rct_br053_vehiclelosstype);;

  }


  measure: rct_br054_vehicletheftindicator {
    type: number
    sql: sum(rct_br054_vehicletheftindicator);;

  }

  measure: rct_br055_vehiclemileagedata {
    type: number
    sql: sum(rct_br055_vehiclemileagedata);;

  }


  measure: rct_br056_vehiclestolen {
    type: number
    sql: sum(rct_br056_vehiclestolen);;

  }


  measure: rct_br057_noofpreviouskeepers {
    type: number
    sql: sum(rct_br057_noofpreviouskeepers);;

  }


  measure: rct_br058_vicresult {
    type: number
    sql: sum(rct_br058_vicresult);;

  }


  measure: rct_br059_cueclaimscount {
    type: number
    sql: sum(rct_br059_cueclaimscount);;

  }

  measure: rct_br060_cuepiclaimscount {
    type: number
    sql: sum(rct_br060_cuepiclaimscount);;

  }


  measure: rct_br061_delphinoaddresstrace {
    type: number
    sql: sum(rct_br061_delphinoaddresstrace);;

  }

  measure: rct_br062_electoralrollnameandaddressmatch {
    type: number
    sql: sum(rct_br062_electoralrollnameandaddressmatch);;

  }


  measure: rct_br63_ccjorbankruptcy {
    type: number
    sql: sum(rct_br63_ccjorbankruptcy);;

  }


  measure: rct_br64_caisaccounts {
    type: number
    sql: sum(rct_br64_caisaccounts);;

  }

  measure: rct_br65_capssearches {
    type: number
    sql: sum(rct_br65_capssearches);;

  }


  measure: rct_br66_creditscore {
    type: number
    sql: sum(rct_br66_creditscore);;

  }

  measure: rct_br67_throttle {
    type: number
    sql: sum(rct_br67_throttle);;

  }

  measure: rct_br68_phdrivingstatus {
    type: number
    sql: sum(rct_br68_phdrivingstatus);;

  }

  measure: rct_br69_parentfronting {
    type: number
    sql: sum(rct_br69_parentfronting);;

  }

  measure: rct_br70_vehicleperformance {
    type: number
    sql: sum(rct_br70_vehicleperformance);;

  }

  measure: rct_br71_placeholder_01 {
    type: number
    sql: sum(rct_br71_placeholder_01);;

  }

  measure: rct_br72_placeholder_02 {
    type: number
    sql: sum(rct_br72_placeholder_02);;

  }

  measure: rct_br73_placeholder_03 {
    type: number
    sql: sum(rct_br73_placeholder_03);;

  }

  measure: rct_br74_placeholder_04 {
    type: number
    sql: sum(rct_br74_placeholder_04);;

  }


  measure: rct_br75_placeholder_05 {
    type: number
    sql: sum(rct_br75_placeholder_05);;

  }


  measure: rct_br76_placeholder_06 {
    type: number
    sql: sum(rct_br76_placeholder_06);;

  }



  measure: rct_br77_placeholder_07 {
    type: number
    sql: sum(rct_br77_placeholder_07);;

  }


  measure: rct_br78_placeholder_08 {
    type: number
    sql: sum(rct_br78_placeholder_08);;

  }

  measure: rct_br79_placeholder_09 {
    type: number
    sql: sum(rct_br79_placeholder_09);;

  }


  measure: rct_br80_placeholder_10 {
    type: number
    sql: sum(rct_br80_placeholder_10);;

  }


}
