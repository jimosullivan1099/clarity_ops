view: instance_agency_counts {

  derived_table: {
    sql:  SELECT a.ops_instance_id, COUNT(a.agency_id) agencies_count
          FROM clarity_instance_aggregates.agencies a
          WHERE
            a.ops_instance_id IS NOT NULL AND
            {% condition agency_status %} a.agency_status {% endcondition %}
          GROUP BY a.ops_instance_id;;
    #explore_source: clarity_instances {
    #  column: instance_id {}
    #  column: agencies_count { field: aggregated_agencies.agencies_count }
    #  filters: {
    #    field: aggregated_agencies.is_active_agency

     # }
    #}
  }

  filter: agency_status {
    type: number
    suggestions: ["1","2"]
  }


  dimension: instance_id {
    hidden:  yes
    primary_key: yes
    sql: ${TABLE}.ops_instance_id ;;
  }

  measure: agencies_count {
    type: number
    sql: ${TABLE}.agencies_count ;;
  }
}
