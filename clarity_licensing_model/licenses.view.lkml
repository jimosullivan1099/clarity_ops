view: licenses {

  view_label: "Clarity Licenses"

  sql_table_name: clarity_ops.license ;;

  dimension: id {
    primary_key: yes
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
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: license_list {
    type: list
    list_field: license_title
  }
}
