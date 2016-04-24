- view: _auth_log
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

  - dimension: error_code
    type: number
    sql: ${TABLE}.error_code

  - dimension: error_message
    type: string
    sql: ${TABLE}.error_message

  - dimension: host
    type: string
    sql: ${TABLE}.host

  - dimension: ip
    type: string
    sql: ${TABLE}.ip

  - dimension: script_name
    type: string
    sql: ${TABLE}.script_name

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension: username
    type: string
    sql: ${TABLE}.username

  - measure: count
    type: count
    drill_fields: [id, script_name, username, user.id, user.name]

