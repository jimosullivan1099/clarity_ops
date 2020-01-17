view: license_edition_licenses {
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
    type: max
    sql: ${TABLE}.value ;;
  }

  measure: license_edition_count_sum {
    type: sum
    sql: ${TABLE}.value ;;
  }
}
