module "stackgen_5a532d91-eaad-4cd6-ae81-7d3d34b4bda2" {
  # Remote source missing and Registry resolution failed (Incompatible Versioning). 
  # Vendored locally. Action: Link to Git or apply a valid Semantic Version (SemVer).
  source      = "./modules/custom_aws_security_group_1.0.6_6"
  description = "Managed by Terraform"
  egress      = []
  ingress     = []
  name        = "example-sg1234567"
  tags = {
    Name = "my_sg"
  }
  vpc_id = "dfadf"
}

