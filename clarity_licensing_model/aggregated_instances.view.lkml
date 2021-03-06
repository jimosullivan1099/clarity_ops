view: aggregated_instances {
  sql_table_name: clarity_instance_aggregates.instances ;;

  dimension: system_url {
    primary_key: yes
    type: string
    sql: ${TABLE}.system_url ;;
  }

  dimension: ops_instance_id {
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  measure: aggregated_instances_count {
    type: count
  }
}
