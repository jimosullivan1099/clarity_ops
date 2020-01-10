view: users {
  sql_table_name: clarity_instance_aggregates.users ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: license_type_id {
    type: number
    sql: ${TABLE}.license_type_id ;;
  }

  dimension: ops_instance_id {
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: system_url {
    type: string
    sql: ${TABLE}.system_url ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: user_status {
    type: string
    sql: ${TABLE}.user_status ;;
  }

  dimension: user_status_id {
    type: number
    sql: ${TABLE}.user_status_id ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, user_name]
  }
}
