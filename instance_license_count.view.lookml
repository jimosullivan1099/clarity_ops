- view: instance_license_count
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: base_amount
    type: number
    sql: ${TABLE}.base_amount

  - dimension: license_count
    type: number
    sql: ${TABLE}.count

  - dimension: ref_instance
    type: number
    sql: ${TABLE}.ref_instance

  - dimension: ref_license
    type: number
    sql: ${TABLE}.ref_license

  - measure: count
    type: count
    drill_fields: [id]
    
  - measure: license_totals
    type: sum
    sql: ${license_count}

