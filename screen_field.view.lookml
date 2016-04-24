- view: screen_field
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: check
    type: number
    sql: ${TABLE}.`check`

  - dimension: default_value
    type: string
    sql: ${TABLE}.default_value

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name

  - dimension_group: edit
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.edit_date

  - dimension: external_id
    type: string
    sql: ${TABLE}.external_id

  - dimension: inline_with
    type: number
    sql: ${TABLE}.inline_with

  - dimension: mandatory
    type: number
    sql: ${TABLE}.mandatory

  - dimension: maxlength
    type: number
    sql: ${TABLE}.maxlength

  - dimension: protected
    type: number
    sql: ${TABLE}.protected

  - dimension: readonly
    type: number
    sql: ${TABLE}.readonly

  - dimension: ref_field
    type: number
    sql: ${TABLE}.ref_field

  - dimension: ref_screen
    type: number
    sql: ${TABLE}.ref_screen

  - dimension: replicated
    type: number
    sql: ${TABLE}.replicated

  - dimension: rows
    type: number
    sql: ${TABLE}.rows

  - dimension: size
    type: number
    sql: ${TABLE}.size

  - dimension: sort
    type: number
    sql: ${TABLE}.sort

  - dimension: width
    type: number
    sql: ${TABLE}.width

  - measure: count
    type: count
    drill_fields: [id, display_name]

