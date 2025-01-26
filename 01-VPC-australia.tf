resource "aws_vpc" "AUS_VPC" {
  provider = aws.australia  
  cidr_block       = "10.247.0.0/16"

  tags = {
    Name = "AUS_VPC"
    Service = "application1"
    access = "Public"
    Owner = "Blackneto"
    Planet = "Genosha"
    location = "New Wakanda"
    fbi = "fit feminine and friendly"
    cia = "men of Zion"
    zone = "Production"
    availability_zone = "A"
  }
}
