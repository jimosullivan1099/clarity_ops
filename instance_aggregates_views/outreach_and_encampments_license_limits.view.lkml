include: "license_limits.view.lkml"

view: outreach_and_encampments_license_limits {
  extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: outreach_and_encampments_license_limit {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: outreach_and_encampments_license_limit_name {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: outreach_and_encampments_license_limit_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }

  measure: outreach_and_encampments_license_limit_sum {
    type: sum
    sql:  ${TABLE}.license_limit_count ;;
  }
}
