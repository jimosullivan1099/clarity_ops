- view: time_zone
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: offset
    type: number
    sql: ${TABLE}.offset

  - dimension: offset_minutes
    type: number
    sql: ${TABLE}.offset_minutes

  - dimension: sql_timezone
    type: string
    sql: ${TABLE}.sql_timezone

  - dimension: timezone
    type: string
    sql: ${TABLE}.timezone

  - measure: count
    type: count
    drill_fields: [id]

