include: "license_limits.view.lkml"

view: advanced_privacy_and_security_compliance_license_limits {
  extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: advanced_privacy_and_security_compliance_limit {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: advanced_privacy_and_security_compliance_limit_name {
    sql:  ${TABLE}.license_limit_name ;;
  }

  measure: advanced_privacy_and_security_compliance_limit_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }

  measure: advanced_privacy_and_security_compliance_limit_sum {
    type: sum
    sql:  ${TABLE}.license_limit_count ;;
  }
}
