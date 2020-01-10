view: analysis_database_servers {

  sql_table_name:  server_instance ;;

  dimension: analysis_server_id {
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: server_id {
    sql: ${TABLE}.ref_server ;;
  }

  dimension: master_server_id {
    sql: ${TABLE}.ref_master ;;
  }

  dimension: analysis_server_name {
    sql: ${TABLE}.name ;;
  }

  measure: analysis_server_count {
    type:  count
  }
}
