view: instance_license_counts {

  view_label: "Clarity Licenses"

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
    #hidden: yes
    type: number
    sql: ${TABLE}.ref_license ;;
  }

  dimension: license_count {
    type: number
    sql: ${TABLE}.count ;;
  }

  measure: license_count_max {
    hidden: yes
    type: max
    sql: ${TABLE}.count ;;
  }

  measure: license_count_sum {
    type: sum
    sql: ${TABLE}.count ;;
  }

 dimension: license_setup_fee {
    type: number
    sql: ${TABLE}.base_amount ;;
    value_format_name: usd
  }

  measure: license_setup_fee_max {
    hidden: yes
    type: max
    sql: ${TABLE}.base_amount ;;
    value_format_name: usd
  }

  measure: license_setup_fee_sum {
    type: sum
    sql: ${TABLE}.base_amount ;;
    value_format_name: usd
  }

 dimension: license_monthly_fee {
    type: number
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: license_monthly_fee_max {
    hidden: yes
    type: max
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: license_monthly_fee_sum {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  dimension: license_active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: license_no_limit {
    type: yesno
    sql: ${TABLE}.no_limit ;;
  }
}
