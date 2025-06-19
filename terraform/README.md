# Terraform Modular Infrastructure

This project has been refactored into a modular Terraform structure for better maintainability, reusability, and organization.

## Structure

```
.
├── main.tf              # Root configuration calling modules
├── variables.tf         # Root-level input variables
├── outputs.tf          # Root-level outputs
└── modules/
    ├── network/        # VPC, subnets, routing
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── security/       # Security groups and firewall rules
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── compute/        # EC2 instances and key pairs
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## added `aws_default_network_acl` for default subnet NACL

```hcl
# Default Network ACL
resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id
  ingress {
    protocol   = "6"      # TCP
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "${var.vpc_name}-default-nacl"
  }
}
```
## Modules

### Network Module
- **Purpose**: Creates VPC, public subnet, internet gateway, and routing
- **Resources**: VPC, Subnet, Internet Gateway, Route Table, Route Table Association
- **Outputs**: VPC ID, Subnet ID, Internet Gateway ID

### Security Module
- **Purpose**: Manages security groups and firewall rules
- **Resources**: Security Group with SSH and HTTP access rules
- **Outputs**: Security Group ID and name

### Compute Module
- **Purpose**: Creates EC2 instances and associated resources
- **Resources**: EC2 instances, Key Pair, AMI data source
- **Outputs**: Instance IDs, public IPs, DNS names

