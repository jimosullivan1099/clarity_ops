#include: "../clarity_ops.model"

view: analysis_database_servers {
  sql_table_name:  server_instance ;;
  #derived_table: {
  #  explore_source: analysis_database_servers {
  #    column: id {}
  #    column: name {}
  #    column: ref_server {}
  #    column: ref_master {}
  #  }
  #  datagroup_trigger: licencsing_cache
  #  indexes: ["id"]
  #}

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
