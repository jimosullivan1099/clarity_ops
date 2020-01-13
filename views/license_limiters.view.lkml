view: license_limiters {
  sql_table_name: clarity_ops.license_limiters ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.added_date ;;
  }

  dimension: default_value {
    type: number
    sql: ${TABLE}.default_value ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: entity_name {
    type: string
    sql: ${TABLE}.entity_name ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: sort {
    type: number
    sql: ${TABLE}.sort ;;
  }

  dimension: type {
    type: yesno
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, entity_name, display_name]
  }
}
