view: license_edition_licenses {

  view_label: "Clarity Licenses"

  sql_table_name: clarity_ops.license_edition_licenses ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: license_edition_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_edition ;;
  }

  dimension: license_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_license ;;
  }

  measure: license_edition_count_max {
    hidden: yes
    type: max
    sql: ${TABLE}.value ;;
  }

  measure: license_edition_count_sum {
    hidden: yes
    type: sum
    sql: ${TABLE}.value ;;
  }
}
