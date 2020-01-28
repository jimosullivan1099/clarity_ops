view: database_servers {

  view_label: "Clarity Instances"

  sql_table_name:  clarity_ops.server_instance_database ;;

  dimension: database_id {
    hidden: yes
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

  set: basic_fields {
    fields: [database_name]
  }
}
