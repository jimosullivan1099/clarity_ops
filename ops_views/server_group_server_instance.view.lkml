view: server_group_server_instance {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_server_group {
    type: number
    sql: ${TABLE}.ref_server_group ;;
  }

  dimension: ref_server_instance {
    type: number
    sql: ${TABLE}.ref_server_instance ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
