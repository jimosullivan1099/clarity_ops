- view: _auth_item_child
  fields:

  - dimension: child
    type: string
    sql: ${TABLE}.child

  - dimension: parent
    type: string
    sql: ${TABLE}.parent

  - measure: count
    type: count
    drill_fields: []

