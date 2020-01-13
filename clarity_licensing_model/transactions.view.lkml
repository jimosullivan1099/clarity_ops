view: transactions {
  sql_table_name: clarity_ops.transaction ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: instance_license_count_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_license_count ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reconciled {
    type: number
    sql: ${TABLE}.reconciled ;;
  }

  dimension: reconciled_monthly {
    type: number
    sql: ${TABLE}.reconciled_monthly ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: setup_fee_max {
    type: max
    sql: ${TABLE}.amount ;;
  }

  measure: setup_fee_sum {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  measure: monthly_fee_max {
    type: max
    sql: ${TABLE}.increase_amount ;;
  }

  measure: monthly_fee_sum {
    type: sum
    sql: ${TABLE}.increase_amount ;;
  }
}
