view: _auth_item_child {
  dimension: child {
    type: string
    sql: ${TABLE}.child ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}.parent ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
