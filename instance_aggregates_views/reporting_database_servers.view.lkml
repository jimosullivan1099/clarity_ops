view: reporting_database_servers {

  sql_table_name:  server_instance ;;

  dimension: reporting_server_id {
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: server_id {
    sql: ${TABLE}.ref_server ;;
  }

  dimension: master_server_id {
    sql: ${TABLE}.ref_master ;;
  }

  dimension: reporting_server_name {
    sql: ${TABLE}.name ;;
  }

  measure: reporting_server_count {
    type: count
  }
}
