view: screen_field_log_instance {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_instance {
    type: number
    sql: ${TABLE}.ref_instance ;;
  }

  dimension: ref_screen_field_log {
    type: number
    sql: ${TABLE}.ref_screen_field_log ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
