- view: report_group_report
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ref_group
    type: number
    sql: ${TABLE}.ref_group

  - dimension: ref_report
    type: number
    sql: ${TABLE}.ref_report

  - measure: count
    type: count
    drill_fields: [id]

