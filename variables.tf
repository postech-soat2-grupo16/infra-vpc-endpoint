variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" { 
  type = string
  default = "value"
}

variable "subnet_a" { 
    type = string
    default = "value"
}

variable "subnet_b" { 
    type = string
    default = "value"
}

variable "sg_cluster_ecs" { 
    type = string
    default = "value"
}

variable "rt_subnet_a" { 
    type = string
    default = "value"
}

variable "rt_subnet_b" { 
    type = string
    default = "value"
}
