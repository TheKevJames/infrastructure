resource "google_compute_address" "gcebox" {
    name = "gcebox-ip"
}

resource "google_compute_instance" "gcebox" {
    name = "gcebox"
    zone = "${var.google_zone}"
    tags = ["http-server", "https-server"]

    machine_type = "${var.machine_type}"
    boot_disk {
        initialize_params {
            image = "${var.image}"
        }
    }

    network_interface {
        network = "default"
        access_config {
            nat_ip = "${google_compute_address.gcebox.address}"
        }
    }
}
