view: _db_migration {
  dimension: apply_time {
    type: number
    sql: ${TABLE}.apply_time ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
