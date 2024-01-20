provider "aws" {
  region = var.aws_region
}

#Configuração do Terraform State
terraform {
  backend "s3" {
    bucket         = "terraform-state-soat"
    key            = "vpc-endpoint/terraform.tfstate"
    region         = "us-east-1"

    dynamodb_table = "terraform-state-soat-locking"
    encrypt        = true
  }
}

#Ecr
resource "aws_vpc_endpoint" "vpc_ecr_dkr" {
  service_name        = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  ip_address_type = "ipv4"

  vpc_id              = var.vpc_id
  subnet_ids = [
    var.subnet_a,
    var.subnet_b
  ]
  security_group_ids = [var.sg_cluster_ecs]

  tags = {
    Name  = "endpoint-ecr-dkr"
    infra = "vpc-endpoint-ecr-dkr"
  }
}

#Ecr
resource "aws_vpc_endpoint" "vpc_ecr_api" {
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  ip_address_type = "ipv4"

  vpc_id = var.vpc_id
  subnet_ids = [
    var.subnet_a,
    var.subnet_b
  ]
  security_group_ids = [var.sg_cluster_ecs]

  tags = {
    Name  = "endpoint-ecr-api"
    infra = "vpc-endpoint-ecr-api"
  }
}

#S3
resource "aws_vpc_endpoint" "vpc_s3_gtw" {
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"

  vpc_id = var.vpc_id

  route_table_ids = [var.rt_subnet_a, var.rt_subnet_b]

  tags = {
    Name  = "endpoint-s3"
    infra = "vpc-endpoint-s3"
  }
}

#CloudWatch/Logs
resource "aws_vpc_endpoint" "vpc_log" {
  service_name = "com.amazonaws.us-east-1.logs"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  ip_address_type = "ipv4"

  vpc_id = var.vpc_id
  subnet_ids = [
    var.subnet_a,
    var.subnet_b
  ]
  security_group_ids = [var.sg_cluster_ecs]

  tags = {
    Name  = "endpoint-logs"
    infra = "vpc-endpoint-logs"
  }  
}

#RDS
resource "aws_vpc_endpoint" "vpc_rds" {
  service_name = "com.amazonaws.us-east-1.rds"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  ip_address_type = "ipv4"

  vpc_id = var.vpc_id
  subnet_ids = [
    var.subnet_a,
    var.subnet_b
  ]
  security_group_ids = [var.sg_cluster_ecs]

  tags = {
    Name  = "endpoint-rds"
    infra = "vpc-endpoint-rds"
  }  
}

#Secrets Manager
resource "aws_vpc_endpoint" "vpc_sm" {
  service_name = "com.amazonaws.us-east-1.secretsmanager"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  ip_address_type = "ipv4"

  vpc_id = var.vpc_id
  subnet_ids = [
    var.subnet_a,
    var.subnet_b
  ]
  security_group_ids = [var.sg_cluster_ecs]

  tags = {
    Name  = "endpoint-secrets-manager"
    infra = "vpc-endpoint-sm"
  }  
}

#DynamoDB
resource "aws_vpc_endpoint" "vpc_s3_gtw" {
  service_name      = "com.amazonaws.us-east-1.dynamodb"
  vpc_endpoint_type = "Gateway"

  vpc_id = var.vpc_id

  route_table_ids = [var.rt_subnet_a, var.rt_subnet_b]

  tags = {
    Name  = "endpoint-dynamodb"
    infra = "vpc-endpoint-dynamodb"
  }
}