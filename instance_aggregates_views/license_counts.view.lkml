view: license_counts {
  sql_table_name: clarity_instance_aggregates.license_counts ;;

  dimension: license_amount {
    type: number
    sql: ${TABLE}.license_amount ;;
  }

  dimension: license_increase_amount {
    type: number
    sql: ${TABLE}.license_increase_amount ;;
  }

  dimension: license_max_count {
    type: number
    sql: ${TABLE}.license_max_count ;;
  }

  dimension: license_type {
    type: string
    sql: ${TABLE}.license_type ;;
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
    drill_fields: []
  }
}
