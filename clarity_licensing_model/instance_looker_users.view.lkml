view: instance_looker_users {

  view_label: "Clarity Looker Users"

  sql_table_name:  clarity_instance_aggregates.instance_looker_users ;;

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
