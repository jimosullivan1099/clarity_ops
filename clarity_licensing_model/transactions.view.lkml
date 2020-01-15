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

  dimension_group: transaction_date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: transaction_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: transaction_reconciled {
    type: number
    sql: ${TABLE}.reconciled ;;
  }

  dimension: transaction_reconciled_monthly {
    type: number
    sql: ${TABLE}.reconciled_monthly ;;
  }

  dimension: transaction_username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: transaction_setup_fee {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: transaction_monthly_fee {
    type: number
    sql: ${TABLE}.increase_amount ;;
  }

  measure: transactions_count {
    type: count
  }

  measure: transaction_setup_fee_max {
    type: max
    sql: ${TABLE}.amount ;;
  }

  measure: transaction_setup_fee_sum {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  measure: transaction_monthly_fee_max {
    type: max
    sql: ${TABLE}.increase_amount ;;
  }

  measure: transaction_monthly_fee_sum {
    type: sum
    sql: ${TABLE}.increase_amount ;;
  }
}
