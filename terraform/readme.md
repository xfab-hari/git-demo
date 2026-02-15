
0. Run these cmds from this folder only. not root of repo

1. `gcloud auth application-default login --project ordinal-gear-425404-f7`
2. `terraform init`
3. 
```bash
terraform plan -out=tfplan.binary && \\
terraform show -json tfplan.binary > tfplan.json
```
4. you should find `tfplan.json` created in this folder
5. you can upload this on the Simon Page