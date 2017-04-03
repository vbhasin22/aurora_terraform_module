# aurora_terraform_module
A Terraform module for making an aurora cluster in AWS

Input Variables
---------------

Aurora Cluster Inputs
- `cluster_id` - identifier for the cluster
- `db_name` - name for the database
- `rds_master_username` - username for the master DB user
- `rds_master_password` - password for the master DB user
- `backup_retention_period` - number of days to retain backups for
- `backup_window` - daily time range during which automated backups are created
- `final_snapshot_name` - name of your final DB snapshot when this DB cluster is deleted
- `availability_zones` - ec2 availability zones that instances in the DB cluster can be created in
- `security_groups` - list of vpc security groups to associate with the cluster

Aurora instance Inputs
- `instance_class` - instance class to use for rds cluster instances
- `publicly_accessible` - bool to control if instance is publicly accessible

RDS subnet group Inputs
- `rds_subnet_ids` - list of VPC subnets to associate db subnet group"

Instance tagging Inputs
- `Stack` - Stack name
- `OwnerContact` - OwnerContact for application

Outputs
-------

- `cluster_endpoint` - DNS address for the created cluster
- `database_name` - database name for the cluster db

Usage
-----

You can use these in your terraform template with the following steps.

1.) Adding a module resource to your template, e.g. `main.tf`

```
module "my_aurora_instance" {
  source = "git::https://github.com/vbhasin22/aurora_terraform_module.git"

  #Aurora Cluster Inputs
  cluster_id = "${var.cluster_id}"
  db_name = "${var.db_name}"
  rds_master_username = "${var.rds_master_username}"
  rds_master_password = "${var.rds_master_password}"
  backup_retention_period = "${var.backup_retention_period}"
  backup_window = "${var.backup_window}"
  final_snapshot_name = "${var.final_snapshot_name}"
  availability_zones = "${var.availability_zones}"
  security_groups = "${var.security_groups}"

  #Aurora instance Inputs
  instance_class = "${var.instance_class}"
  publicly_accessible = "${var.publicly_accessible}"

  #RDS subnet group Inputs
  rds_subnet_ids = "${var.rds_subnet_ids}"

  #Instance Tagging Inputs
  stack = "${var.stack}"
  Ownercontact = "${var.Ownercontact}"
}
```

2.) Setting values for the following variables, either through
`terraform.tfvars`, `variables.tf`, or `-var` arguments on the CLI

- cluster_id
- db_name
- rds_master_username
- rds_master_password
- backup_retention_period
- backup_window
- final_snapshot_name
- availability_zones
- security_groups
- instance_class
- publicly_accessible
- rds_subnet_ids
- stack
- Ownercontact

Authors
=======

Created and maintained by [Vikram Bhasin](mailto:v.bhasin1@gmail.com).
