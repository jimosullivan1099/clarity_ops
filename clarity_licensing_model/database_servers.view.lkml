view: database_servers {

  sql_table_name:  clarity_ops.server_instance_database ;;

  dimension: database_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: master_server_id {
    type: number
    sql: ${TABLE}.ref_server_instance ;;
  }

  measure: database_count {
    type: count
  }
}
