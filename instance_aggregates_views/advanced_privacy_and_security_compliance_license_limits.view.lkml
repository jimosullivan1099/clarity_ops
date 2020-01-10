include: "*.view.lkml"

view: advanced_privacy_and_security_compliance_license_limits {
  extends: [license_limits]
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  #dimension: prim_key {
  #  primary_key: yes
  #  hidden: yes
  #  type: string
  #  sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.license_type_id) ;;
  #}

  #dimension: system_url {
  #  sql: ${TABLE}.system_url ;;
  #}

  #dimension: license_type_id {
  #  sql: ${TABLE}.license_type_id ;;
  #}

  #dimension: license_limit_name {
  #  type: string
  #  sql: ${TABLE}.license_limit_name ;;
  #}

  dimension: advanced_privacy_and_security_compliance_limit_count {
    type: number
    sql:  ${TABLE}.license_limit_count ;;
  }

  measure: advanced_privacy_and_security_compliance_limit_count_max {
    type: max
    sql:  ${TABLE}.license_limit_count ;;
  }
}
