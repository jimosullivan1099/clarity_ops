view: deleted_entry {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: condition {
    type: string
    sql: ${TABLE}.`condition` ;;
  }

  dimension: constants {
    type: string
    sql: ${TABLE}.constants ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: field_name {
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: field_name_condition {
    type: string
    sql: ${TABLE}.field_name_condition ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: screen_name {
    type: string
    sql: ${TABLE}.screen_name ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id, field_name, screen_name]
  }
}
