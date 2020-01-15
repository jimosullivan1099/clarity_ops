include: "license_limits.view.lkml"

view: aggregated_advanced_privacy_and_security_compliance_license_limits {
  extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: license_limit_name {
    label: "Advanced Privacy and Securiy Complince Limit Name"
    type: string
    sql:  ${TABLE}.license_limit_name ;;
  }

  dimension: license_limit_count {
    label: "Advanced Privacy And Security Compliance Limit Count"
    type: number
    sql:  ${TABLE}.license_limit_count ;;
  }
}
