module "stackgen_42b5bc2a-07ae-496b-adff-498e28c26f50" {
  # Remote source (Git) not detected; resolving from the StackGen Registry. 
  # To enable external ownership, ensure the module is linked to a Git repository.
  source            = "main.dev.stackgen.com/enterprise/aws_s3_bucket/aws"
  version           = "1.0.0"
  bucket            = "nr-p2g-test"
  enable_versioning = false
  sse_algorithm     = null
}

