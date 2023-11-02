provider "aws" {
  region = var.aws_region
}

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
  security_group_ids = [var.security_group_id]

  tags = {
    Name  = "endpoint-ecr-dkr"
    infra = "vpc-endpoint-ecr-dkr"
  }
}

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
  security_group_ids = [var.security_group_id]

  tags = {
    Name  = "endpoint-ecr-api"
    infra = "vpc-endpoint-ecr-api"
  }
}

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
