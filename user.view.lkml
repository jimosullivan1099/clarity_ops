view: user {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: create {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.create_date ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, member_profile.count, _auth_assignment.count, _auth_log.count]
  }

  measure: count_distinct {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    drill_fields: [id, name]
  }
}
