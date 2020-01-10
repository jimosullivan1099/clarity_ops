view: picklist_log {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension_group: date {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: field_name {
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: ref_field {
    type: number
    sql: ${TABLE}.ref_field ;;
  }

  dimension: ref_picklist {
    type: number
    sql: ${TABLE}.ref_picklist ;;
  }

  dimension: sort {
    type: number
    sql: ${TABLE}.sort ;;
  }

  dimension: value_name {
    type: string
    sql: ${TABLE}.value_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, value_name, field_name]
  }
}
