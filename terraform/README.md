# What-If Simulation Evaluation

## Test Cases

| # | Finding                                                                                                                             | Impact                            |
| - | ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- |
| 1 | Security Group Allows Access, but [NACL](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html) Silently Blocks It | App fails to connect to DB          |
| 2 | Route Table Sends Internal Traffic Through NAT Gateway                                                                              | Latency + cost explosion   |
| 3 | Public DNS Record Points to Private IP of Load Balancer                                                                             | Service unreachable externally    |
| 4 | Shared Service Account Across Unrelated Resources                                                                                   | Privilege escalation risk |
| 5 | Orphaned Service Accounts Still Granted Active Permission                                                                           | Hidden attack surface             |
| 6 | No Terraform **State Locking** or **Remote Backend** defined in the script                                                          | Risk of state corruption          |
| 7 | `"Resource": "*"` and `"Action": "s3:*", "rds:*"`                                                                                   | Full access across all resources  |
| 8 | No `tagging` strategy for cost tracking. No `budget alerts` or `cost controls`.                                                     | Hard to monitor cloud expenses    |



## Terraform code structure:

Your Terraform setup has now been modularized into two modules:

* `modules/iam`: Handles IAM role, policy, attachment, and instance profile.
* `modules/ec2`: Deploys EC2 instances using variables for networking and IAM profile.

Also included:

* `variables.tf`: Declares provider-level variables.
* `outputs.tf`: Exports ALB DNS for verification or use.

You can now organize your directory like this:

```
net_svc_testcase/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── iam/
    ├── ec2/
    ├── network/
    └── alb/
```

* **modules/iam** – Handles IAM roles, policies, and instance profiles.
* **modules/ec2** – Deploys EC2 instances using the IAM profile and network interfaces.
* **modules/network** – Provisions VPC, subnets, route tables, and network interfaces.
* **modules/alb** – Sets up the Application Load Balancer, security group, target groups, and listener.

`main.tf` calls all modules and wires the dependencies using module outputs and inputs.


