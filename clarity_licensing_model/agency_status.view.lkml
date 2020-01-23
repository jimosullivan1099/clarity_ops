view: agency_status {
  derived_table: {
    sql:  SELECT 1 status
          UNION ALL
          SELECT 2 status
          ;;
  }

  dimension: agency_status {
    case: {
      when: {
        sql: ${TABLE}.status = 1 ;;
        label: "Active"
      }
      when: {
        sql: ${TABLE}.status = 2 ;;
        label: "Inactive"
      }
      else: "Unknown"
    }
  }
}
