include: "license_limits.view.lkml"

view: aggregated_create_additional_users_license_limits {
extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: create_additional_users_license_limit_name {
    type: string
    sql:  ${TABLE}.license_limit_name ;;
  }

  dimension: create_additional_users_license_limit_count {
    type: number
    sql:  ${TABLE}.license_limit_count ;;
  }

}
