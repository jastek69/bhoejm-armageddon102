resource "aws_vpc" "TOKYO_VPC" {              # VPC ID: aws_vpc.TOKYO_VPC.id  
  cidr_block       = "10.240.0.0/16"
  
  tags = {
    Name = "TOKYO_VPC"
    Service = "application1"
    access = "Public"
    Owner = "Blackneto"
    Planet = "Taa"
    location = "New Genosha"
    fbi = "fit feminine and friendly"
    cia = "men of Zion"
    zone = "Production"
    availability_zone = "A"
  }
}
