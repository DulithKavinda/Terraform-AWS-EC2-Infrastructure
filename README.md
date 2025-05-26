# ☁️ Terraform AWS EC2 Infrastructure (Dev Environment)

This project sets up a basic **AWS cloud infrastructure** using **Terraform**. It's designed as a foundational DevOps project that provisions a complete environment to host a public EC2 instance.

---

## 🚀 What It Does

- Creates a **custom VPC** with DNS support
- Sets up a **public subnet** in a specific availability zone
- Configures an **internet gateway** and route table for internet access
- Launches an **Ubuntu EC2 instance**
- Generates an **SSH configuration file** to easily connect to the instance
- Attaches a **security group** that allows all inbound/outbound traffic *(for development purposes only)*

---

## 🛠️ Technologies Used

- **Terraform** (~> 1.0)
- **AWS** (VPC, EC2, Subnet, Internet Gateway, Security Group)
- **Ubuntu 24.04 AMI**
- **PowerShell / Local-Exec Provisioner**

---

## 📁 Project Structure

```plaintext
.
├── main.tf               # Main infrastructure definition
├── providers.tf          # Provider and AWS profile setup
├── datasources.tf        # Fetches latest Ubuntu AMI
├── userdata.tpl          # (Optional) Script to run at EC2 startup
├── ssh-config.tpl        # Template to generate SSH config for easy access
├── README.md             # Project documentation


## ⚙️ Prerequisites

Before running this project, make sure you have the following set up **(locally or in GitHub Codespaces)**:

- ✅ **AWS CLI** configured with a profile named `VScode`
- ✅ **Terraform** installed (`terraform -version`)
- ✅ An **SSH key pair** (e.g., `~/.ssh/mtckey` and `~/.ssh/mtckey.pub`)
- ✅ An **AWS account** with permissions to create EC2, VPC, Subnet, etc.

> ℹ️ If you're running this in GitHub Codespaces, you’ll need to manually upload credentials, SSH keys, or use a remote backend for state. Codespaces won’t inherit local AWS credentials by default.

---

##  How to Use

### 1.  Clone the Repository
```bash
git clone https://github.com/your-username/terraform-aws-ec2-dev.git
cd terraform-aws-ec2-dev

### 2.  Initialize Terraform
```bash
terraform init

### 3.  Review the Plan
```bash
terraform plan

### 4.  Apply the Infrastructure
```bash
terraform apply

### 5.  Connect to EC2
After deployment, the ssh-config.tpl will generate a config entry like:
```bash
Host dev-node
  HostName <ec2-public-ip>
  User ubuntu
  IdentityFile ~/.ssh/mtckey

  Then connect via:
  ```bash
  ssh dev-node

  To clean up and destroy all the provisioned resources:
    ```bash
    terraform destroy