provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create a security group
resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "my-unique-bucket-name-2024"
}

# Create an EC2 instance
resource "aws_instance" "web" {
  ami             = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "WebServer"
  }
}

# Create an RDS instance
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "password123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

