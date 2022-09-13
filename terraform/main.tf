locals {
  image_project = "deeplearning-platform-release"
}

data "google_compute_network" "vm_network" {
  project = var.gcp.project_id
  name    = var.network_name
}

data "google_compute_subnetwork" "vm_subnetwork" {
  project = var.gcp.project_id
  name    = var.subnet_name
  region  = var.subnet_region
}


resource "google_notebooks_instance" "notebook_instance" {
  project      = var.gcp.project_id
  name         = var.notebook.notebook_name
  machine_type = var.notebook.machine_type
  location     = var.gcp.location

  network = data.google_compute_network.vm_network.id
  subnet  = data.google_compute_subnetwork.vm_subnetwork.id

  vm_image {
    project      = local.image_project
    image_family = var.notebook.image_family
  }

  accelerator_config {
    type       = var.notebook.gpu_type
    core_count = var.notebook.gpu_count
  }

  install_gpu_driver = var.notebook.install_gpu_driver
  boot_disk_size_gb  = var.notebook.boot_disk_size
  data_disk_size_gb  = var.notebook.data_disk_size

  metadata = { "startup-script" : file("startup.sh") }
}

resource "google_storage_bucket" "default" {
  project                     = var.gcp.project_id
  name                        = var.gcs.name
  location                    = var.gcs.location
  storage_class               = "REGIONAL"
  force_destroy               = var.gcs.force_destroy
  uniform_bucket_level_access = true
}