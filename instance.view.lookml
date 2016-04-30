- view: instance
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: description
    type: string
    sql: ${TABLE}.description


  - dimension: hostname
    type: string
    sql: ${TABLE}.hostname

  - dimension: instance_message
    hidden: true
    type: string
    sql: ${TABLE}.instance_message

  - dimension: internal_hostname
    hidden: true
    type: string
    sql: ${TABLE}.internal_hostname

  - dimension: jndi
    hidden: true
    type: string
    sql: ${TABLE}.jndi

  - dimension: looker_access
    type: yesno
    sql: ${TABLE}.looker_access

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: queue_server_password
    hidden: true
    type: string
    sql: ${TABLE}.queue_server_password

  - dimension: queue_server_username
    hidden: true
    type: string
    sql: ${TABLE}.queue_server_username

  - dimension: ref_build
    hidden: true
    type: number
    sql: ${TABLE}.ref_build

  - dimension: ref_database
    hidden: true
    type: number
    sql: ${TABLE}.ref_database

  - dimension: ref_db_server
    hidden: true
    type: number
    sql: ${TABLE}.ref_db_server

  - dimension: ref_db_slave_olap
    hidden: true
    type: number
    sql: ${TABLE}.ref_db_slave_olap

  - dimension: ref_db_slave_rep
    hidden: true
    type: number
    sql: ${TABLE}.ref_db_slave_rep

  - dimension: ref_server_group
    hidden: true
    type: number
    sql: ${TABLE}.ref_server_group

  - dimension: ref_time_zone
    hidden: true
    type: number
    sql: ${TABLE}.ref_time_zone

  - dimension: reporting_mode
    hidden: true
    type: number
    sql: ${TABLE}.reporting_mode

  - dimension: status
    hidden: true
    type: yesno
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [id, internal_hostname, hostname, queue_server_username, name]

