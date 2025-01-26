resource "aws_vpc" "HK_VPC" {              # VPC ID: aws_vpc.HK_VPC.id  
  provider         = aws.hongkong
  cidr_block       = "10.245.0.0/16"
  
  tags = {
    Name = "HK_VPC"
    Service = "application1"
    access = "Public"
    Owner = "Blackneto"
    Planet = "Taa"
    location = "Zenn La"
    fbi = "fit feminine and friendly"
    cia = "men of Zion"
    zone = "Production"
    availability_zone = "A"
  }
}
