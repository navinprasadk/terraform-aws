# Terraform Resource to AWS Service Mapping

This document is prepared with the help of AWS Terraform provider **v5.53.0**

--------------

## Block Level Mapping (Many to One Relationship)
 
> Due to time constraints, mentioned only one resource block of terraform to AWS service 

| Resource Block | AWS Service|
|----------------|------------|
|[aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)  |EC2|
|[aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | S3|
| [aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | RDS |
|[aws_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)| Load Balancer |
|[aws_elasticache_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster)| Elasticache|

--------------

### Block Level Cost Parameters

#### aws_instance

 1. ami - either hardcoded value or aws_instance.<resource_label>.ami (Mandatory)
 2. ebs_block_device 
    - IOPS - aws_instance.<resource_label>.root_block_device.iops (Only for GP3, io1, io2)
    - throughput - aws_instance.<resource_label>.root_block_device.throughput (Only for GP3)
    - volume_size - aws_instance.<resource_label>.root_block_device.volume_size (Mandatory)
    - volume_type - aws_instance.<resource_label>.root_block_device.volume_type (Mandatory)
 3. instance_type - aws_instance.<resource_label>.instance_type (Mandatory)
 4. root_block_device (Mandatory)
    - IOPS - aws_instance.<resource_label>.root_block_device.iops (Only for GP3, io1, io2)
    - throughput - aws_instance.<resource_label>.root_block_device.throughput (Only for GP3)
    - volume_size - aws_instance.<resource_label>.root_block_device.volume_size (Mandatory)
    - volume_type - aws_instance.<resource_label>.root_block_device.volume_type (Mandatory)
 5. ~~associate_public_ip_address~~
 6. ~~availability_zone~~
 

  ##### Missing Cost Parameter from Terraform Resource Block - aws_instance

  1. Data Transfer


 ##### EC2 and EBS Storage Cost Calculations

 1. EC2 Cost = No. of EC2 instances x hourly cost x Running hours in a month
 2. EBS Storage Cost = Storage Size x instance months x hourly cost
    (instance months = total EC2 running hours / 730 hours in a month)


 > For O1, GP2, GP3: Inaddition to EBS Storage cost, we have to calculate the transaction charges using IOPS and Throughput
--------------

#### aws_s3_bucket

From the aws_s3_bucket resource block, none of the parameters are required for cost estimation.


Fixed charges
  NIL

Consumption-based charges
 1. Storage Size

--------------

#### aws_db_instance


allocated_storage  
max_allocated_storage  
engine
engine_version
instance_class 
iops 
multi_az 
storage_type 


##### RDS Calculations

1. Instance Cost = No. of instances * hourly cost * 730 * Utilisation percentage

    > Utilisation percentage = total running hours / 730 hours in a month

2. Storage Cost

    For GP2, GP3 Storage cost = storage amount * no of instances * hourly cost
    For IO1, IO2 Storage cost = IOPS * No. of instances * hourly cost

3. Dedicated Log Volume Cost (only for IO1, IO2)

    1000 GB x hourly cost
    3000 Provisioned IOPS x hourly cost

    > Dedicated Log Volumes are priced the same as a data volume with 1,000 GiB and 3,000 IOPS and by storage type

4. Backup Storage Cost
    Backup storage size GB * hourly cost

5. Snapshot Export
    Size of Backup Processed for Export GB * hourly cost

> We are not cansidering the following cost: Performance Insights, and Extended Support 

--------------

#### aws_lb


--------------

#### aws_elasticache_cluster
