- view: server_instance_database
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: ref_server_instance
    type: number
    sql: ${TABLE}.ref_server_instance

  - measure: count
    type: count
    drill_fields: [id, name]

