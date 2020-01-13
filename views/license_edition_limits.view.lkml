view: license_edition_limits {
  sql_table_name: clarity_ops.license_edition_limits ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ref_edition {
    type: number
    sql: ${TABLE}.ref_edition ;;
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
  }
}
