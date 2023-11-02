variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" { 
  type = string
  default = "vpc-0bf97c5f4becb1576"
}

variable "subnet_a" { 
    type = string
    default = "subnet-01a7c22ff8287b137"
}

variable "subnet_b" { 
    type = string
    default = "subnet-05f0ea7a4b87d1605"
}

variable "security_group_id" { 
    type = string
    default = "sg-03e541e5c720f7720"
}

variable "rt_subnet_a" { 
    type = string
    default = "rtb-05feb6783c0674269"
}

variable "rt_subnet_b" { 
    type = string
    default = "rtb-000fb2707a24d49d6"
}
