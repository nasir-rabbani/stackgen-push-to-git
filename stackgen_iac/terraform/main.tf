module "stackgen_ca5e4257-c3e6-43a9-885f-95c73462f2d2" {
  # Remote source missing and Registry resolution failed (Incompatible Versioning). 
  # Vendored locally. Action: Link to Git or apply a valid Semantic Version (SemVer).
  source              = "./modules/custom_Simple-s3-with-public-access_0.1.0_1"
  block_public_policy = false
  bucket_name         = "nsrk-test-delete-me-kd"
}

