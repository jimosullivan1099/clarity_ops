view: license_types {

  sql_table_name: license_type ;;
  dimension: license_types_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_distribution {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: license_distribution_list {
    type: list
    list_field: license_distribution
  }
}
