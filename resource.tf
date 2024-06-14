provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "my-unique-bucket-name-2024"
}

# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

# Root Block Device (EBS)
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
    delete_on_termination = true
  }

  # Additional EBS Block Devices
  ebs_block_device {
    device_name = "/dev/sdh"
    volume_type = "gp2"
    volume_size = 20
    delete_on_termination = true
  }

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

  tags = {
    Name = "MyDBInstance"
  }
}

