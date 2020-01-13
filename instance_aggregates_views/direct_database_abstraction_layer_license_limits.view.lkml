include: "license_limits.view.lkml"

view: direct_database_abstraction_layer_license_limits {
extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  measure: direct_database_abstraction_layer_license_limit_name {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: direct_database_abstraction_layer_license_limit_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }

  measure: direct_database_abstraction_layer_license_limit_sum {
    type: sum
    sql:  ${TABLE}.license_limit_count ;;
  }
}
