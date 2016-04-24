- view: instance_report_server_queue
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

  - dimension_group: date_completed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_completed

  - dimension: file_name
    type: string
    sql: ${TABLE}.file_name

  - dimension: params
    type: string
    sql: ${TABLE}.params

  - dimension: process_id
    type: number
    # hidden: true
    sql: ${TABLE}.process_id

  - dimension: ref_instance
    type: number
    sql: ${TABLE}.ref_instance

  - dimension: ref_server_instance
    type: number
    sql: ${TABLE}.ref_server_instance

  - dimension: ref_status
    type: number
    sql: ${TABLE}.ref_status

  - dimension_group: scheduled
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.scheduled

  - dimension: slave_db_id
    type: number
    sql: ${TABLE}.slave_db_id

  - measure: count
    type: count
    drill_fields: [id, file_name, process.name, process.id]

