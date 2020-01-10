view: instances {
  sql_table_name: clarity_instance_aggregates.instances ;;
  drill_fields: [ops_instance_id]

  dimension: ops_instance_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: system_url {
    type: string
    sql: ${TABLE}.system_url ;;
  }

  measure: count {
    type: count
    drill_fields: [ops_instance_id]
  }
}
