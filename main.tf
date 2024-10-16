provider "google" {
  project     = "gcp-learners-123"
  region      = "us-central1"
  credentials = file("JENKINS-AUTH")

}

resource "google_compute_instance" "default" {
  name         = "my-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-c"
  tags = ["hr", "dev"]


  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
