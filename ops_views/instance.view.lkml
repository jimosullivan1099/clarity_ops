view: instance {
  dimension: instance_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: instance_description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: instance_hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: instance_message {
    hidden: yes
    type: string
    sql: ${TABLE}.instance_message ;;
  }

  dimension: internal_hostname {
    hidden: yes
    type: string
    sql: ${TABLE}.internal_hostname ;;
  }

  dimension: jndi {
    hidden: yes
    type: string
    sql: ${TABLE}.jndi ;;
  }

  dimension: instance_looker_access {
    type: yesno
    sql: ${TABLE}.looker_access ;;
  }

  dimension: instance_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: queue_server_password {
    hidden: yes
    type: string
    sql: ${TABLE}.queue_server_password ;;
  }

  dimension: queue_server_username {
    hidden: yes
    type: string
    sql: ${TABLE}.queue_server_username ;;
  }

  dimension: ref_build {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_build ;;
  }

  dimension: ref_database {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_database ;;
  }

  dimension: ref_db_server {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_db_server ;;
  }

  dimension: ref_db_slave_olap {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_db_slave_olap ;;
  }

  dimension: ref_db_slave_rep {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_db_slave_rep ;;
  }

  dimension: ref_server_group {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_server_group ;;
  }

  dimension: ref_time_zone {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_time_zone ;;
  }

  dimension: reporting_mode {
    hidden: yes
    type: number
    sql: ${TABLE}.reporting_mode ;;
  }

  dimension: status {
    hidden: yes
    type: yesno
    sql: ${TABLE}.status ;;
  }

  measure: ops_instance_count {
    type: count
    drill_fields: [instance_id, internal_hostname, instance_hostname, queue_server_username, instance_name]
  }
}
