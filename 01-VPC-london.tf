resource "aws_vpc" "LONDON_VPC" {
  provider = aws.london  
  cidr_block       = "10.241.0.0/16"  

  tags = {
    Name = "LONDON_VPC"
    Service = "application1"
    access = "Public"
    Owner = "Blackneto"
    Planet = "Taa 2"
    location = "Taa"
    fbi = "fit feminine and friendly"
    cia = "men of Zion"
    zone = "Production"
    availability_zone = "A"
  }
}
