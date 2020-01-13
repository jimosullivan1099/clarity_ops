connection: "clarity_ops"

# include all the views
include: "ops_views/*.view"
include: "instance_aggregates_views/*.view"

# include all the dashboards
#include: "*.dashboard"

explore: instance {
  label: "Clarity Licensing"

  join: instance_license_count {
    type: inner
    sql_on: ${instance.instance_id} = ${instance_license_count.ref_instance} ;;
    relationship: one_to_many
  }

  join: license {
    type: inner
    sql_on: ${instance_license_count.ref_license} = ${license.id} ;;
    relationship: many_to_one
  }

  join: transaction {
    type: inner
    sql_on: ${transaction.ref_license_count} = ${instance_license_count.id} ;;
    relationship: many_to_one
  }

  join: server_instance {
    type: inner
    sql_on: ${instance.ref_db_server} = ${server_instance.id} ;;
    relationship: many_to_one
  }

  join: server_instance_database {
    type: inner
    sql_on: ${instance.ref_database} = ${server_instance_database.id} ;;
    relationship: many_to_one
  }
}

datagroup: licencsing_cache {
  sql_trigger: SELECT 1 ;;
}

explore: clarity_licensing_v2 {
  label: "Clarity Licensing (v2)"
  from:  instances

  join: instance {
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${clarity_licensing_v2.ops_instance_id} = ${instance.instance_id} ;;
    relationship: one_to_one
  }

  join: master_database_servers {
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${instance.ref_db_server} = ${master_database_servers.master_server_id} ;;
    relationship: many_to_one
    fields: [master_database_servers.master_server_name,
             master_database_servers.master_server_count]
  }

  join: reporting_database_servers {
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${instance.ref_db_slave_rep} = ${reporting_database_servers.reporting_server_id} ;;
    relationship: many_to_one
    fields: [reporting_database_servers.reporting_server_name,
             reporting_database_servers.reporting_server_count]
  }

  join: analysis_database_servers {
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${instance.ref_db_slave_olap} = ${analysis_database_servers.analysis_server_id} ;;
    relationship: many_to_one
    fields: [analysis_database_servers.analysis_server_name,
             analysis_database_servers.analysis_server_count]
  }

  join: license_counts {
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${clarity_licensing_v2.system_url} = ${license_counts.system_url} ;;
    fields: [license_counts.license_type, license_counts.license_count_max,
             license_counts.license_setup_fee_max, license_counts.license_monthly_fee_max,
             license_counts.license_setup_fee_sum, license_counts.license_monthly_fee_sum]
    relationship: one_to_many
  }

  join: users {
    type: inner
    sql_on: ${clarity_licensing_v2.system_url} = ${users.system_url} AND
      ${license_counts.license_type_id} = ${users.license_type_id} ;;
    fields: [users.user_name, users.user_email, users.user_status, users.users_count]
    relationship: one_to_many
  }

  join: advanced_privacy_and_security_compliance_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${advanced_privacy_and_security_compliance_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${advanced_privacy_and_security_compliance_license_limits.license_type_id} AND
            ${advanced_privacy_and_security_compliance_license_limits.license_limit_name} = "Advanced Privacy & Security Compliance" ;;
    fields: [advanced_privacy_and_security_compliance_license_limits.advanced_privacy_and_security_compliance_limit,
             advanced_privacy_and_security_compliance_license_limits.advanced_privacy_and_security_compliance_limit_name,
             advanced_privacy_and_security_compliance_license_limits.advanced_privacy_and_security_compliance_limit_max,
             advanced_privacy_and_security_compliance_license_limits.advanced_privacy_and_security_compliance_limit_sum]
    relationship: one_to_one
  }

  join: assessment_processor_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${assessment_processor_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${assessment_processor_license_limits.license_type_id} AND
            ${assessment_processor_license_limits.license_limit_name} = "Assessment Processor" ;;
    fields: [assessment_processor_license_limits.assessment_processor_license_limit,
             assessment_processor_license_limits.assessment_processor_license_limit_name,
             assessment_processor_license_limits.assessment_processor_license_limit_max,
             assessment_processor_license_limits.assessment_processor_license_limit_sum]
    relationship: one_to_one
  }

  join: coc_limit_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${coc_limit_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${coc_limit_license_limits.license_type_id} AND
            ${coc_limit_license_limits.license_limit_name} = "CoC Limit" ;;
    fields: [coc_limit_license_limits.coc_limit_license_limit,
             coc_limit_license_limits.coc_limit_license_limit_name,
             coc_limit_license_limits.coc_limit_license_limit_max,
             coc_limit_license_limits.coc_limit_license_limit_sum]
    relationship: one_to_one
  }

  join: coordinated_entry_and_community_queue_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${coordinated_entry_and_community_queue_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${coordinated_entry_and_community_queue_license_limits.license_type_id} AND
            ${coordinated_entry_and_community_queue_license_limits.license_limit_name} = "Coordinated Entry & Community Queue" ;;
    fields: [coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit,
             coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit_name,
             coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit_max,
             coordinated_entry_and_community_queue_license_limits.coordinated_entry_and_community_queue_license_limit_sum]
    relationship: one_to_one
  }

  join: create_additional_users_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${create_additional_users_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${create_additional_users_license_limits.license_type_id} AND
            ${create_additional_users_license_limits.license_limit_name} = "Create Additional Users" ;;
    fields: [create_additional_users_license_limits.create_additional_users_license_limit,
             create_additional_users_license_limits.create_additional_users_license_limit_name,
             create_additional_users_license_limits.create_additional_users_license_limit_max,
             create_additional_users_license_limits.create_additional_users_license_limit_sum]
    relationship: one_to_one
  }

  join: custom_data_field_limit_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${custom_data_field_limit_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${custom_data_field_limit_license_limits.license_type_id} AND
            ${custom_data_field_limit_license_limits.license_limit_name} = "Custom Data Field Limit" ;;
    fields: [custom_data_field_limit_license_limits.custom_data_field_limit_license_limit,
             custom_data_field_limit_license_limits.custom_data_field_limit_license_limit_name,
             custom_data_field_limit_license_limits.custom_data_field_limit_license_limit_max,
             custom_data_field_limit_license_limits.custom_data_field_limit_license_limit_sum]
    relationship: one_to_one
  }

  join: data_analytics_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${data_analytics_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${data_analytics_license_limits.license_type_id} AND
            ${data_analytics_license_limits.license_limit_name} = "Data Analytics" ;;
    fields: [data_analytics_license_limits.data_analytics_license_limit,
             data_analytics_license_limits.data_analytics_license_limit_name,
             data_analytics_license_limits.data_analytics_license_limit_max,
             data_analytics_license_limits.data_analytics_license_limit_sum]
    relationship: one_to_one
  }

  join: data_import_tool_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${data_import_tool_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${data_import_tool_license_limits.license_type_id} AND
            ${data_import_tool_license_limits.license_limit_name} = "Data Import Tool" ;;
    fields: [data_import_tool_license_limits.data_import_tool_license_limit,
             data_import_tool_license_limits.data_import_tool_license_limit_name,
             data_import_tool_license_limits.data_import_tool_license_limit_max,
             data_import_tool_license_limits.data_import_tool_license_limit_sum]
    relationship: one_to_one
  }

  join: direct_database_abstraction_layer_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${direct_database_abstraction_layer_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${direct_database_abstraction_layer_license_limits.license_type_id} AND
            ${direct_database_abstraction_layer_license_limits.license_limit_name} = "Direct Database Abstraction Layer" ;;
    fields: [direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit,
             direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit_name,
             direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit_max,
             direct_database_abstraction_layer_license_limits.direct_database_abstraction_layer_license_limit_sum]
    relationship: one_to_one
  }

  join: eligibility_engine_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${eligibility_engine_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${eligibility_engine_license_limits.license_type_id} AND
            ${eligibility_engine_license_limits.license_limit_name} = "Eligibility Engine" ;;
    fields: [eligibility_engine_license_limits.eligibility_engine_license_limit,
      eligibility_engine_license_limits.eligibility_engine_license_limit_name,
      eligibility_engine_license_limits.eligibility_engine_license_limit_max,
      eligibility_engine_license_limits.eligibility_engine_license_limit_sum]
    relationship: one_to_one
  }

  join: outreach_and_encampments_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${outreach_and_encampments_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${outreach_and_encampments_license_limits.license_type_id} AND
            ${outreach_and_encampments_license_limits.license_limit_name} = "Outreach & Encampments" ;;
    fields: [outreach_and_encampments_license_limits.outreach_and_encampments_license_limit,
             outreach_and_encampments_license_limits.outreach_and_encampments_license_limit_name,
             outreach_and_encampments_license_limits.outreach_and_encampments_license_limit_max,
             outreach_and_encampments_license_limits.outreach_and_encampments_license_limit_sum]
    relationship: one_to_one
  }

  join: program_project_limit_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${program_project_limit_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${program_project_limit_license_limits.license_type_id} AND
            ${program_project_limit_license_limits.license_limit_name} = "Program/Project Limit" ;;
    fields: [program_project_limit_license_limits.program_project_limit_license_limit,
             program_project_limit_license_limits.program_project_limit_license_limit_name,
             program_project_limit_license_limits.program_project_limit_license_limit_max,
             program_project_limit_license_limits.program_project_limit_license_limit_sum]
    relationship: one_to_one
  }

  join: referral_management_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${referral_management_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${referral_management_license_limits.license_type_id} AND
            ${referral_management_license_limits.license_limit_name} = "Referral Management" ;;
    fields: [referral_management_license_limits.referral_management_license_limit,
             referral_management_license_limits.referral_management_license_limit_name,
             referral_management_license_limits.referral_management_license_limit_max,
             referral_management_license_limits.referral_management_license_limit_sum]
    relationship: one_to_one
  }

  join: self_service_license_purchase_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${self_service_license_purchase_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${self_service_license_purchase_license_limits.license_type_id} AND
            ${self_service_license_purchase_license_limits.license_limit_name} = "Self-Service License Purchase" ;;
    fields: [self_service_license_purchase_license_limits.self_service_license_purchase_license_limit,
             self_service_license_purchase_license_limits.self_service_license_purchase_license_limit_name,
             self_service_license_purchase_license_limits.self_service_license_purchase_license_limit_max,
             self_service_license_purchase_license_limits.self_service_license_purchase_license_limit_sum]
    relationship: one_to_one
  }

  join: sharing_groups_and_department_management_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${sharing_groups_and_department_management_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${sharing_groups_and_department_management_license_limits.license_type_id} AND
            ${sharing_groups_and_department_management_license_limits.license_limit_name} = "Sharing Groups & Department Management" ;;
    fields: [sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit,
             sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit_name,
             sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit_max,
             sharing_groups_and_department_management_license_limits.sharing_groups_and_department_management_license_limit_sum]
    relationship: one_to_one
  }

}
