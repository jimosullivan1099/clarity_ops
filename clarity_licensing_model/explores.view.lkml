include: "*.view"

explore: looker_users {
  label: "Looker Users"
  from:  looker_users

  join: instance_looker_users {
    view_label: "Looker Users"
    type: left_outer
    sql_on: ${looker_users.id} = ${instance_looker_users.looker_user_id} ;;
    relationship: one_to_many
  }

  join: instances {
    view_label: "Looker Users"
    type: left_outer
    sql_on: ${instance_looker_users.instance_id} = ${instances.instance_id} ;;
    relationship: one_to_many
  }
}

explore: clarity_instances {
  label: "Clarity Instances"
  from:  instances

  join: master_servers {
    view_label: "Clarity Instances"
    type: inner
    sql_on: ${clarity_instances.master_db_server_id} = ${master_servers.master_server_id} ;;
    relationship: many_to_one
    fields: [master_servers.master_server_name,
      master_servers.master_server_count]
  }

  join: reporting_servers {
    view_label: "Clarity Instances"
    type: inner
    sql_on: ${clarity_instances.slave_report_db_server_id} = ${reporting_servers.reporting_server_id} ;;
    relationship: many_to_one
    fields: [reporting_servers.reporting_server_name,
      reporting_servers.reporting_server_count]
  }

  join: analysis_servers {
    view_label: "Clarity Instances"
    type: inner
    sql_on: ${clarity_instances.slave_analysis_db_server_id} = ${analysis_servers.analysis_server_id} ;;
    relationship: many_to_one
    fields: [analysis_servers.analysis_server_name,
      analysis_servers.analysis_server_count]
  }

  join: database_servers {
    view_label: "Clarity Instances"
    type: inner
    sql_on: ${clarity_instances.database_id} = ${database_servers.database_id} ;;
    relationship: one_to_one
    fields: [database_servers.database_name]
  }

  join: instance_license_counts {
    view_label: "Clarity Instance Licenses"
    type:  inner
    sql_on: ${clarity_instances.instance_id} = ${instance_license_counts.instance_id} ;;
    relationship: one_to_many
  }

  join: licenses {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${instance_license_counts.license_id} = ${licenses.id} ;;
    relationship: many_to_one
    sql_where: ${licenses.license_title} = ${aggregated_license_counts.license_type} ;;
  }

  join: transactions {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${instance_license_counts.id} = ${transactions.instance_license_count_id} ;;
    relationship: one_to_many
  }

  join: instance_license_limiters {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${clarity_instances.instance_id} = ${instance_license_limiters.instance_id} ;;
    relationship: one_to_many
  }

  join: license_limiters {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${instance_license_limiters.license_limiter_id} = ${license_limiters.id}
       AND  ${licenses.id} = ${license_limiters.license_types_id};;
    relationship: many_to_one
  }

  join: license_editions {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${clarity_instances.license_edition_id} = ${license_editions.license_edition_id} ;;
    relationship: many_to_one
  }

  join: license_edition_licenses {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${license_editions.license_edition_id} = ${license_edition_licenses.license_edition_id}
        AND ${licenses.id} = ${license_edition_licenses.license_id} ;;
    relationship: one_to_many
  }

  join: aggregated_instances {
    view_label: "Aggregated Clarity Instances"
    type: inner
    sql_on: ${clarity_instances.instance_id} = ${aggregated_instances.ops_instance_id} ;;
    relationship: many_to_one
  }

  join: aggregated_license_counts {
    view_label: "Aggregated Clarity Licenses"
    type: inner
      sql_on: ${aggregated_instances.system_url} = ${aggregated_license_counts.system_url} ;;
        # AND ${licenses.license_title} = ${aggregated_license_counts.license_type};;
    #sql_on: ${clarity_instances.instance_id} = ${aggregated_license_counts.ops_instance_id}
    #    AND ${licenses.license_title} = ${aggregated_license_counts.license_type};;
    relationship: one_to_many
    fields: [aggregated_license_counts.license_type,
             aggregated_license_counts.license_count,
             aggregated_license_counts.license_setup_fee,
             aggregated_license_counts.license_monthly_fee,
             aggregated_license_counts.license_setup_fee_max,
             aggregated_license_counts.license_monthly_fee_max,
             aggregated_license_counts.license_setup_fee_sum,
             aggregated_license_counts.license_monthly_fee_sum]
    required_joins: [licenses]
  }

  join: aggregated_users {
    view_label: "Aggregated Clarity Instances"
    type: inner
    sql_on: ${aggregated_instances.system_url} = ${aggregated_users.system_url}
       AND  ${aggregated_license_counts.license_type_id} = ${aggregated_users.license_type_id} ;;
    #sql_on: ${clarity_instances.instance_id} = ${aggregated_users.ops_instance_id}
    #   AND  ${licenses.license_title} = ${aggregated_users.license_type} ;;
    relationship: one_to_many
    fields: [aggregated_users.user_id,
             aggregated_users.user_name,
             aggregated_users.user_email,
             aggregated_users.user_status,
             aggregated_users.users_count]
  }

  join: license_limits {
    view_label: "Aggregated Clarity Licenses"
    type: inner
    sql_on: ${aggregated_license_counts.system_url} = ${license_limits.system_url}
       AND  ${aggregated_license_counts.license_type_id} = ${license_limits.license_type_id} ;;
    #sql_on: ${clarity_instances.instance_id} = ${aggregated_users.ops_instance_id}
    #   AND  ${licenses.license_title} = ${aggregated_users.license_type} ;;
    relationship: one_to_many
    fields: [license_limit_name, license_limit_count]
  }

  join: instance_looker_users {
    view_label: "Clarity Instance Looker users"
    type: inner
    sql_on: ${clarity_instances.instance_id} = ${instance_looker_users.instance_id} ;;
    relationship: one_to_many
  }

  join: looker_users {
    view_label: "Clarity Instance Looker users"
    type: inner
    sql_on: ${instance_looker_users.looker_user_id} = ${looker_users.id};;
    relationship: one_to_many
  }

}


explore: clarity_instances_v2{
  label: "Clarity Instances V2"
  from:  instances

  join: master_servers {
    view_label: "Clarity Instances V2"
    type: inner
    sql_on: ${clarity_instances_v2.master_db_server_id} = ${master_servers.master_server_id} ;;
    relationship: many_to_one
    fields: [master_servers.master_server_name,
      master_servers.master_server_count]
  }

  join: reporting_servers {
    view_label: "Clarity Instances V2"
    type: inner
    sql_on: ${clarity_instances_v2.slave_report_db_server_id} = ${reporting_servers.reporting_server_id} ;;
    relationship: many_to_one
    fields: [reporting_servers.reporting_server_name,
      reporting_servers.reporting_server_count]
  }

  join: analysis_servers {
    view_label: "Clarity Instances V2"
    type: inner
    sql_on: ${clarity_instances_v2.slave_analysis_db_server_id} = ${analysis_servers.analysis_server_id} ;;
    relationship: many_to_one
    fields: [analysis_servers.analysis_server_name,
      analysis_servers.analysis_server_count]
  }

  join: database_servers {
    view_label: "Clarity Instances V2"
    type: inner
    sql_on: ${clarity_instances_v2.database_id} = ${database_servers.database_id} ;;
    relationship: one_to_one
    fields: [database_servers.database_name]
  }

  join: instance_license_counts {
    view_label: "Clarity Instance Licenses"
    type:  inner
    sql_on: ${clarity_instances_v2.instance_id} = ${instance_license_counts.instance_id} ;;
    relationship: one_to_many
  }

  join: licenses {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${instance_license_counts.license_id} = ${licenses.id} ;;
    relationship: many_to_one
    #sql_where: ${licenses.license_title} = ${aggregated_license_counts.license_type} ;;
  }

  join: transactions {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${instance_license_counts.id} = ${transactions.instance_license_count_id} ;;
    relationship: one_to_many
  }

  join: instance_license_limiters {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${clarity_instances_v2.instance_id} = ${instance_license_limiters.instance_id} ;;
    relationship: one_to_many
  }

  join: license_limiters {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${instance_license_limiters.license_limiter_id} = ${license_limiters.id}
      AND  ${licenses.id} = ${license_limiters.license_types_id};;
    relationship: many_to_one
  }

  join: license_editions {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${clarity_instances_v2.license_edition_id} = ${license_editions.license_edition_id} ;;
    relationship: many_to_one
  }

  join: license_edition_licenses {
    view_label: "Clarity Instance Licenses"
    type: inner
    sql_on: ${license_editions.license_edition_id} = ${license_edition_licenses.license_edition_id}
      AND ${licenses.id} = ${license_edition_licenses.license_id} ;;
    relationship: one_to_many
  }

  join: aggregated_users {
    view_label: "Clarity Instances V2"
    type: left_outer
    sql_on: ${clarity_instances_v2.instance_id} = ${aggregated_users.ops_instance_id}
       AND  ${licenses.license_title} = ${aggregated_users.license_type} ;;
    relationship: one_to_many
    fields: [aggregated_users.user_id,
      aggregated_users.user_name,
      aggregated_users.user_email,
      aggregated_users.user_status,
      aggregated_users.users_count]
  }

  join: aggregated_license_counts {
    view_label: "Aggregated Clarity Licenses"
    type: left_outer
    sql_on: ${aggregated_users.system_url} = ${aggregated_license_counts.system_url}
        AND ${aggregated_users.license_type_id} = ${aggregated_license_counts.license_type_id} ;;
    relationship: many_to_one
    fields: [aggregated_license_counts.license_type,
      aggregated_license_counts.license_count,
      aggregated_license_counts.license_setup_fee,
      aggregated_license_counts.license_monthly_fee,
      aggregated_license_counts.license_setup_fee_max,
      aggregated_license_counts.license_monthly_fee_max,
      aggregated_license_counts.license_setup_fee_sum,
      aggregated_license_counts.license_monthly_fee_sum]
    required_joins: [licenses]
  }
}
