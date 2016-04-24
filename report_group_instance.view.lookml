- view: report_group_instance
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ref_group
    type: number
    sql: ${TABLE}.ref_group

  - dimension: ref_instance
    type: number
    sql: ${TABLE}.ref_instance

  - measure: count
    type: count
    drill_fields: [id]

