view: report_group_instance {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_group {
    type: number
    sql: ${TABLE}.ref_group ;;
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
