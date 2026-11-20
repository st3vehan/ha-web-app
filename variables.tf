variable "region" {
  description = "AWS Region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Short name used as a prefix on every resource. Keep it under 20 characters."
  type        = string
  default     = "ha-web-app"
}

variable "owner" {
  description = "Your name, added as a tag so you can find your resources."
  type        = string
}

variable "alert_email" {
  description = "Email address that receives CloudWatch alarm notifications."
  type        = string
}

variable "repo_url" {
  description = "HTTPS clone URL of this repo. Servers run ansible-pull from it, so the repo must be public."
  type        = string
}

variable "repo_branch" {
  description = "Branch the servers pull their Ansible playbooks from."
  type        = string
  default     = "main"
}

variable "image_tag" {
  description = "Tag of the app image in ECR that the Auto Scaling group runs (push it first with scripts/push_image.sh)."
  type        = string
  default     = "v1"
}

variable "allowed_cidr" {
  description = "Who may reach the load balancer on port 80. Keep 0.0.0.0/0 so the Route 53 health checkers can reach it."
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  description = "EC2 instance type for the web tier and the on-prem server."
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "allow_onprem_db_access" {
  description = "Let the on-prem server reach RDS on 5432 (needed only during the migration). Set false after cutover."
  type        = bool
  default     = true
}

variable "onprem_weight" {
  description = "Route 53 weight for app.corp.internal pointing at the on-prem server. Cutover: 0."
  type        = number
  default     = 100
}

variable "aws_weight" {
  description = "Route 53 weight for app.corp.internal pointing at the load balancer. Cutover: 100."
  type        = number
  default     = 0
}
