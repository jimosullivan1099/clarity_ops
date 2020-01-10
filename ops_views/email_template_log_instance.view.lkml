view: email_template_log_instance {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_email_template_log {
    type: number
    sql: ${TABLE}.ref_email_template_log ;;
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
