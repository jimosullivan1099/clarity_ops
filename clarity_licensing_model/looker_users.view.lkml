view: looker_users {

  view_label: "Clarity Looker Users"

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
      label: "Email"
      url: "https://actions.torregrosa.me/actions/basic_email/execute"
      form_url: "https://actions.torregrosa.me/actions/basic_email/form"
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
