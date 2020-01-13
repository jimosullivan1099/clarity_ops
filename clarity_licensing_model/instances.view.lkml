view: instances {

  sql_table_name: clarity_ops.instance ;;

  dimension: instance_id {
    primary_key: yes
    type: string
    sql:  ${TABLE}.id ;;
  }

  dimension: instance_name {
    type: string
    sql:  ${TABLE}.name ;;
  }

  dimension: instance_description {
    type: string
    sql:  ${TABLE}.description ;;
  }

  dimension: instance_hostname {
    type: string
    sql:  ${TABLE}.hostname ;;
  }

  dimension: instance_type {
    case: {
      when: {
        sql: ${TABLE}.instance_type_id = 1 ;;
        label: "Production"
      }
      when: {
        sql: ${TABLE}.instance_type_id = 2 ;;
        label: "Training"
      }
      when: {
        sql: ${TABLE}.instance_type_id = 3 ;;
        label: "Migration"
      }
      when: {
        sql: ${TABLE}.instance_type_id = 4 ;;
        label: "Internal"
      }
      else: "Unknown"
    }
  }

  dimension: instance_looker_access {
    type: yesno
    sql:  ${TABLE}.instance_looker_access ;;
  }

  dimension: license_edition_id {
    hidden: yes
    type: number
    sql:  ${TABLE}.ref_license_edition ;;
  }

  dimension: database_id {
    hidden: yes
    type: number
    sql:  ${TABLE}.ref_database ;;
  }

  dimension: master_db_server_id {
    hidden: yes
    type: number
    sql:  ${TABLE}.ref_db_server ;;
  }

  dimension: slave_report_db_server_id {
    hidden: yes
    type: number
    sql:  ${TABLE}.ref_db_slave_rep ;;
  }

  dimension: slave_analysis_db_server_id {
    hidden: yes
    type: number
    sql:  ${TABLE}.ref_db_slave_olap ;;
  }

  measure: ops_instance_count {
    type: count
  }
}