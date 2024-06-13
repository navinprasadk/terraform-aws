# Terraform Resource to AWS Service Mapping

This document is prepared with the help of AWS Terraform provider **v5.53.0**

## High Level Mapping (Many to One Relationship)
 
> Due to time constraint, mentioned only one resource block of terraform to AWS service 

| Resource Block | AWS Service|
|----------------|------------|
|aws_instance  |EC2|
|aws_s3_bucket | S3|
|aws_vpc | VPC|
| aws_db_instance | RDS |

### aws_instance -> AWS EC2

 1. ami (cost)
 2. associate_public_ip_address (not sure)
 3. availability_zone (not sure)
 4. ebs_block_device (cost)
    - iops
    - throughput
    - volume_size
    - volume_type
 5. instance_type (cost)
 6. root_block_device (cost)
    - iops
    - throughput
    - volume_size
    - volume_type

#### Missing Cost Parameter from Terraform Resource Block - aws_instance

   Data Transfer
