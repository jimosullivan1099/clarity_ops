view: reporting_servers {

  view_label: "Clarity Instances"

  sql_table_name:  clarity_ops.server_instance ;;

  dimension: reporting_server_id {
    hidden: yes
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: server_id {
    hidden: yes
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

  set: basic_fields  {
    fields: [reporting_server_name, reporting_server_count]
  }
}
