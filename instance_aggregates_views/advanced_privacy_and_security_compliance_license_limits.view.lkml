include: "*.view.lkml"

view: advanced_privacy_and_security_compliance_license_limits {
  extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  measure: advanced_privacy_and_security_compliance_limit_count_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }
}
