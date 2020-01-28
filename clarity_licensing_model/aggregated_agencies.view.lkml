view: aggregated_agencies {

  view_label: "Clarity Agencies"

  sql_table_name: clarity_instance_aggregates.agencies ;;

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.agency_id) ;;
  }

  dimension: system_url {
    hidden: yes
    type: string
    sql: ${TABLE}.system_url ;;
  }

  dimension: agency_id {
    type: number
    sql: ${TABLE}.agency_id ;;
  }

  dimension: ops_instance_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: agency_name {
    type: string
    sql: ${TABLE}.agency_name ;;
  }

  dimension: agency_status {
    type: string
    sql: ${TABLE}.agency_status ;;
  }

  dimension_group: agency_added_date {
    type: time
    timeframes: [time, date, week, month]:
    sql: ${TABLE}.added_date ;;
  }

  measure: agencies_count {
    type: count
  }
}
