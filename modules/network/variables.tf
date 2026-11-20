variable "name" {
  description = "Prefix for resource names."
  type        = string
}

variable "cidr" {
  description = "CIDR block of the VPC, e.g. 10.0.0.0/16."
  type        = string
}

variable "azs" {
  description = "The AZs to spread across, e.g. [\"us-east-1a\", \"us-east-1b\"]."
  type        = list(string)
}
