resource "google_service_account" "app-poe" {
  account_id   = "app-poe"
  display_name = "App (poe)"
}

resource "google_compute_instance" "poe" {
  name         = "poe"
  machine_type = "f1-micro"
  zone         = "us-west3-a"

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "projects/cos-cloud/global/images/family/cos-stable"
      type  = "pd-standard"
      size  = "30"
    }
  }

  metadata = {
    gce-container-declaration = <<EOF
spec:
  containers:
    - name: poe
      image: 'thekevjames/poe:latest'
      env:
        - name: SECRET_KEY_BASE
          value: ${var.poe_secret_key}
      stdin: false
      tty: false
  restartPolicy: Always

# This container declaration format is not public API and may change without notice. Please
# use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine.
EOF
    google-logging-enabled    = "true"
    google-monitoring-enabled = "true"
    user-data                 = <<EOF
write_files:
- path: /var/lib/docker/daemon.json
  permissions: 0644
  owner: root
  content: |
    {
      "live-restore": true,
      "storage-driver": "overlay2",
      "log-opts": {
        "max-size": "1024m"
      }
    }

runcmd:
- iptables -I INPUT 1 -p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
- systemctl daemon-reload
EOF
  }

  network_interface {
    network = "default"
    access_config {}
  }

  service_account {
    email  = google_service_account.app-poe.email
    scopes = []
  }
}
