view: instance_looker_users {
  sql_table_name:  clarity_instance_aggregates.looker_users ;;

  dimension: looker_user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.looker_user_id ;;
  }

  dimension: instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.instance_id ;;
  }

}
