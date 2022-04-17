variable "vpc_cidr_value" {
  type        = string
  description = "VPC cidr range"
}
###########
# AZS
###########
variable "az1" {
  default = "ap-south-1a"
}

variable "az2" {
  default = "ap-south-1b"
}

#######################
# subnet Cidr
######################

variable "subnet-1-cidr" {
  type = string
}
variable "subnet-2-cidr" {
  type = string
}
variable "subnet-3-cidr" {
  type = string
}
variable "subnet-4-cidr" {
  type = string
}
variable "subnet-5-cidr" {
  type = string
}
variable "subnet-6-cidr" {
  type = string
}


