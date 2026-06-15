module "test-s3-nsrk" {
  source                       = "./modules/aws_s3"
  block_public_access          = false
  bucket_name                  = "nasir-playground-test-bucket-1-modified"
  bucket_policy                = ""
  enable_versioning            = false
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags = {
    owner = "nasir-2"
  }
  website_error_document = "404.html"
  website_index_document = "index.html"
}

