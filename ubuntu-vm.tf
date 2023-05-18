provider "google" {
  credentials = file("path/to/your/credentials.json")
  project     = "1064630545375"
  region      = "us-central1"
}

resource "google_compute_instance" "ubuntu_instance" {
  name         = "ubuntu-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Hello, World! This is a startup script."
  EOT
}
