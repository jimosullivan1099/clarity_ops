view: user_instance_license_counts {

  view_label: "Clarity Users"

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

  dimension: usdder_license_active {
    hidden: yes
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: user_license_no_limit {
    type: yesno
    sql: ${TABLE}.no_limit ;;
  }
  measure: user_license_setup_fee_sum {
    type: sum
    sql: ${TABLE}.base_amount ;;
    value_format_name: usd
  }

  measure: user_license_monthly_fee_sum {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }
}
