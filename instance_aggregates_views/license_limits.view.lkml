view: license_limits {
  sql_table_name: clarity_instance_aggregates.license_limits ;;

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.license_type_id, '-', ${TABLE}.license_limit_id) ;;
  }

  dimension: system_url {
    type: string
    sql: ${TABLE}.system_url ;;
  }

  dimension: license_type_id {
    type: number
    sql: ${TABLE}.license_type_id ;;
  }

  dimension: license_limit_id {
    type: number
    sql: ${TABLE}.license_limit_id ;;
  }

  dimension: ops_instance_id {
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: license_limit_name {
    type: string
    sql: ${TABLE}.license_limit_name ;;
  }

  measure: license_limit_count {
    type: number
    sql: ${TABLE}.license_limit_count ;;
  }
}
