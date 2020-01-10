view: process {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: finished {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.finished_at ;;
  }

  dimension: messages {
    type: string
    sql: ${TABLE}.messages ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pid {
    type: number
    value_format_name: id
    sql: ${TABLE}.pid ;;
  }

  dimension_group: started {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.started_at ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, instance_report_server_queue.count]
  }
}
