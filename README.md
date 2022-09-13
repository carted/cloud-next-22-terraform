# cloud-next-22-terraform
Contains code and slides for our talk at Cloud Next 2022: **Better Hardware Provisioning for ML Experiments on GCP**.

Machine Learning (ML) needs extensive experimentation. Modern cloud service platforms such as GCP provide feature-rich GUIs that enable ML practitioners to quickly spin up hardware instances with everything set up – Python libraries, system-level packages, CUDA drivers, etc. A typical workflow here involves a few clicks on a GUI where you’d configure your instance, and you’re set! The entire process is quite fast, enabling you to get started quicker.  

But what if there are certain requirements that your team needs to meet?

* Custom dependencies not covered by the pre-built container images provided by the cloud platform. 
* Set up Python environments for running your experiments. 
* Attach a startup script that monitors the CPU utilization of your instance and automatically shuts it down if the utilization is low. 
* Accompany the instance with a Google Cloud Storage bucket.

It can quickly become painful if you need to go over the above steps every time you spin up a notebook via the GUI. It’s easy to miss a step when spinning up a notebook instance via the GUI and configuring it, even if there are instructions. It can be even more complicated if the instructions themselves are not self-sufficient.  Wouldn’t it be more effective if you could fire a single command that would take care of provisioning your hardware per your configurations? This is where a programmatic approach for provisioning hardware can be powerful, encouraging version control, reproducibility, and transparency within your team and beyond. 

In this session, we’ll go over the pain points of provisioning hardware, especially for ML experiments, discuss how they originate, and how we can better provision hardware with code. We’ll cover this using Vertex AI Workbench instances and Terraform. By the end of this presentation, you’ll have the skills and knowledge to inspect your ML  hardware provisioning workflows and find scopes for improving them with code. 


## Code

Ensure you have Terraform [installed](https://learn.hashicorp.com/tutorials/terraform/install-cli). You'd also need to [configure GCP-related
authentication](https://cloud.google.com/docs/authentication) on your system.

Refer to the `terraform` directory. Refer to the `vars.tf` file to change your GCP project name, GCS bucket name etc.
From there, first run `terraform init`. Then

```bash
terraform plan
terraform apply -auto-approve
```

You should get:

```bash
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

To destroy the provisioned resources:

```bash
terraform destory -auto-approve
```

You should get:

```bash
Destroy complete! Resources: 2 destroyed.
```

## Verficiation

* Python virtual environment
* Serial port output (CPU utilization)

TBA

## Slides

TBA

## Acknowledgements

* [Nilabhra Roy Chowdhury](https://www.linkedin.com/in/nilabhraroychowdhury/) who worked on the `startup.sh` script.
* [Shane Hull](https://www.linkedin.com/in/shanehull0/) who helped review the content.
