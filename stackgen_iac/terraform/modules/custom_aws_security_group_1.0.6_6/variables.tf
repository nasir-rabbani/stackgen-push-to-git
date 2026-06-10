variable "name" {
  description = "The name of the security group."
  type        = string
  default     = "example-sg"
}

variable "description" {
  description = "Security group description."
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "The VPC ID where this security group will be created."
  type        = string
}

variable "ingress" {
  description = "List of ingress rules. Each object must have from_port, to_port, protocol, cidr_blocks."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = []
}

variable "egress" {
  description = "List of egress rules. Each object must have from_port, to_port, protocol, cidr_blocks."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = []
}

variable "tags" {
  type = map(string)
  default = {
    "Name" = "my_sg"
  }
}