# Creating RDS Aurora Cluster in Tokyo region in private subnets 1A and 1D

resource "aws_kms_key" "example" {
  description = "Example KMS Key"
}


resource "aws_db_subnet_group" "tokyo_private_subnet_group" {
  name        = "tokyo-private-subnet-group"
  description = "Private Subnet group for tokyo RDS cluster"

  subnet_ids  = [aws_subnet.tokyo-private-ap-northeast-1a.id, 
                 aws_subnet.tokyo-private-ap-northeast-1d.id]
            }


resource "aws_rds_cluster_instance" "tokyo_rds_cluster_instances" {
  count              = 2
  identifier         = "aurora-cluster-tokyo-${count.index}"
  # ca_cert_identifier =  (Optional) Identifier of the CA certificate for the DB instance.
  cluster_identifier = aws_rds_cluster.tokyo_rds_cluster.id
  db_subnet_group_name = aws_db_subnet_group.tokyo_private_subnet_group.name
  instance_class     = "db.r5.large"
  engine             = "aurora-mysql" #aws_rds_cluster.aurora-mysql.engine
  engine_version     = aws_rds_cluster.tokyo_rds_cluster.engine_version
}


resource "aws_rds_cluster" "tokyo_rds_cluster" {
  cluster_identifier                = "aurora-cluster"
  availability_zones                = ["ap-northeast-1a", "ap-northeast-1d"]
  db_subnet_group_name              = aws_db_subnet_group.tokyo_private_subnet_group.name
  # db_subnet_group_name = "tokyo_private_subnet_group" 
  database_name                     = "tokyodb"
  engine                            = "aurora-mysql"
  enabled_cloudwatch_logs_exports   = ["audit", "error", "general", "slowquery"]
  master_username                   = "admin"
  master_password                   = "admintest"
  #manage_master_user_password   = true
  #master_user_secret_kms_key_id = aws_kms_key.ceb68900-d7b0-4e4b-802f-601682f270be.key_id
  skip_final_snapshot               = true
  vpc_security_group_ids            = [aws_security_group.tok_DB01-SG01-443.id]
}



/*
resource "aws_db_instance" "tokyo_db_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "tokyodb"
  username             = "admin"
  password             = "admintest"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.tokyo_private_subnet_group.name
}
*/

