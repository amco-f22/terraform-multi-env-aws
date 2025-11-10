module "dev-app" {
  source          = "./my_app_modules"
  my_env          = "dev"
  instance_type   = "t2.micro"
  ami_id          = "ami-0ecb62995f68bb549"
  instance_count  = 1
}

module "stg-app" {
  source          = "./my_app_modules"
  my_env          = "stg"
  instance_type   = "t2.medium"
  ami_id          = "ami-0ecb62995f68bb549"
  instance_count  = 2
}

module "prd-app" {
  source          = "./my_app_modules"
  my_env          = "prd"
  instance_type   = "t2.micro"
  ami_id          = "ami-0ecb62995f68bb549"
  instance_count  = 3
}


