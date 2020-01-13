include: "license_limits.view.lkml"

view: aggregated_self_service_license_purchase_license_limits {
extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: self_service_license_purchase_license_limit {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: self_service_license_purchase_license_limit_name {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: self_service_license_purchase_license_limit_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }

  measure: self_service_license_purchase_license_limit_sum {
    type: sum
    sql:  ${TABLE}.license_limit_count ;;
  }
}