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
    about                 = "/website/resto/about.html"
    website               = "/website/resto/index.html"
    menu                  = "/website/resto/menu.html"
    reservation           = "/website/resto/reservation.html"
    special               = "/website/resto/special-dishes.html"
    team                  = "/website/resto/team.html"
    css_style             = "/website/resto/css/style.min.css"
    img_bf                = "/website/resto/img/breakfast-1.jpg"
    img_chef1             = "/website/resto/img/chef-1.jpg"
    img_chef2             = "/website/resto/img/chef-2.jpg"
    img_chef3             = "/website/resto/img/chef-3.jpg"
    img_favi              = "/website/resto/img/favicon-32x32.png"
    img_hero1             = "/website/resto/img/hero-1.jpg"
    img_hero2             = "/website/resto/img/hero-2.jpg"
    img_hero3             = "/website/resto/img/hero-3.jpg"
    img_logo              = "/website/resto/img/logo.png"
    img_reserve           = "/website/resto/img/reservation-bg.jpg"
    img_sal               = "/website/resto/img/salmon-zucchini.jpg"
    img_steak             = "/website/resto/img/steak.jpg"
    img_testi             = "/website/resto/img/testi-bg.jpg"
    js_app                = "/website/resto/js/app.min.js"
    vendor_boot_strap     = "/website/resto/vendor/bootstrap/bootstrap.min.css"
    vendor_boot_strap2    = "/website/resto/vendor/bootstrap/bootstrap.min.js"
    vendor_boot_popper    = "/website/resto/vendor/bootstrap/popper.min.js"
    vendor_owl_caro       = "/website/resto/vendor/owlcarousel/owl.carousel.min.css"
    vendor_owl_caro1      = "/website/resto/vendor/owlcarousel/owl.carousel.min.js"
    vendor_select_sel     = "/website/resto/vendor/select2/select2.min.css"
    vendor_select_sel1    = "/website/resto/vendor/select2/select2.min.js"
    vendor_stellar_jquery = "/website/resto/vendor/stellar/jquery.stellar.js"
  }
  bucket = module.web_app_s3.web_bucket.id
  key    = each.value
  source = ".${each.value}"

  tags = local.common_tags

}
