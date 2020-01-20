view: licenses {
  sql_table_name: clarity_ops.license ;;

  dimension: id {
    hidden: yes
    #primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_description {
    type: string
    sql: ${TABLE}.decription ;;
  }

  dimension: license_title {
    primary_key:  yes
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: license_list {
    type: list
    list_field: license_title
  }
}
