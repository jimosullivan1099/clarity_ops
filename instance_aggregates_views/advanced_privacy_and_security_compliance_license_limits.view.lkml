include: "../clarity_ops.model"

view: advanced_privacy_and_security_compliance_license_limits {
    derived_table: {
      explore_source: license_limits {
        column: system_url {}
        column: license_type_id {}
        column: license_limit_count {}
        column: license_limit_name {}
        filters: {
          field: license_limits.license_limit_name
          value: "Advanced Privacy & Security Compliance"
        }
      }
      sql_trigger_value: SELECT 1 ;;
      indexes: ["instance_url","license_type_id"]
    }

    dimension: prim_key {
      primary_key: yes
      hidden: yes
      type: string
      sql:  CONCAT(${TABLE}.instance_url, '-', ${TABLE}.license_type_id) ;;
    }

    dimension: instance_url {}

    dimension: license_type_id {}

    dimension: advanced_privacy_and_security_compliance_limit_count {
      type: number
      sql:  ${TABLE}.license_limit_count ;;
    }

    measure: advanced_privacy_and_security_compliance_limit_count_max {
      type: max
      sql:  ${TABLE}.license_limit_count ;;
    }
  }
