# Terraform Resource to AWS Service Mapping

This document is prepared with the help of AWS Terraform provider **v5.53.0**

--------------

## Block Level Mapping (Many to One Relationship)
 
> Due to time constraints, mentioned only one resource block of terraform to AWS service 

| Resource Block | AWS Service|
|----------------|------------|
|[aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)  |EC2|
|[aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | S3|
|[aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | VPC|
| [aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | RDS |

--------------

### Block Level Cost Parameters

#### aws_instance -> AWS EC2

 1. ami (cost)
 2. ebs_block_device (cost)
    - iops
    - throughput
    - volume_size
    - volume_type
 3. instance_type (cost)
 4. root_block_device (cost)
    - iops
    - throughput
    - volume_size
    - volume_type
 5. ~~associate_public_ip_address~~
 6. ~~availability_zone~~
 

  ##### Missing Cost Parameter from Terraform Resource Block - aws_instance

  1. Data Transfer

--------------

#### aws_s3_bucket -> AWS S3

In - Progress

--------------

#### aws_vpc -> AWS VPC

In - Progress

--------------

#### aws_db_instance -> AWS RDS

In - Progress

--------------


