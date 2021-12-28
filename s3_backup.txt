# S3 Module

module "web_app_s3" {
  source                  = "./modules/pilot-s3"
  bucket_name             = local.s3_bucket_name
  elb_service_account_arn = data.aws_elb_service_account.root.arn
  common_tags             = local.common_tags
}

#########################################


# aws s3 bucket object

resource "aws_s3_bucket_object" "website_content" {
  for_each = {
    website = "/website/index.html"
    logo    = "/website/panther.png"
  }
  bucket = module.web_app_s3.web_bucket.id
  key    = each.value
  source = ".${each.value}"

  tags = local.common_tags

}
