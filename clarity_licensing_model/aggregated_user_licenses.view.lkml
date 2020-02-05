view: aggregated_user_licenses {
  view_label: "Clarity Users"

  sql_table_name: clarity_instance_aggregates.user_licenses ;;

  dimension: system_url {
    hidden: yes
    type: string
    sql: ${TABLE}.system_url ;;
  }
  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: ops_instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: ops_license_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ops_license_id ;;
  }

}
