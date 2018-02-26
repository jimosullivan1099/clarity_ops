view: email_template {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_theme {
    type: number
    sql: ${TABLE}.ref_theme ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: system_message {
    type: yesno
    sql: ${TABLE}.system_message ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
