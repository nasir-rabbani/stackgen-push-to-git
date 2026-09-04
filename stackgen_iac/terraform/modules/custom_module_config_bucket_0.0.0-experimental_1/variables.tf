variable "region" {
  description = "Primary GCP region"
  type        = string
  default     = "asia-south1"
}

variable "config_bucket_name" {
  description = "GCS bucket for plan artifacts and landing zone configuration exports"
  type        = string
  default     = "lcs-gcs-config"
}

