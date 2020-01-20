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
#    sql_where: ${instance_licenses.license_title} = ${aggregated_license_counts.license_type} ;;
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
    type: left_outer
    sql_on: ${clarity_instances.instance_id} = ${aggregated_instances.ops_instance_id} ;;
    relationship: one_to_one
  }

  join: aggregated_license_counts {
    view_label: "Aggregated Clarity Licenses"
    type: left_outer
    sql_on: ${aggregated_instances.system_url} = ${aggregated_license_counts.system_url}
        AND ${instance_license_counts.id} = ${aggregated_license_counts.license_type_id};;
    relationship: one_to_many
    fields: [aggregated_license_counts.license_type,
             aggregated_license_counts.license_count,
             aggregated_license_counts.license_setup_fee,
             aggregated_license_counts.license_monthly_fee,
             aggregated_license_counts.license_setup_fee_max,
             aggregated_license_counts.license_monthly_fee_max,
             aggregated_license_counts.license_setup_fee_sum,
             aggregated_license_counts.license_monthly_fee_sum]
    required_joins: [instance_license_counts]
  }

  join: aggregated_users {
    view_label: "Aggregated Clarity Instances"
    type: left_outer
    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_users.system_url}
       AND  ${aggregated_license_counts.license_type_id} = ${aggregated_users.license_type_id} ;;
    relationship: one_to_many
    fields: [aggregated_users.user_id,
             aggregated_users.user_name,
             aggregated_users.user_email,
             aggregated_users.user_status,
             aggregated_users.users_count]
  }

  join: license_limits {
    view_label: "Aggregated Clarity Licenses"
    type: left_outer
    sql_on: ${aggregated_license_counts.system_url} = ${license_limits.system_url}
       AND  ${aggregated_license_counts.license_type_id} = ${license_limits.license_type_id} ;;
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

#  join: aggregated_advanced_privacy_and_security_compliance_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_advanced_privacy_and_security_compliance_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_advanced_privacy_and_security_compliance_license_limits.license_type_id} AND
#            ${aggregated_advanced_privacy_and_security_compliance_license_limits.license_limit_name} = "Advanced Privacy & Security Compliance" ;;
#    fields: [aggregated_advanced_privacy_and_security_compliance_license_limits.license_limit_name_measure,
#      aggregated_advanced_privacy_and_security_compliance_license_limits.license_limit_count_measure]
#    relationship: one_to_one
#  }

#  join: aggregated_assessment_processor_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_assessment_processor_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_assessment_processor_license_limits.license_type_id} AND
#            ${aggregated_assessment_processor_license_limits.license_limit_name} = "Assessment Processor" ;;
#    fields: [aggregated_assessment_processor_license_limits.assessment_processor_license_limit,
#      aggregated_assessment_processor_license_limits.assessment_processor_license_limit_name,
#      aggregated_assessment_processor_license_limits.assessment_processor_license_limit_max,
#      aggregated_assessment_processor_license_limits.assessment_processor_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_coc_limit_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_coc_limit_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_coc_limit_license_limits.license_type_id} AND
#            ${aggregated_coc_limit_license_limits.license_limit_name} = "CoC Limit" ;;
#    fields: [aggregated_coc_limit_license_limits.coc_limit_license_limit,
#      aggregated_coc_limit_license_limits.coc_limit_license_limit_name,
#      aggregated_coc_limit_license_limits.coc_limit_license_limit_max,
#      aggregated_coc_limit_license_limits.coc_limit_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_coordinated_entry_and_community_queue_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_coordinated_entry_and_community_queue_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_coordinated_entry_and_community_queue_license_limits.license_type_id} AND
#            ${aggregated_coordinated_entry_and_community_queue_license_limits.license_limit_name} = "Coordinated Entry & Community Queue" ;;
#    fields: [aggregated_coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit,
#      aggregated_coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit_name,
#      aggregated_coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit_max,
#      aggregated_coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_create_additional_users_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_create_additional_users_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_create_additional_users_license_limits.license_type_id} AND
#            ${aggregated_create_additional_users_license_limits.license_limit_name} = "Create Additional Users" ;;
#    fields: [aggregated_create_additional_users_license_limits.create_additional_users_license_limit,
#      aggregated_create_additional_users_license_limits.create_additional_users_license_limit_name,
#      aggregated_create_additional_users_license_limits.create_additional_users_license_limit_max,
#      aggregated_create_additional_users_license_limits.create_additional_users_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_custom_data_field_limit_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_custom_data_field_limit_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_custom_data_field_limit_license_limits.license_type_id} AND
#            ${aggregated_custom_data_field_limit_license_limits.license_limit_name} = "Custom Data Field Limit" ;;
#    fields: [aggregated_custom_data_field_limit_license_limits.custom_data_field_limit_license_limit,
#      aggregated_custom_data_field_limit_license_limits.custom_data_field_limit_license_limit_name,
#      aggregated_custom_data_field_limit_license_limits.custom_data_field_limit_license_limit_max,
#      aggregated_custom_data_field_limit_license_limits.custom_data_field_limit_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_data_analytics_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_data_analytics_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_data_analytics_license_limits.license_type_id} AND
#            ${aggregated_data_analytics_license_limits.license_limit_name} = "Data Analytics" ;;
#    fields: [aggregated_data_analytics_license_limits.data_analytics_license_limit,
#      aggregated_data_analytics_license_limits.data_analytics_license_limit_name,
#      aggregated_data_analytics_license_limits.data_analytics_license_limit_max,
#      aggregated_data_analytics_license_limits.data_analytics_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_data_import_tool_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_data_import_tool_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_data_import_tool_license_limits.license_type_id} AND
#            ${aggregated_data_import_tool_license_limits.license_limit_name} = "Data Import Tool" ;;
#    fields: [aggregated_data_import_tool_license_limits.data_import_tool_license_limit,
#      aggregated_data_import_tool_license_limits.data_import_tool_license_limit_name,
#      aggregated_data_import_tool_license_limits.data_import_tool_license_limit_max,
#      aggregated_data_import_tool_license_limits.data_import_tool_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_direct_database_abstraction_layer_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = $aggregated_{direct_database_abstraction_layer_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_direct_database_abstraction_layer_license_limits.license_type_id} AND
#            ${aggregated_direct_database_abstraction_layer_license_limits.license_limit_name} = "Direct Database Abstraction Layer" ;;
#    fields: [aggregated_direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit,
#      aggregated_direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit_name,
#      aggregated_direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit_max,
#      aggregated_direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_eligibility_engine_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_eligibility_engine_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_eligibility_engine_license_limits.license_type_id} AND
#            ${aggregated_eligibility_engine_license_limits.license_limit_name} = "Eligibility Engine" ;;
#    fields: [aggregated_eligibility_engine_license_limits.eligibility_engine_license_limit,
#      aggregated_eligibility_engine_license_limits.eligibility_engine_license_limit_name,
#      aggregated_eligibility_engine_license_limits.eligibility_engine_license_limit_max,
#      aggregated_eligibility_engine_license_limits.eligibility_engine_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_outreach_and_encampments_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_outreach_and_encampments_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_outreach_and_encampments_license_limits.license_type_id} AND
#            ${aggregated_outreach_and_encampments_license_limits.license_limit_name} = "Outreach & Encampments" ;;
#    fields: [aggregated_outreach_and_encampments_license_limits.outreach_and_encampments_license_limit,
#      aggregated_outreach_and_encampments_license_limits.outreach_and_encampments_license_limit_name,
#      aggregated_outreach_and_encampments_license_limits.outreach_and_encampments_license_limit_max,
#      aggregated_outreach_and_encampments_license_limits.outreach_and_encampments_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_program_project_limit_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_program_project_limit_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = $aggregated_{program_project_limit_license_limits.license_type_id} AND
#            ${aggregated_program_project_limit_license_limits.license_limit_name} = "Program/Project Limit" ;;
#    fields: [aggregated_program_project_limit_license_limits.program_project_limit_license_limit,
#      aggregated_program_project_limit_license_limits.program_project_limit_license_limit_name,
#      aggregated_program_project_limit_license_limits.program_project_limit_license_limit_max,
#      aggregated_program_project_limit_license_limits.program_project_limit_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_referral_management_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_referral_management_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_referral_management_license_limits.license_type_id} AND
#            ${aggregated_referral_management_license_limits.license_limit_name} = "Referral Management" ;;
#    fields: [aggregated_referral_management_license_limits.referral_management_license_limit,
#      aggregated_referral_management_license_limits.referral_management_license_limit_name,
#      aggregated_referral_management_license_limits.referral_management_license_limit_max,
#      aggregated_referral_management_license_limits.referral_management_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_self_service_license_purchase_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_self_service_license_purchase_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_self_service_license_purchase_license_limits.license_type_id} AND
#            ${aggregated_self_service_license_purchase_license_limits.license_limit_name} = "Self-Service License Purchase" ;;
#    fields: [aggregated_self_service_license_purchase_license_limits.self_service_license_purchase_license_limit,
#      aggregated_self_service_license_purchase_license_limits.self_service_license_purchase_license_limit_name,
#      aggregated_self_service_license_purchase_license_limits.self_service_license_purchase_license_limit_max,
#      aggregated_self_service_license_purchase_license_limits.self_service_license_purchase_license_limit_sum]
#    relationship: one_to_one
#  }

#  join: aggregated_sharing_groups_and_department_management_license_limits {
#    view_label: "Aggregated Clarity Instance License Limits"
#    type: inner
#    sql_on: ${aggregated_license_counts.system_url} = ${aggregated_sharing_groups_and_department_management_license_limits.system_url} AND
#            ${aggregated_license_counts.license_type_id} = ${aggregated_sharing_groups_and_department_management_license_limits.license_type_id} AND
#            ${aggregated_sharing_groups_and_department_management_license_limits.license_limit_name} = "Sharing Groups & Department Management" ;;
#    fields: [aggregated_sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit,
#      aggregated_sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit_name,
#      aggregated_sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit_max,
#      aggregated_sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit_sum]
#    relationship: one_to_one
#  }

}
