view: aggregated_users {
  sql_table_name: clarity_instance_aggregates.users ;;

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.user_id) ;;
  }

  dimension: system_url {
    type: string
    sql: ${TABLE}.system_url ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: ops_instance_id {
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  dimension: user_status_id {
    type: number
    sql: ${TABLE}.user_status_id ;;
  }

  dimension: user_status {
    type: string
    sql: ${TABLE}.user_status ;;
  }

  dimension: license_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.license_type_id ;;
  }

  dimension: license_type {
    type: string
    sql: ${TABLE}.license_type ;;
  }

  measure: users_count {
    type: count
  }
}
