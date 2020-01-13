include: "license_limits.view.lkml"

view: aggregated_create_additional_users_license_limits {
extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: create_additional_users_license_limit {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: create_additional_users_license_limit_name {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: create_additional_users_license_limit_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }

  measure: create_additional_users_license_limit_sum {
    type: sum
    sql:  ${TABLE}.license_limit_count ;;
  }
}
