view: aggregated_license_counts {
  sql_table_name: clarity_instance_aggregates.license_counts ;;

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.license_type_id) ;;
  }

  dimension: system_url {
    hidden: yes
    type: string
    sql: ${TABLE}.system_url ;;
  }

  dimension: license_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.license_type_id ;;
  }

  dimension: ops_instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: license_type {
    type: string
    sql: ${TABLE}.license_type ;;
  }

  dimension: license_count {
    type: number
    sql: ${TABLE}.license_max_count ;;
  }

  dimension: license_setup_fee {
    type: number
    sql:  ${TABLE}.license_amount ;;
    value_format_name: usd
  }

  dimension: license_monthly_fee {
    type: number
    sql:  ${TABLE}.license_increase_amount ;;
    value_format_name: usd
  }

  measure: license_setup_fee_max {
    type: max
    sql:  ${TABLE}.license_amount ;;
    value_format_name: usd
  }
  measure: license_monthly_fee_max {
    type: max
    sql:  ${TABLE}.license_increase_amount ;;
    value_format_name: usd
  }

  measure: license_setup_fee_sum {
    type: sum
    sql:  ${TABLE}.license_amount ;;
    value_format_name: usd
  }
  measure: license_monthly_fee_sum {
    type: sum
    sql:  ${TABLE}.license_increase_amount ;;
    value_format_name: usd
  }
}
