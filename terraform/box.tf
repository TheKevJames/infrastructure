data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "awsbox" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.small"
    associate_public_ip_address = true

    availability_zone = "us-west-2b"
    subnet_id = "${aws_subnet.s1.id}"

    key_name = "${aws_key_pair.kp.key_name}"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]

    provisioner "file" {
        source = "conf/crontab.root"
        destination = "/tmp/crontab.root"

        connection {
            user = "ubuntu"
            key_file = "~/.ssh/id_rsa"
            timeout = "1m"
        }
    }

    provisioner "file" {
        source = "conf/crontab.user"
        destination = "/tmp/crontab.user"

        connection {
            user = "ubuntu"
            key_file = "~/.ssh/id_rsa"
            timeout = "1m"
        }
    }

    provisioner "remote-exec" {
        inline = [
            "sudo touch /etc/udev/rules.d/40-vm-hotadd.rules",

            "sudo apt-get update",
            "sudo apt-get install -y letsencrypt",

            # TODO: figure out why this hangs
            # "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
            "sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'",
            "sudo apt-get update",
            "sudo apt-get install -y --allow-unauthenticated docker-engine",
            "sudo usermod -aG docker ubuntu",

            "sudo curl -L -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.10.0/docker-compose-Linux-x86_64",
            "sudo chmod a+x /usr/local/bin/docker-compose",

            "sudo crontab /tmp/crontab.root",
            "crontab /tmp/crontab.user"
        ]

        connection {
            user = "ubuntu"
            key_file = "~/.ssh/id_rsa"
            timeout = "1m"
        }
    }

    tags {
        Name = "awsbox"
    }
}
