# Example: Basic VPC Deployment

This example shows how to use the `simple-vpc` module to deploy a basic VPC with public and private subnets.

## Usage

To use this example, navigate to this directory and run:

```sh
terraform init
terraform plan
terraform apply
```

## Inputs

| Name         | Description                          | Type   | Default    |
|-------------|--------------------------------------|--------|------------|
| aws_region  | AWS region for deployment           | string | "us-east-1" |

## Outputs

| Name               | Description                |
|--------------------|----------------------------|
| vpc_id            | The ID of the created VPC  |
| public_subnet_ids | IDs of the public subnets |
| private_subnet_ids | IDs of the private subnets |

## Cleanup

To delete the resources:

```sh
terraform destroy
```
