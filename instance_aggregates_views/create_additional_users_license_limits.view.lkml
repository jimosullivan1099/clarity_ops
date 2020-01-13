include: "license_limits.view.lkml"

view: create_additional_users_license_limits {
extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

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
