- view: screen_log
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: external_id
    type: string
    sql: ${TABLE}.external_id

  - dimension_group: last_update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_update

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: ref_screen
    type: number
    sql: ${TABLE}.ref_screen

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - dimension: type
    type: number
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: [id, name]

