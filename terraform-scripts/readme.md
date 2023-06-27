--------------------------TERRAFORM-SCRIPT----------------------------------------------------------

* In the Terraform folder, there are three folders: project-infra, tf-module-eks, and tf-module-vpc.
* In order to launch EKS, I have separated the structure and its complexity into modules and configurations.
* The first step is to provision VPC, so I have created a VPC module, i.e., the tf-module-vpc folder.
* And the second step is to provision EKS, so I have created another EKS module, i.e., tf-module-eks.
* There are necessary scripts and submodules in both of these folders that you can explore in depth.
* So coming to the provision of EKS, you can customise as per your needs, i.e., you can go to the project-infra/env-prod folder where you can customise the config for VPC and EKS.
And once that is done, Just execute the following commands:
* Change directory into project-infra

           cd /project-infra

* Intialize the tf scripts

           terraform init -backend-config=env-dev/state.tfvars

* then to see the plan

           terraform plan -var-file=env-dev/main.tfvars

and to apply those changes

           terraform apply -auto-approve -var-file=env-dev/main.tfvars

* The above command will provision VPC first and, after that, EKS with node groups.
* Coming to the EKS, I have given the necessary IAM permissions for the cluster and for nodes as well. Also giving access to SSM via the ODIC provider.
* Atlast to destroy the infra

            terraform destroy -auto-approve -var-file=env-dev/main.tfvars



