view: picklist {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: field_name {
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: ref_field {
    type: number
    sql: ${TABLE}.ref_field ;;
  }

  dimension: replicated {
    type: number
    sql: ${TABLE}.replicated ;;
  }

  dimension: sort {
    type: number
    sql: ${TABLE}.sort ;;
  }

  dimension: value_name {
    type: string
    sql: ${TABLE}.value_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, value_name, field_name]
  }
}
