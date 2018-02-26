view: _auth_assignment {
  dimension: bizrule {
    type: string
    sql: ${TABLE}.bizrule ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}.itemname ;;
  }

  dimension: userid {
    type: string
    # hidden: true
    sql: ${TABLE}.userid ;;
  }

  measure: count {
    type: count
    drill_fields: [itemname, user.id, user.name]
  }
}
