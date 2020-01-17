view: looker_users {
  sql_table_name:  clarity_instance_aggregates.looker_users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: created_date {
    type: time
    timeframes: [time, date, week, month]:
    sql: ${TABLE}.created_date ;;
  }

  dimension: is_disabled {
    type: yesno
    sql: ${TABLE}.is_disabled ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    action: {
      label: "Test my action"
      url: "https://actions.torregrosa.me/actions/my_action/execute"
      form_url: "https://actions.torregrosa.me/actions/my_action/form"
      param: {
        name: "param_name"
        value: "param_value"
      }
    }

  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: groups {
    type: string
    sql: ${TABLE}.groups ;;
  }

  measure: count {
    label: "Looker Users"
    type: count
  }
}
