# 🌐 Basic Example: Deploying a Simple VPC in AWS

This example demonstrates how to use the **Simple VPC Module** to deploy a Virtual Private Cloud (VPC) in AWS.  
It includes **public and private subnets, NAT gateways, and availability zones**.

---

## 🚀 **How to Use This Example**
### **1️⃣ Prerequisites**
Before running this example, ensure you have:
✅ An **AWS account** with proper credentials  
✅ **Terraform installed** on your machine ([Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))  
✅ An AWS IAM user with permissions to create VPCs, subnets, and route tables  

---

### **2️⃣ Setup Instructions**
#### **📌 Clone the Repository**
If you haven’t already, **clone this repository** to your local machine:
```sh
git clone https://github.com/acanave/cloud-engineering-portfolio.git
cd cloud-engineering-portfolio/infra/aws/networking/modules/simple-vpc/examples/basic
```

---

### **3️⃣ Initialize Terraform**
Run the following command to initialize Terraform and download the necessary modules:
```sh
terraform init
```

✅ **What this does:**  
- Downloads the AWS provider  
- Fetches the Simple VPC module  
- Sets up Terraform for this project  

---

### **4️⃣ Preview the Changes (Optional)**
You can check what resources Terraform will create before actually deploying them:
```sh
terraform plan
```
✅ **What this does:**  
- Shows the list of AWS resources that will be created  
- Ensures there are no errors in your Terraform configuration  

---

### **5️⃣ Deploy the VPC**
To create the VPC and all related resources in AWS, run:
```sh
terraform apply
```
Terraform will show a list of changes and ask for confirmation. Type **`yes`** to proceed.

✅ **What this does:**  
- Creates the VPC  
- Configures subnets, route tables, and NAT gateways  
- Tags resources for easy identification  

---

## 🛠 **Customize the Deployment**
You can **customize** the deployment by modifying `variables.tf` before running `terraform apply`.

### **Example: Changing the AWS Region**
Edit `variables.tf`:
```hcl
variable "aws_region" {
  description = "AWS region where the VPC will be deployed"
  type        = string
  default     = "us-east-1"
}
```
Then, apply the changes:
```sh
terraform apply -var="aws_region=us-west-2"
```
This deploys the VPC in **us-west-2** instead of the default **us-east-1**.

---

## 🔎 **Check the Created Resources**
Once deployed, you can **view the VPC details** using Terraform outputs:
```sh
terraform output
```
This will display:
- **VPC ID**
- **Public Subnet IDs**
- **Private Subnet IDs**

Example Output:
```
vpc_id = "vpc-0abcd1234efgh5678"
public_subnet_ids = ["subnet-0123456789abcdef0", "subnet-0fedcba9876543210"]
private_subnet_ids = ["subnet-0a1b2c3d4e5f6g7h8", "subnet-09f8e7d6c5b4a3a2b"]
```

---

## ❌ **Destroy the Resources (Cleanup)**
When you're done testing, **delete everything** to avoid AWS charges:
```sh
terraform destroy
```
✅ **What this does:**  
- Deletes all AWS resources created by this example  
- Prevents unnecessary costs  

---

## 📚 **Understanding the Code**
This example uses the **Simple VPC Module** from this repository:

```hcl
module "simple_vpc" {
  source = "git::https://github.com/acanave/cloud-engineering-portfolio.git//infra/aws/networking/modules/simple-vpc?ref=main"

  vpc_name           = "example-vpc"
  cidr_block         = "10.0.0.0/16"
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  enable_nat_gateway = true

  tags = {
    Environment = "example"
    Owner       = "Test User"
  }
}
```
**Key Features:**
- 🏗 **Creates a VPC** with public and private subnets  
- 📍 **Supports multiple Availability Zones**  
- 🚀 **Enables NAT Gateway** for internet access from private subnets  
- 🏷 **Uses AWS resource tagging** for easy identification  

---

## 📌 **Frequently Asked Questions**
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

---

## 📬 **Need Help?**
If you run into any issues:
- Check the **Terraform error messages** carefully  
- Verify your AWS credentials are correctly set  
- Open an issue in the GitHub repository  

🎯 **Happy Terraforming!** 🎯