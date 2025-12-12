module "stackgen_10706163-65ae-4ce3-8393-aa875313e863" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "sjhkjds"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags                         = {}
  website_error_document       = "404.html"
  website_index_document       = "index.html"
}

