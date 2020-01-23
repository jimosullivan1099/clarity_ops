include: "explores.view"

view: instance_agency_counts {

  derived_table: {
    sql:  SELECT a.ops_instance_id, COUNT(a.agency_id) agencies_count
          FROM clarity_instance_aggregates.agencies a
          WHERE
            a.ops_instance_id IS NOT NULL AND
            a.agency_status = (CASE WHEN "{{agency_status._parameter_value}}" = 'Active' THEN 1
                                    WHEN "{{agency_status._parameter_value}}" = 'Inactive' THEN 2
                                    ELSE 0
                               END)
          GROUP BY a.ops_instance_id;;
  }

# {% condition agency_status %} a.agency_status {% endcondition %}

#   filter: agency_status {
#     type: string
#     suggestions: ["Active","Inactive"]
#   }

  parameter: agency_status {
    type: unquoted
    suggestions: ["Active","Inactive"]
  }

  dimension: instance_id {
    hidden:  yes
    primary_key: yes
    sql: ${TABLE}.ops_instance_id ;;
  }

  measure: agencies_count {
    type: sum
    sql: ${TABLE}.agencies_count ;;
  }
}
