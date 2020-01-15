include: "license_limits.view.lkml"

view: aggregated_data_import_tool_license_limits {
extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: data_import_tool_license_limit_name {
    type: string
    sql:  ${TABLE}.license_limit_name ;;
  }

  dimension: data_import_tool_license_limit_count {
    type: number
    sql:  ${TABLE}.license_limit_count ;;
  }
}
