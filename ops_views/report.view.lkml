view: report {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}.file_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ref_category {
    type: number
    sql: ${TABLE}.ref_category ;;
  }

  dimension: ref_hook {
    type: number
    sql: ${TABLE}.ref_hook ;;
  }

  dimension: ref_status {
    type: number
    sql: ${TABLE}.ref_status ;;
  }

  dimension: ref_type {
    type: number
    sql: ${TABLE}.ref_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, file_name, name]
  }
}
