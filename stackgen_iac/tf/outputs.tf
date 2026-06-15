
################################################################################

output "bucket" {
  value = module.test-s3-nsrk.bucket_name
}

output "arn" {
  value = module.test-s3-nsrk.arn
}

output "obj" {
  value = var.test_op
}

