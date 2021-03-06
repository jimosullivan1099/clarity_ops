view: field_log_instance {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_field_log {
    type: number
    sql: ${TABLE}.ref_field_log ;;
  }

  dimension: ref_instance {
    type: number
    sql: ${TABLE}.ref_instance ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
