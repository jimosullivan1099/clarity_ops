view: transaction {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    label: "setup fee"
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: sum_setup_fee {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  dimension_group: date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: increase_amount {
    label: "monthly fee"
    type: number
    sql: ${TABLE}.increase_amount ;;
  }

  measure: sum_increase_amount {
    type: sum
    sql: ${TABLE}.increase_amount ;;
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

  dimension: ref_license_count {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_license_count ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count_distinct_username {
    type: count_distinct
    sql:  ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, username]
  }
}
