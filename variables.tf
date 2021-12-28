variable "naming_prefix" {
  type        = string
  description = "Name Prefix to all Resources"
  default     = "pilot"
}

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = map(string)
  description = "Base CIDR Block for VPC"
}

variable "vpc_subnet_count" {
  type        = map(number)
  description = "Number of Subnets to create"
}

variable "vpc_subnets_cidr_blocks" {
  type        = list(string)
  description = "CIDR Blocks for Subnets in VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = map(string)
  description = "Type for EC2 Instance"
}

variable "instance_count" {
  type        = map(number)
  description = "Number of instances to create in VPC"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Project1"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}