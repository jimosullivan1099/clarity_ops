view: license_editions {
  sql_table_name: clarity_ops.license_editions ;;

  dimension: license_edition_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_edition_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: license_edition_list {
    type: list
    sql: GROUP_CONCAT(${license_edition_name}) ;;
  }
}
