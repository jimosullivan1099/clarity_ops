view: instance_license_counts {

  sql_table_name: clarity_ops.instance_license_count ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_instance ;;
  }

  dimension: license_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ref_license ;;
  }

  dimension: license_count {
    type: number
    sql: ${TABLE}.count ;;
  }

  measure: license_count_max {
    type: max
    sql: ${TABLE}.count ;;
  }

  measure: license_count_sum {
    type: sum
    sql: ${TABLE}.count ;;
  }

  measure: license_setup_fee_max {
    type: max
    sql: ${TABLE}.base_amount ;;
  }

  measure: license_setup_fee_sum {
    type: sum
    sql: ${TABLE}.base_amount ;;
  }

  measure: license_monthly_fee_max {
    type: max
    sql: ${TABLE}.amount ;;
  }

  measure: license_monthly_sum {
    type: sum
    sql: ${TABLE}.amount ;;
  }
}
