#include: "../clarity_ops.model"

view: master_database_servers {
  sql_table_name:  server_instance ;;
  #derived_table: {
  #  explore_source: master_database_servers {
  #    column: id {}
  #    column: name {}
  #    column: ref_server {}
  #  }
  #  datagroup_trigger: licencsing_cache
  #  indexes: ["id"]
  #}

  dimension: master_server_id {
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: server_id {
    sql: ${TABLE}.ref_server ;;
  }

  dimension: master_server_name {
    sql: ${TABLE}.name ;;
  }

  measure: master_server_count {
    type: count
  }
}
