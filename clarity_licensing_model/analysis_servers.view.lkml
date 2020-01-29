view: analysis_servers {

  view_label: "Clarity Instances"

  sql_table_name:  clarity_ops.server_instance ;;

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

  set: basic_fields  {
    fields: [analysis_server_name, analysis_server_count]
  }
}
