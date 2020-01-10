include: "../clarity_ops.model"

view: master_database_servers {
  derived_table: {
    explore_source: master_database_servers {
      column: instance_server_id {}
      column: server_id {}
      column: instance_server_name {}
    }
    sql_trigger_value: SELECT 1 ;;
    indexes: ["instance_server_id"]
  }

  dimension: instance_server_id {
    primary_key: yes
  }

  dimension: server_id {}

  dimension: instance_server_name {}

  measure: count {
    type: count
  }
}
