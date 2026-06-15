terraform {
  backend "s3" {
    region  = "us-west-2"
    bucket  = "sg-deployment-test-statefiles"
    key     = "terraform.tfstate"
    encrypt = "true"
    use_lockfile = "true"
  }
}
