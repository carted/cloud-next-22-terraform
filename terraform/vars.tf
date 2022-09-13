variable "gcp" {
  type = object(
    {
      project_id = string
      location   = string
      region     = string
    }
  )
  default = {
    project_id = "gcp-project"
    location   = "us-central1-a"
    region     = "us-central1"
  }
}

variable "notebook" {
  type = object(
    {
      notebook_name      = string
      machine_type       = string
      gpu_type           = string
      gpu_count          = number
      image_family       = string
      install_gpu_driver = bool
      boot_disk_size     = number
      data_disk_size     = number
    }
  )
  default = {
    notebook_name      = "my-ml-nb"
    machine_type       = "n1-standard-8"
    gpu_type           = "NVIDIA_TESLA_T4"
    gpu_count          = 1
    image_family       = "common-cu113"
    install_gpu_driver = true
    boot_disk_size     = 200
    data_disk_size     = 500
  }
}

variable "gcs" {
  type = object(
    {
      name          = string
      location      = string
      force_destroy = bool
    }
  )
  default = {
    name          = "ml-bucket-terraform"
    location      = "us-central1"
    force_destroy = false
  }
}

variable "network_name" {
  description = "The network name for the Notebook instance"
  type        = string
  default     = "default"
}

variable "subnet_name" {
  description = "The subnet name for the Notebook instance"
  type        = string
  default     = "default"
}

variable "subnet_region" {
  description = "The region for the Notebook subnet"
  type        = string
  default     = "us-central1"
}
