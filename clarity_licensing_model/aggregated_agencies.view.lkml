view: aggregated_agencies {
  sql_table_name: clarity_instance_aggregates.agencies ;;

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: string
    sql:  CONCAT(${TABLE}.system_url, '-', ${TABLE}.agency_id) ;;
  }

  dimension: system_url {
    type: string
    sql: ${TABLE}.system_url ;;
  }

  dimension: agency_id {
    type: number
    sql: ${TABLE}.agency_id ;;
  }

  dimension: ops_instance_id {
    type: number
    sql: ${TABLE}.ops_instance_id ;;
  }

  dimension: agency_name {
    type: string
    sql: ${TABLE}.agency_name ;;
  }

  dimension: agency_status {
    case: {
      when: {
        sql: ${TABLE}.agency_status = 1 ;;
        label: "Active"
      }
      when: {
        sql: ${TABLE}.agency_status = 2 ;;
        label: "Inactive"
      }
      else: "Unknown"
    }
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
