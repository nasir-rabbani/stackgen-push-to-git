terraform {
  backend "s3" {
    region  = "us-west-2"
    bucket  = "sg-deployment-test-statefiles"
    key     = "nasir-local-c2c.tfstate"
    encrypt = "true"
    use_lockfile = "true"
  }
}