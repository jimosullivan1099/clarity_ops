- view: server
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: ip_address
    type: string
    sql: ${TABLE}.ip_address

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]

