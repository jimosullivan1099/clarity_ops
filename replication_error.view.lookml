- view: replication_error
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: entry
    type: string
    sql: ${TABLE}.entry

  - dimension: message
    type: string
    sql: ${TABLE}.message

  - dimension: ref_entry
    type: number
    sql: ${TABLE}.ref_entry

  - dimension: ref_instance
    type: number
    sql: ${TABLE}.ref_instance

  - measure: count
    type: count
    drill_fields: [id]

