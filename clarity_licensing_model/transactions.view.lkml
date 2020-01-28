view: transactions {

  view_label: "Clarity Licenses"


  sql_table_name: clarity_ops.transaction ;;

  dimension: transaction_id {
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
    value_format_name: usd
  }

  dimension: transaction_monthly_fee {
    type: number
    sql: ${TABLE}.increase_amount ;;
    value_format_name: usd
  }

  measure: transactions_count {
    type: count
  }

  measure: transaction_setup_fee_max {
    hidden: yes
    type: max
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: transaction_setup_fee_sum {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: transaction_monthly_fee_max {
    hidden: yes
    type: max
    sql: ${TABLE}.increase_amount ;;
    value_format_name: usd
  }

  measure: transaction_monthly_fee_sum {
    type: sum
    sql: ${TABLE}.increase_amount ;;
    value_format_name: usd
  }
}
