resource "aws_vpc" "SAO_VPC" {
  provider = aws.saopaulo  
  cidr_block       = "10.243.0.0/16"
  Service = "application1"
  access = "Public"
  Owner = "Blackneto"
  Planet = "Genosha"
  location = "New Taa"
  fbi = "fit feminine and friendly"
  cia = "men of Zion"
  zone = "Production"
  availability_zone = "A"

  tags = {
    Name = "SAO_VPC"
  }
}
