resource "aws_security_group" "web" {
    vpc_id = "${aws_vpc.vpc.id}"
    name = "web"
    description = "web server defaults"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "web"
    }
}

resource "aws_key_pair" "kp" {
    key_name = "kevin-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQSumbv08pNDe1bQhe560+tq5Iffv9eGh0bC5CYpp/fP0MLq5w7VGaSJLn4b5ANqKWvMiSixMtr+WWFXdYbaar1BrHuAMY83fXVUvCC7DIGJzF6fCVRs16ZkvozX53hb/tFJ2ea0hG4mAGnqljnB70Fk4EBfF/Tp9WKdHVqYulmMBbW2Ty0QEj1gE9DeL5V68o7b7BDb3wvBI0dxw0OEfuDtpKGAmI1Zz2vW4LefUNAca6yB518Q0WLnLiQ3iau0rg8Kl5EYgLUno94Ox2ohi8hbCntb/tCBGG8Xvnhz42gsbgkE5l1OZI+V1KxzSSiHbgMJxjVPcJL/eoFxAh0IiB KevinJames@thekev.in"
}
