- view: server_role_module
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: ref_module
    type: number
    sql: ${TABLE}.ref_module

  - dimension: ref_server_role
    type: number
    sql: ${TABLE}.ref_server_role

  - measure: count
    type: count
    drill_fields: [id]

