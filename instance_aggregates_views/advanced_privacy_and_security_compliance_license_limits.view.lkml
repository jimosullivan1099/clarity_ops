#include: "../clarity_ops.model"

view: advanced_privacy_and_security_compliance_license_limits {
  sql_table_name: clarity_instance_aggregates.license_limits ;;
  #  derived_table: {
  #    explore_source: license_limits {
  #      column: system_url {}
  #      column: license_type_id {}
  #      column: license_limit_count {}
  #      column: license_limit_name {}
  #      filters: {
  #        field: license_limits.license_limit_name
  #        value: "Advanced Privacy & Security Compliance"
  #      }
  #    }
  #    datagroup_trigger: licencsing_cache
  #    indexes: ["system_url","license_type_id"]
  #  }

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.license_type_id) ;;
  }

  dimension: system_url {
    sql: ${TABLE}.system_url ;;
  }

  dimension: license_type_id {
    sql: ${TABLE}.license_type_id ;;
  }

  dimension: license_limit_name {
    type: string
    sql: ${TABLE}.license_limit_name ;;
  }

  dimension: advanced_privacy_and_security_compliance_limit_count {
    type: number
    sql:  ${TABLE}.license_limit_count ;;
  }

  measure: advanced_privacy_and_security_compliance_limit_count_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }
}
