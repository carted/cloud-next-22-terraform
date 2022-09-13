variable "gcp" {
  type = object(
    {
      project_id = string
      location   = string
      region     = string
    }
  )
  default = {
    project_id = "my-gcp-project"
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
    }
  )
  default = {
    notebook_name      = "my-ml-nb"
    machine_type       = "n1-standard-8"
    gpu_type           = "NVIDIA_TESLA_T4"
    gpu_count          = 1
    image_family       = "common-cu113"
    install_gpu_driver = true
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
    name          = "my-ml-bucket"
    location      = "us-central1-a"
    force_destroy = false
  }
}
