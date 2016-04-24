- view: deleted_entry_instance
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ref_entry
    type: number
    sql: ${TABLE}.ref_entry

  - dimension: ref_instance
    type: number
    sql: ${TABLE}.ref_instance

  - measure: count
    type: count
    drill_fields: [id]

