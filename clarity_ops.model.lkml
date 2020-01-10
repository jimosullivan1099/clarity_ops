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
    sql_on: ${instance.id} = ${instance_license_count.ref_instance} ;;
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
    sql_on: ${clarity_licensing_v2.ops_instance_id} = ${instance.id} ;;
    relationship: one_to_one
  }

  join: master_server {
    from: server_instance
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${instance.ref_db_server} = ${master_server.id} ;;
    relationship: one_to_many
    fields: [master_server.name]
  }

  join: slave_report_server {
    from: server_instance
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${instance.ref_db_slave_rep} = ${slave_report_server.id} ;;
    relationship: one_to_many
    fields: [slave_report_server.name]
  }

  join: slave_analysis_server {
    from: server_instance
    view_label: "Clarity Licensing V2"
    type: left_outer
    sql_on: ${instance.ref_db_slave_olap} = ${slave_analysis_server.id} ;;
    relationship: one_to_many
    fields: [slave_analysis_server.name]
  }
}
