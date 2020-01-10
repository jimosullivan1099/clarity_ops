view: license_limits {
  sql_table_name: clarity_instance_aggregates.license_limits ;;
  drill_fields: [license_limit_id]

  dimension: license_limit_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.license_limit_id ;;
  }

  dimension: license_limit_count {
    type: number
    sql: ${TABLE}.license_limit_count ;;
  }

  dimension: license_name {
    type: string
    sql: ${TABLE}.license_name ;;
  }

  dimension: license_type_id {
    type: number
    sql: ${TABLE}.license_type_id ;;
  }

  dimension: ops_instance_id {
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: system_url {
    type: string
    sql: ${TABLE}.system_url ;;
  }

  measure: count {
    type: count
    drill_fields: [license_limit_id, license_name]
  }
}
