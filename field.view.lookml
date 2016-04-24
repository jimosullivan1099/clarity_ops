- view: field
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: core_type
    type: yesno
    sql: ${TABLE}.core_type

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name

  - dimension: is_locked
    type: yesno
    sql: ${TABLE}.is_locked

  - dimension_group: last_update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_update

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: ref_field_type
    type: number
    sql: ${TABLE}.ref_field_type

  - dimension: ref_picklist_type
    type: number
    sql: ${TABLE}.ref_picklist_type

  - dimension: ref_table_type
    type: number
    sql: ${TABLE}.ref_table_type

  - dimension: ref_user
    type: number
    sql: ${TABLE}.ref_user

  - dimension: replicated
    type: number
    sql: ${TABLE}.replicated

  - dimension: tooltip
    type: string
    sql: ${TABLE}.tooltip

  - dimension: type
    type: yesno
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: [id, display_name, name]

