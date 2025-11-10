# EC2 Instance

resource "aws_instance" "my-ec2" {
    count = var.instance_count
  ami = var.ami_id # ubuntu
  instance_type = var.instance_type # free tier
  tags = {
    Name = "${var.my_env}-my-tfam-instance" # ec2 name
  }
}