resource "aws_vpc" "NY_VPC" {
  provider = aws.newyork  
  cidr_block       = "10.246.0.0/16"

  tags = {
    Name = "NY_VPC"
    Service = "application1"
    access = "Public"
    Owner = "Blackneto"
    Planet = "Taa2"
    location = "New Taa"
    fbi = "fit feminine and friendly"
    cia = "men of Zion"
    zone = "Production"
    availability_zone = "A"
  }
}
