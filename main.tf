provider "aws" {
  region = "${var.aws_region}"
}

#Aurora Cluster
resource "aws_rds_cluster" "aurora_cluster" {
    cluster_identifier            = "${var.cluster_id}"
    database_name                 = "${var.db_name}"
    master_username               = "${var.rds_master_username}"
    master_password               = "${var.rds_master_password}"
    backup_retention_period       = "${var.backup_retention_period}"
    preferred_backup_window       = "${var.backup_window}"
    final_snapshot_identifier     = "${var.final_snapshot_name}"
    storage_encrypted             = true
    availability_zones            = ["${split(",", var.availability_zones)}"]
    vpc_security_group_ids        = ["${var.security_groups}"]
    db_subnet_group_name          = "${aws_db_subnet_group.aurora_subnet_group.name}"
}

resource "aws_rds_cluster_instance" "aurora_cluster_instance" {
    count                 = "${length(split(",", var.rds_subnet_ids))}"
    identifier            = "${var.cluster_id}aurorardsinstance${count.index}"
    cluster_identifier    = "${aws_rds_cluster.aurora_cluster.id}"
    instance_class        = "${var.instance_class}"
    db_subnet_group_name  = "${aws_db_subnet_group.aurora_subnet_group.name}"
    publicly_accessible   = "${var.publicly_accessible}"
    tags {
      Stack = "${var.stack}"
      OwnerContact = "${var.Ownercontact}"
    }
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
    name          = "${var.cluster_id}_aurora_db_subnet_group"
    description   = "Allowed subnets for Aurora DB cluster instances"
    subnet_ids    = ["${split(",", var.rds_subnet_ids)}"]
    tags {
	  Stack = "${var.stack}"
      OwnerContact = "${var.Ownercontact}"
    }
}
