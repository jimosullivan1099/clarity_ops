view: license_limiter_options {
  sql_table_name: clarity_ops.license_limiter_options ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_limit {
    type: number
    sql: ${TABLE}.ref_limit ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
