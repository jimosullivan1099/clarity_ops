view: server_role_module {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_module {
    type: number
    sql: ${TABLE}.ref_module ;;
  }

  dimension: ref_server_role {
    type: number
    sql: ${TABLE}.ref_server_role ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
