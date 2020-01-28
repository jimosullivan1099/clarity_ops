view: instance_license_limiters {

  view_label: "Clarity Licenses"

  sql_table_name: clarity_ops.instance_license_limiters ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_instance ;;
  }

  dimension: license_limiter_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_limit ;;
  }

  dimension: license_limit_value {
    type: number
    sql: ${TABLE}.value ;;
  }
}
