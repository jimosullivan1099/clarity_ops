view: aggregated_users {

  view_label: "Clarity Users"

  sql_table_name: clarity_instance_aggregates.users ;;

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.user_id) ;;
  }

  dimension: system_url {
    hidden: yes
    type: string
    sql: ${TABLE}.system_url ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: ops_instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: ops_license_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ops_license_id ;;
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

  dimension_group: user_added {
    type: time
    timeframes: [date, week, month, quarter, fiscal_quarter]:
    sql: ${TABLE}.user_added_date ;;
  }

  dimension_group: user_last_visited {
    type: time
    timeframes: [time, date, week, month]:
    sql: ${TABLE}.user_last_visited_date ;;
  }

  measure: users_count {
    type: count
    drill_fields: [basic_drilldown*]
  }

  set: basic_fields {
    fields: [user_id,
      user_name,
      user_email,
      user_status,
      users_count,
      user_added_date,
      user_added_month,
      user_added_week,
      user_added_quarter,
      user_added_fiscal_quarter,
      user_last_visited_date,
      user_last_visited_month,
      user_last_visited_time,
      user_last_visited_week]
  }

  set: basic_drilldown {
    fields: [user_id,
      user_name,
      user_email,
      user_status,
      user_added_date,
      user_last_visited_time]
  }

}
