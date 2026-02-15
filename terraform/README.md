# What-If: Case of unintentionally exposed a VM to public internet - 1699

### Terraform script for Missing Guardrails

| Component      | Issue                               |
| -------------- | ----------------------------------- |
| Security Group | Allows **all ports from 0.0.0.0/0** |
| Public IP      | **Auto-assigned**                   |
| Subnet         | Public subnet with IGW              |
| No IAM Policy  | No policy to restrict provisioning  |

---

### Directory Structure

```
issue-1699/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    └── network/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```


This simulates a misconfigured environment **for testing only**. 


### Preventive Measures – Our Approach

1. Secure the network and EC2 setup (no open SG, no public IP).
2. Add **AWS Config rules** to monitor violations.

---

### Secure Terraform Setup

Update `main.tf` (in root module):

```hcl
resource "aws_security_group" "secure_sg" {
  name   = "secure_sg"
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["specific_ip_from_your_work_network/32"] # limit SSH access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SecureSG"
  }
}

resource "aws_instance" "secure_vm" {
  ami                         = "ami-06c68f701d8090592"
  instance_type               = "t2.micro"
  subnet_id                   = module.network.public_subnet_id
  associate_public_ip_address = false # No public IP
  vpc_security_group_ids      = [aws_security_group.secure_sg.id]

  tags = {
    Name = "SecureVM"
  }
}
```



### Summary

| Component  | Secure Behavior                    |
| ---------- | ---------------------------------- |
| EC2        | No public IP, limited SSH          |
| SG         | Port 22 restricted to your IP      |
| AWS Config | Flags public IP + unrestricted SSH |
