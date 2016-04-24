- connection: clarity_ops

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: instance
  joins:
    - join: instance_license_count
      sql_on: ${instance.id} = ${instance_license_count.ref_instance}  
    - join: license
      sql_on: ${instance_license_count.ref_license} = ${license.id}        
    - join: transaction
      sql_on: ${transaction.ref_license_count} = ${instance_license_count.id}   
      


