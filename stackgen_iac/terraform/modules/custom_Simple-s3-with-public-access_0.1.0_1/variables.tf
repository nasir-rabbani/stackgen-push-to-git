variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
  default     = "nsrk-test-delete-me"
}



variable "block_public_policy" {
  description = "Block public access"
  type        = bool
  default     = false
}