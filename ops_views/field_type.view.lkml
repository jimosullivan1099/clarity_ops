view: field_type {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: f_type {
    type: string
    sql: ${TABLE}.f_type ;;
  }

  dimension: maxlength {
    type: number
    sql: ${TABLE}.maxlength ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
