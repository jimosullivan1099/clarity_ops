view: server_instance_auth_params {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: ref_server_database {
    type: number
    sql: ${TABLE}.ref_server_database ;;
  }

  dimension: role {
    type: number
    sql: ${TABLE}.role ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [id, username]
  }
}
