view: license_limiter_options {

  view_label: "Clarity Licenses"

  sql_table_name: clarity_ops.license_limiter_options ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_limiter_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_limit ;;
  }

  dimension: license_limit_option_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: license_limit_option_list {
    type: list
    list_field: license_limit_option_name
  }
}
