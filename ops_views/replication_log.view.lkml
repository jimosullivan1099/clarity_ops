view: replication_log {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
