- view: picklist_log_old
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ref_picklist_log
    type: number
    sql: ${TABLE}.ref_picklist_log

  - dimension: sort
    type: number
    sql: ${TABLE}.sort

  - dimension: value_name
    type: string
    sql: ${TABLE}.value_name

  - measure: count
    type: count
    drill_fields: [id, value_name]

