view: screen {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension_group: last_update {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_update ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_status {
    type: number
    sql: ${TABLE}.ref_status ;;
  }

  dimension: ref_type {
    type: number
    sql: ${TABLE}.ref_type ;;
  }

  dimension: replicated {
    type: number
    sql: ${TABLE}.replicated ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
