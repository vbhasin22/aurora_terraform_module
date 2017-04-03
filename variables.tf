variable "aws_region" {
  description = "This is the AWS region the cluster will be spun up in"
  default = "us-east-1"
}

#Cluster Variables
variable "cluster_id" {
  description = "This is the identifier of the cluster"
}

variable "db_name" {
  description = "The name for your database"
}

variable "rds_master_username" {
  description = "Username for the master DB user"
}

variable "rds_master_password" {
  description = "Password for the master DB user"
}

variable "backup_retention_period" {
  description = "Number of days to retain backups for"
}

variable "backup_window" {
  description = "daily time range during which automated backups are created"
}

variable "final_snapshot_name" {
  description = "name of your final DB snapshot when this DB cluster is deleted"
}

variable "availability_zones" {
  description = "EC2 Availability Zones that instances in the DB cluster can be created in"
}

variable "security_groups" {
  description = "List of VPC security groups to associate with the Cluster"
}

#Cluster Instance Variables
variable "instance_class" {
  description = "instance class to use for rds cluster instances"
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
}

#Cluster Subnet Group Variables
variable "rds_subnet_ids" {
  description = "List of VPC subnets to associate db subnet group"
}

#Tagging Variables
variable "stack" {
  description = "Name of the stack"
}

variable "Ownercontact" {
  description = "Owner contact for the stack"
}
