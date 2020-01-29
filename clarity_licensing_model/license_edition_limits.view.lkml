view: license_edition_limits {

  view_label: "Clarity Licenses"

  sql_table_name: clarity_ops.license_edition_limits ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_edition_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_edition ;;
  }

  dimension: license_limiter_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_limit ;;
  }

  dimension: license_edition_limit_value {
    type: number
    sql: ${TABLE}.value ;;
  }
}
