view: license_limiters {
  sql_table_name: clarity_ops.license_limiters ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_limit_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: license_types_id {
    hidden: yes
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: license_limit_names {
    type: list
    list_field: license_limit_name
  }
}
