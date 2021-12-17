#Bucket Name

variable "bucket_name" {
  type        = string
  description = "Name of the s3 bucket to create"
}

variable "elb_service_account_arn" {
  type        = string
  description = "ARN of ELB service account"
}

variable "common_tags" {
  type        = map(string)
  description = "map of tags to apply for all resource"
  default     = {}
}