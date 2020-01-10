view: server_instance {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: in_reporting_queue {
    type: number
    sql: ${TABLE}.in_reporting_queue ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: max_concurrent {
    type: number
    sql: ${TABLE}.max_concurrent ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: pentaho_instance {
    type: string
    sql: ${TABLE}.pentaho_instance ;;
  }

  dimension: pentaho_password {
    type: string
    sql: ${TABLE}.pentaho_password ;;
  }

  dimension: pentaho_port {
    type: number
    sql: ${TABLE}.pentaho_port ;;
  }

  dimension: pentaho_solution {
    type: string
    sql: ${TABLE}.pentaho_solution ;;
  }

  dimension: pentaho_user {
    type: string
    sql: ${TABLE}.pentaho_user ;;
  }

  dimension: pentaho_version {
    type: number
    sql: ${TABLE}.pentaho_version ;;
  }

  dimension: ref_master {
    type: number
    sql: ${TABLE}.ref_master ;;
  }

  dimension: ref_role {
    type: number
    sql: ${TABLE}.ref_role ;;
  }

  dimension: ref_server {
    type: number
    sql: ${TABLE}.ref_server ;;
  }

  dimension: slave_usage {
    type: number
    sql: ${TABLE}.slave_usage ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, username]
  }
}
