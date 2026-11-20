terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Partial backend config: the bucket name is NOT in Git (the repo is public).
  # Locally: terraform init -backend-config=backend.hcl   (backend.hcl is git-ignored)
  # In CI:   terraform init -backend-config="bucket=<TF_STATE_BUCKET repo variable>"
  backend "s3" {
    key          = "ha-web-app/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # S3-native state locking, no DynamoDB table needed
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = var.project
      Owner     = var.owner
      ManagedBy = "terraform"
    }
  }
}
