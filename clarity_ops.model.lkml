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

#Private explore
explore: license_limits {
  hidden: yes

  join: license_counts {
    type: inner
    sql_on: ${license_limits.system_url} = ${license_counts.system_url} AND
            ${license_limits.license_type_id} = ${license_counts.license_type_id} ;;
    relationship: many_to_one
  }
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

  join: advanced_privacy_and_security_compliance_license_limits {
    view_label: "Clarity License Limits"
    type: left_outer
    sql_on: ${license_counts.system_url} = ${advanced_privacy_and_security_compliance_license_limits.system_url} AND
            ${license_counts.license_type_id} = ${advanced_privacy_and_security_compliance_license_limits.license_type_id} AND
            ${advanced_privacy_and_security_compliance_license_limits.license_limit_name} = "Advanced Privacy & Security Compliance" ;;
    fields: [advanced_privacy_and_security_compliance_license_limits.advanced_privacy_and_security_compliance_limit_count,
             advanced_privacy_and_security_compliance_license_limits.advanced_privacy_and_security_compliance_limit_count_max]
    relationship: one_to_one
  }
}
