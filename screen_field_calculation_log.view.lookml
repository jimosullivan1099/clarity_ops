- view: screen_field_calculation_log
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: constants
    type: string
    sql: ${TABLE}.constants

  - dimension: external_id
    type: string
    sql: ${TABLE}.external_id

  - dimension: operation
    type: number
    sql: ${TABLE}.operation

  - dimension: ref_field
    type: number
    sql: ${TABLE}.ref_field

  - dimension: ref_field_condition
    type: number
    sql: ${TABLE}.ref_field_condition

  - dimension: ref_screen_field_calculation
    type: number
    sql: ${TABLE}.ref_screen_field_calculation

  - measure: count
    type: count
    drill_fields: [id]

