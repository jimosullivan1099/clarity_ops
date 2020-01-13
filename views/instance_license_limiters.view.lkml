view: instance_license_limiters {
  sql_table_name: clarity_ops.instance_license_limiters ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_instance ;;
  }

  dimension: license_limiter_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_limit ;;
  }

  measure: limit_value_max {
    type: max
    sql: ${TABLE}.value ;;
  }

  measure: limit_value_sum {
    type: sum
    sql: ${TABLE}.value ;;
  }
}
