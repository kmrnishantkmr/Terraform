This repo is to automate the provisioning of Jenkins and slave node and configure both using ansible as a provisioner in terraform.
Both Jenkins master and slave are on different VPC and availablity Zone. Those are connected via VPC peering.
I have utilized backend in terraform for storing statefile on S3 and enable the versioning on S3 for retaining every state files.
