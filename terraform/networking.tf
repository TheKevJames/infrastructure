resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    instance_tenancy = "default"
    tags {
        Name = "vpc"
    }
}

resource "aws_subnet" "s0" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.0.0.0/20"

    availability_zone = "us-west-2a"
    tags {
        Name = "0"
    }
}

resource "aws_subnet" "s1" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.0.16.0/20"

    availability_zone = "us-west-2b"
    tags {
        Name = "1"
    }
}

resource "aws_subnet" "s2" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.0.32.0/20"

    availability_zone = "us-west-2c"
    tags {
        Name = "2"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vpc.id}"

    tags {
        Name = "igw"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }

    tags {
        Name = "rt"
    }
}

resource "aws_route_table_association" "rta0" {
    subnet_id = "${aws_subnet.s0.id}"
    route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "rta1" {
    subnet_id = "${aws_subnet.s1.id}"
    route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "rta2" {
    subnet_id = "${aws_subnet.s2.id}"
    route_table_id = "${aws_route_table.rt.id}"
}
