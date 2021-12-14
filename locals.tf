## Random Integers for S3 Buket name

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

# Common Tags
locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }
  s3_bucket_name = "pilot-${random_integer.rand.result}"
}