- view: field_log_old
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: core_type
    type: number
    sql: ${TABLE}.core_type

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name

  - dimension: is_locked
    type: number
    sql: ${TABLE}.is_locked

  - dimension: last_update
    type: string
    sql: ${TABLE}.last_update

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: ref_field_log
    type: number
    sql: ${TABLE}.ref_field_log

  - dimension: ref_field_type
    type: number
    sql: ${TABLE}.ref_field_type

  - dimension: ref_table_type
    type: number
    sql: ${TABLE}.ref_table_type

  - dimension: tooltip
    type: string
    sql: ${TABLE}.tooltip

  - dimension: type
    type: number
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: [id, display_name, name]

