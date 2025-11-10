# Terraform Multi-Environment AWS Infrastructure

A small example demonstrating how to use Terraform modules to deploy reusable, consistent, and isolated AWS infrastructure across multiple environments: Development (dev), Staging (stg) and Production (prd).

---

## Table of contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Repository layout](#repository-layout)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
  - [Example module calls](#example-module-calls)
- [Author](#author)

---

## Project overview
This repo shows a pattern for deploying the same module (`my_app_modules`) into multiple environments with different configuration values (AMI, instance type, count). The module encapsulates resources such as EC2 instances, security groups and SSH key pair creation.

## Features
- Multi-environment setup (dev, stg, prd) using one reusable module
- Environment-specific configuration (AMI, instance type, instance count)
- SSH key pair management (public key tracked in repo)
- Security group creation with controlled inbound/outbound rules
- Clear tagging and environment isolation

## Repository layout
- main.tf — root configuration that calls the environment modules  
- my_app_modules/  
  - my_server.tf — EC2, SG and key-pair resources  
  - variables.tf — module input variables  
  - outputs.tf — module outputs  
- terra-key.pub — public SSH key for EC2 access (safe to track)  
- .gitignore — excludes .tfstate, private keys, etc.

---

## Prerequisites
- Terraform >= 1.0  
- AWS account and credentials configured (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY, or via AWS CLI profile)  
- Confirm correct AWS region and AMI IDs for your account

---

## Usage

1. Initialize Terraform
   terraform init

2. Preview changes
   terraform plan

3. Apply changes
   terraform apply

4. Destroy (when required)
   terraform destroy

### Example module calls (root `main.tf`)
```hcl
module "dev-app" {
  source         = "./my_app_modules"
  my_env         = "dev"
  instance_type  = "t2.micro"
  ami_id         = "ami-0ecb62995f68bb549" # replace with your region's AMI
  instance_count = 1
}

module "stg-app" {
  source         = "./my_app_modules"
  my_env         = "stg"
  instance_type  = "t2.medium"
  ami_id         = "ami-0ecb62995f68bb549"
  instance_count = 2
}

module "prd-app" {
  source         = "./my_app_modules"
  my_env         = "prd"
  instance_type  = "t2.micro"
  ami_id         = "ami-0ecb62995f68bb549"
  instance_count = 3
}
```

---

## Author
Aman Nikhare — Terraform | AWS | DevOps Enthusiast  
Email: creatvaman@gmail.com  
GitHub: https://github.com/amco-f22

---


