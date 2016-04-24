- view: instance
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: enable_instance_message
    type: number
    sql: ${TABLE}.enable_instance_message

  - dimension: hostname
    type: string
    sql: ${TABLE}.hostname

  - dimension: instance_message
    type: string
    sql: ${TABLE}.instance_message

  - dimension: internal_hostname
    type: string
    sql: ${TABLE}.internal_hostname

  - dimension: jndi
    type: string
    sql: ${TABLE}.jndi

  - dimension: looker_access
    type: yesno
    sql: ${TABLE}.looker_access

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: queue_server_password
    type: string
    sql: ${TABLE}.queue_server_password

  - dimension: queue_server_username
    type: string
    sql: ${TABLE}.queue_server_username

  - dimension: ref_build
    type: number
    sql: ${TABLE}.ref_build

  - dimension: ref_database
    type: number
    sql: ${TABLE}.ref_database

  - dimension: ref_db_server
    type: number
    sql: ${TABLE}.ref_db_server

  - dimension: ref_db_slave_olap
    type: number
    sql: ${TABLE}.ref_db_slave_olap

  - dimension: ref_db_slave_rep
    type: number
    sql: ${TABLE}.ref_db_slave_rep

  - dimension: ref_server_group
    type: number
    sql: ${TABLE}.ref_server_group

  - dimension: ref_time_zone
    type: number
    sql: ${TABLE}.ref_time_zone

  - dimension: reporting_mode
    type: number
    sql: ${TABLE}.reporting_mode

  - dimension: status
    type: yesno
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [id, internal_hostname, hostname, queue_server_username, name]

