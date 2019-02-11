connection: "clarity_ops"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: instance {
  label: "Clarity Licensing"

  join: instance_license_count {
    type: inner
    sql_on: ${instance.id} = ${instance_license_count.ref_instance} ;;
  }

  join: license {
    type: inner
    sql_on: ${instance_license_count.ref_license} = ${license.id} ;;
  }

  join: transaction {
    type: inner
    sql_on: ${transaction.ref_license_count} = ${instance_license_count.id} ;;
  }

  join: server_instance {
    type: inner
    sql_on: ${instance.ref_db_server} = ${server_instance.id} ;;
  }

  join: server_instance_database {
    type: inner
    sql_on: ${instance.ref_database} = ${server_instance_database.id} ;;
  }
}
