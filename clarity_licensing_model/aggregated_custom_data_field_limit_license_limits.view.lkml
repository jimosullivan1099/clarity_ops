include: "license_limits.view.lkml"

view: aggregated_custom_data_field_limit_license_limits {
extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: custom_data_field_limit_license_limit_name {
    type: string
    sql:  ${TABLE}.license_limit_name ;;
  }

  dimension: custom_data_field_limit_license_limit_count {
    type:  number
    sql:  ${TABLE}.license_limit_count ;;
  }

}
