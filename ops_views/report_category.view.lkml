view: report_category {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: sort {
    type: number
    sql: ${TABLE}.sort ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
