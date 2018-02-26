view: screen_field_constraint {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: condition {
    type: string
    sql: ${TABLE}.`condition` ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: ref_field {
    type: number
    sql: ${TABLE}.ref_field ;;
  }

  dimension: ref_field_condition {
    type: number
    sql: ${TABLE}.ref_field_condition ;;
  }

  dimension: ref_prev_field {
    type: number
    sql: ${TABLE}.ref_prev_field ;;
  }

  dimension: replicated {
    type: number
    sql: ${TABLE}.replicated ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
