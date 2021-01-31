data "google_compute_default_service_account" "default" {}

resource "google_compute_address" "poe" {
  name   = "poe"
  region = "us-west1"
}

# gcloud compute instances create-with-container poe \
#   --container-image thekevjames/poe:root \
#   --tags http-server \
#   --container-env=PORT=80 \
#   --container-env=SECRET_KEY_BASE=${SECRET_KEY_BASE} \
#   --machine-type=f1-micro \
#   --zone=us-west1-a \
#   --scopes=logging-write,monitoring-write,service-management,service-control,trace \
#   --address=1.2.3.4
resource "google_compute_instance" "poe" {
  name         = "poe"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "projects/cos-cloud/global/images/family/cos-stable"
      type  = "pd-standard"
      size  = "10"
    }
  }

  enable_display = false

  metadata = {
    # TODO: seems this toggles between two formats...
    # # DISCLAIMER:
    # # This container declaration format is not a public API and may change without
    # # notice. Please use gcloud command-line tool or Google Cloud Console to run
    # # Containers on Google Compute Engine.
    #
    # spec:
    #   containers:
    #   - env:
    #       - name: PORT
    #         value: '80'
    #       - name: SECRET_KEY_BASE
    #         value: ${var.poe_secret_key}
    #     image: thekevjames/poe:latest
    #     name: poe
    #     securityContext:
    #       privileged: false
    #     stdin: false
    #     tty: false
    #     volumeMounts: []
    #   restartPolicy: Always
    #   volumes: []
    gce-container-declaration = <<EOF
spec:
  containers:
    - name: poe
      image: 'thekevjames/poe:latest'
      env:
        - name: PORT
          value: '80'
        - name: SECRET_KEY_BASE
          value: ${var.poe_secret_key}
      stdin: false
      tty: false
  restartPolicy: Always

# This container declaration format is not public API and may change without notice. Please
# use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine.
EOF
    google-logging-enabled    = "true"
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.poe.address
    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

  service_account {
    email = data.google_compute_default_service_account.default.email
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  timeouts {}

  lifecycle {
    # TODO: figure out a way to allow terraform to ignore *only* the image hash
    ignore_changes = [labels, metadata.gce-container-declaration]
  }
}

resource "cloudflare_record" "poe" {
  zone_id = var.zone
  name    = "poe"
  type    = "A"

  proxied = true

  value = google_compute_instance.poe.network_interface.0.access_config.0.nat_ip
}
