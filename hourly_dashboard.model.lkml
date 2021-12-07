connection: "echo_actian"

# include all the views
include: "*.view"

datagroup: hourly_dashboard_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hourly_dashboard_default_datagroup

explore: hourly_mi {}
explore: business_rules {}
explore: business_rules_mi {}
