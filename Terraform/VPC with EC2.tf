// Create EC2

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "terraform-demo" {
  ami = "ami-07dc0b5cad2999c28"
  instance_type = "t2.micro"
  key_name = "ansible-key"
  associate_public_ip_address = true
subnet_id = aws_subnet.terraform-demo-subnet.id
vpc_security_group_ids = [aws_security_group.terraform-demo-vpc-sg.id]
}


// Create VPC
  resource "aws_vpc" "terraform-demo-vpc" {
       cidr_block = "10.10.0.0/16"
       tags = {
        Name = "terraform-demo-vpc"
     }
   }


// Create subnets

resource "aws_subnet" "terraform-demo-subnet" {
  vpc_id     = aws_vpc.terraform-demo-vpc.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-demo-subnet"
  }
}

// Create Internet Gateway

resource "aws_internet_gateway" "terraform-demo-igw" {
    vpc_id = aws_vpc.terraform-demo-vpc.id
    tags = {
      Name = "terraform-demo-igw"
    }
}

// Create a route table 

resource "aws_route_table" "terraform-demo-rt" {
    vpc_id = aws_vpc.terraform-demo-vpc.id


    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform-demo-igw.id
    }

    tags = {
      Name = "terraform-demo-rt"
    }
}

// Associate subnet with route table

resource "aws_route_table_association" "terraform-demo-rta" {
    subnet_id = aws_subnet.terraform-demo-subnet.id
    route_table_id = aws_route_table.terraform-demo-rt.id

}

// Create Security Group

resource "aws_security_group" "terraform-demo-vpc-sg" {
  name        = "terraform-vpc-sg"
  vpc_id      = aws_vpc.terraform-demo-vpc.id

  ingress {
    
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}


