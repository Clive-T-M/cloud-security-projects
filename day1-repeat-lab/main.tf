resource "aws_vpc" "lab_vpc" {
	cidr_block           = "10.0.0.0/16"
	enable_dns_hostnames = true
	enable_dns_support   = true
	
	tags = {
	  Name     = "repeat-lab-vpc"
	  Purpose  = "Day 1 repeat - deeper understanding"
	
	}

}

resource "aws_subnet" "private_subnet" {
	vpc_id             = aws_vpc.lab_vpc.id
	cidr_block         = "10.0.1.0/24"
	availability_zone  = "us-east-1a"

	tags = {
	 name          = "repeat-private-subnet"
	  Risk_Control = "No route to Internet Gateway"

 }

}

resource "aws_security_group" "restricted_sg" {
	name         = "repeat-restricted-sg"
	description  = "Default deny all inbound - Day 1 repeat"
	vpc_id       = aws_vpc.lab_vpc.id


	egress {
	 from_port    = 0
	 to_port      = 0
	 protocol     = "-1"
	 cidr_blocks  = ["0.0.0.0/0"]
	 description  = "Allow all outbound traffic"
 }
	tags = {
	name           = "no-inbound-sg"
	Risk_Control   = "Zero attack surface - no ports open"
 }

}

resource "aws_instance" "secure_instance" {
	ami            = "ami-0c7217cdde317cfec"
	instance_type  = "t3.micro"
	subnet_id      = aws_subnet.private_subnet.id
	vpc_security_group_ids = [aws_security_group.restricted_sg.id]

	tags = {
	Name       = "repeat-secure-instance"
	Risk_level = "Low - Private, no inbound, least privilage"

  }

}
