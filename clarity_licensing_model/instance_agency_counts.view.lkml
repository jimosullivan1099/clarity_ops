include: "explores.view"

view: instance_agency_counts {

  derived_table: {
    sql:  SELECT a.ops_instance_id, COUNT(a.agency_id) agencies_count
          FROM clarity_instance_aggregates.agencies a
          WHERE
            a.ops_instance_id IS NOT NULL AND
            {% condition agency_status %} a.agency_status {% endcondition %}
          GROUP BY a.ops_instance_id;;
  }

  filter: agency_status {
    type: number
    suggest_explore: agency_status
    suggest_dimension: agency_status.agency_status
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
