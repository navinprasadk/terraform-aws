# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  default     = "ami-830c94e3"  # Replace with a valid AMI ID in your region
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "my-key-pair"  # Replace with your key pair name
}
