include: "./aggregated_users.view.lkml"

view: aggregated_instance_users {
  extends: [aggregated_users]

  view_label: "Clarity Instance Users"
}
