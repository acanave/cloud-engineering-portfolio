# Simple VPC Module

This Terraform module creates a Virtual Private Cloud (VPC) in Amazon Web Services (AWS) with public and private subnets, along with the necessary networking components.

## Features

- Creates a VPC with the specified CIDR block.
- Configures public and private subnets across multiple availability zones.
- Optionally creates a NAT Gateway for outbound internet access from private subnets.
- Associates route tables and manages routing between subnets and the internet.

## Usage

```hcl
provider "aws" {
  region = "us-east-1"
}

module "simple_vpc" {
  source = "git::https://github.com/acanave/cloud-engineering-portfolio.git//infra/aws/networking/modules/simple-vpc"

  vpc_name           = "my-vpc"
  cidr_block         = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  enable_nat_gateway = true

  tags = {
    Environment = "production"
    Owner       = "your-name"
  }
}
```

## Inputs

| Name                | Description                                         | Type    | Default | Required |
|---------------------|-----------------------------------------------------|---------|---------|:--------:|
| `vpc_name`          | The name of the VPC                                 | string  | n/a     |   yes    |
| `cidr_block`        | The CIDR block for the VPC                          | string  | n/a     |   yes    |
| `availability_zones`| List of availability zones for subnet distribution  | list    | n/a     |   yes    |
| `public_subnets`    | List of CIDR blocks for public subnets              | list    | n/a     |   yes    |
| `private_subnets`   | List of CIDR blocks for private subnets             | list    | n/a     |   yes    |
| `enable_nat_gateway`| Enable NAT Gateway creation (true/false)            | bool    | `false` |    no    |
| `tags`              | Map of tags to assign to resources                  | map     | `{}`    |    no    |

## Outputs

| Name                  | Description                       |
|-----------------------|-----------------------------------|
| `vpc_id`              | The ID of the created VPC        |
| `public_subnet_ids`   | The IDs of the public subnets    |
| `private_subnet_ids`  | The IDs of the private subnets   |

## Prerequisites

- An AWS account with appropriate permissions.
- Terraform installed on your local machine. [Download Terraform](https://www.terraform.io/downloads.html)

## Instructions

1. **Initialize Terraform:**
   ```sh
   terraform init
   ```

2. **Review the Plan:**
   ```sh
   terraform plan
   ```

3. **Apply the Configuration:**
   ```sh
   terraform apply
   ```

4. **Destroy the Resources (when no longer needed):**
   ```sh
   terraform destroy
   ```

## Notes

- Ensure that the CIDR blocks for subnets do not overlap and are within the VPC's CIDR block.
- Adjust the `availability_zones` list based on the desired AWS region.
- Tagging resources helps with cost tracking and organization.

## Frequently Asked Questions

### **1️⃣ Why use this module instead of writing Terraform from scratch?**
✅ Saves time with pre-configured networking setup  
✅ Follows AWS best practices for VPC design  
✅ Easily customizable for different environments  

### **2️⃣ What happens if I run `terraform apply` twice?**
Terraform will **not create duplicate resources**—it will **only update** existing ones if changes are detected.

### **3️⃣ Can I deploy this in another AWS region?**
Yes! Just set the `aws_region` variable before running `terraform apply`:
```sh
terraform apply -var="aws_region=us-west-2"
```

## 📬 **Need Help?**
If you run into any issues:
- Check the **Terraform error messages** carefully  
- Verify your AWS credentials are correctly set  
- Open an issue in the GitHub repository  

🎯 **Happy Terraforming!** 🎯