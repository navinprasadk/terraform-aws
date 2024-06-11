# AWS Terraform

## Generate Metadata File

Run the following commands

1. terraform init

1. terraform plan -out tf.plan

1. terraform show -no-color -json tf.plan > output.json

Check the output.json file