variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" { 
  type = string
  default = "vpc-02704242632eb2597"
}

variable "subnet_a" { 
    type = string
    default = "subnet-0c485509fe2864438"
}

variable "subnet_b" { 
    type = string
    default = "subnet-000064d84790b3f77"
}

variable "sg_cluster_ecs" { 
    type = string
    default = "sg-07044c0bf87d90c71"
}

variable "rt_subnet_a" { 
    type = string
    default = "rtb-0ab7900da999cac96"
}

variable "rt_subnet_b" { 
    type = string
    default = "rtb-0f0539661cf658c7f"
}

variable "sg_cluster_alb" { 
    type = string
    default = "sg-0984492cc7da3f5da"
}