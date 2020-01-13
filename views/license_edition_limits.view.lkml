view: license_edition_limits {
  sql_table_name: clarity_ops.license_edition_limits ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_edition_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_edition ;;
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
