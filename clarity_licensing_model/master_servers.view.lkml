view: master_servers {

  view_label: "Clarity Instances"

  sql_table_name:  clarity_ops.server_instance ;;

  dimension: master_server_id {
    hidden: yes
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: server_id {
    hidden: yes
    sql: ${TABLE}.ref_server ;;
  }

  dimension: master_server_name {
    sql: ${TABLE}.name ;;
  }

  measure: master_server_count {
    type: count
  }
}
