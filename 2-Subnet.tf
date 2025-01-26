# SUBNETS and ROUTE TABLES

#AUSTRALIA SUBNETS and ROUTE TABLES

resource "aws_subnet" "AUS_SUBNET" {
  provider = aws.australia
  vpc_id     = aws_vpc.AUS_VPC.id
  cidr_block = "10.247.0.0/24"
  availability_zone = "ap-southeast-2a"
  tags = {
    Name = "AUS_SUBNET"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "australia-public-ap-southeast-2a" {
  provider                = aws.australia
  vpc_id                  = aws_vpc.AUS_VPC.id
  cidr_block              = "10.247.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "australia-public-ap-southeast-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "australia-public-ap-southeast-2b" {
  provider                = aws.australia
  vpc_id                  = aws_vpc.AUS_VPC.id
  cidr_block              = "10.247.2.0/24"
  availability_zone       = "ap-southeast-2b"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "australia-public-ap-southeast-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


#these are for private
resource "aws_subnet" "australia-private-ap-southeast-2a" {
  provider          = aws.australia
  vpc_id            = aws_vpc.AUS_VPC.id
  cidr_block        = "10.247.11.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name    = "australia-private-ap-southeast-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "australia-private-ap-southeast-2b" {
  provider          = aws.australia
  vpc_id            = aws_vpc.AUS_VPC.id
  cidr_block        = "10.247.12.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name    = "australia-private-ap-southeast-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_internet_gateway" "AUS_IGW" {
  provider = aws.australia  
  vpc_id     = aws_vpc.AUS_VPC.id

  tags = {
    Name = "AUS_IGW"
  }
}


# TOKYO Route Table
resource "aws_route_table" "AUS_route_table" {        # Route Table ID: aws_route_table.LONDON_route_table.id
  provider = aws.australia
  vpc_id = aws_vpc.AUS_VPC.id

  route {
    cidr_block = "10.240.1.0/24" # Route to TOKYO_VPC
    transit_gateway_id = aws_ec2_transit_gateway.aus-tgw.id
    }

  tags = {
    Name = "AUS_ROUTE"
  }
}

# Route to backend services VPC via Transit Gateway Attachment
resource "aws_route" "AUS_to_tokyo" {
  provider = aws.australia
  
  route_table_id         = aws_route_table.AUS_route_table.id
  destination_cidr_block = "10.240.0.0/16"  # Tokyo VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.aus_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.aus_attachment]
}



#####################################################################################################
# CALIFORNIA SUBNETS and ROUTE TABLES

resource "aws_subnet" "CA_SUBNET" {
  provider   = aws.california
  vpc_id     = aws_vpc.CA_VPC.id
  cidr_block = "10.244.0.0/24"
  availability_zone = "us-west-1a"
  tags = {
    Name = "CA_SUBNET"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "cali-public-us-west-1a" {
  provider                = aws.california
  vpc_id                  = aws_vpc.CA_VPC.id
  cidr_block              = "10.244.1.0/24"
  availability_zone       = "us-west-1a"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "cali-public-us-west-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "cali-public-us-west-1b" {
  provider                = aws.california
  vpc_id                  = aws_vpc.CA_VPC.id
  cidr_block              = "10.244.2.0/24"
  availability_zone       = "us-west-1b"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "cali-public-us-west-1b"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


#these are for private
resource "aws_subnet" "cali-private-us-west-1a" {
  provider          = aws.california
  vpc_id            = aws_vpc.CA_VPC.id
  cidr_block        = "10.244.11.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name    = "cali-private-us-west-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "cali-private-us-west-1b" {
  provider          = aws.california
  vpc_id            = aws_vpc.CA_VPC.id
  cidr_block        = "10.244.12.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name    = "cali-private-us-west-1b"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_internet_gateway" "CA_IGW" {     # Internet Gateway ID: aws_internet_gateway.CA_IGW.id
  provider   = aws.california
  vpc_id     = aws_vpc.CA_VPC.id

  tags = {
    Name = "CA_IGW"
  }
}


# CALIFORNIA Route Table
resource "aws_route_table" "CA_route_table" {   # Route Table ID: aws_route_table.CA_route_table.id
  provider = aws.california
  vpc_id = aws_vpc.CA_VPC.id

  route {
    cidr_block = "10.240.1.0/24" # Route to TOKYO_VPC
    transit_gateway_id = aws_ec2_transit_gateway.ca-tgw.id
    }

  tags = {
    Name = "CA_ROUTE"
  }
}


# Route to backend services VPC via Transit Gateway Attachment
resource "aws_route" "CA_to_tokyo" {
  provider = aws.california
  
  route_table_id         = aws_route_table.CA_route_table.id
  destination_cidr_block = "10.240.0.0/16"  # Replace with tokyo VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.ca_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.ca_attachment]
}


/****************************************************************************************************
# Optional: Route to backend services VPC via Transit Gateway Attachment
# Route to LONDON_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_london" {
  provider               = aws.california
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.241.0.0/16"  # Replace with actual VPC2 CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to SAO_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_sao" {
  provider               = aws.california
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.243.0.0/16"  # Replace with actual VPC3 CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}



# Route to CA_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_california" {
  provider               = aws.california
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.244.0.0/16"  # California CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}

************************************************************************************************************/


# Hong Kong Subnets and Route Tables


resource "aws_subnet" "HK_SUBNET" {
  provider   = aws.hongkong
  vpc_id     = aws_vpc.HK_VPC.id 
  cidr_block = "10.245.0.0/24"
  availability_zone = "ap-east-1a"
  tags = {
    Name = "HK_SUBNET"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "hk-public-ap-east-1a" {
  provider                = aws.hongkong
  vpc_id                  = aws_vpc.HK_VPC.id
  cidr_block              = "10.245.1.0/24"
  availability_zone       = "ap-east-1a"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "hk-public-ap-east-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "hk-public-ap-east-1b" {
  provider                = aws.hongkong
  vpc_id                  = aws_vpc.HK_VPC.id
  cidr_block              = "10.245.2.0/24"
  availability_zone       = "ap-east-1b"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "hk-public-ap-east-1b"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


#these are for private
resource "aws_subnet" "hk-private-ap-east-1a" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.HK_VPC.id
  cidr_block        = "10.245.11.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name    = "hk-private-ap-east-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "hk-private-ap-east-1b" {
  provider          = aws.hongkong
  vpc_id            = aws_vpc.HK_VPC.id
  cidr_block        = "10.245.12.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name    = "hk-private-ap-east-1b"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_internet_gateway" "HK_IGW" {     # Internet Gateway ID: aws_internet_gateway.CA_IGW.id
  provider   = aws.hongkong
  vpc_id     = aws_vpc.HK_VPC.id

  tags = {
    Name = "HK_IGW"
  }
}


# Hong Kong Route Table
resource "aws_route_table" "HK_route_table" {   # Route Table ID: aws_route_table.CA_route_table.id
  provider = aws.hongkong
  vpc_id = aws_vpc.HK_VPC.id

  route {
    cidr_block = "10.240.1.0/24" # Route to TOKYO_VPC
    transit_gateway_id = aws_ec2_transit_gateway.hk-tgw.id
    }

  tags = {
    Name = "HK_ROUTE"
  }
}


# Route to backend services VPC via Transit Gateway Attachment
resource "aws_route" "HK_to_tokyo" {
  provider = aws.hongkong
  
  route_table_id         = aws_route_table.HK_route_table.id
  destination_cidr_block = "10.240.0.0/16"  # Replace with tokyo VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.hk_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.hk_attachment]
}


/*
Optional: Route to backend services VPC via Transit Gateway Attachment
# Route to LONDON_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_london" {
  provider               = aws.hongkong
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.241.0.0/16"  # Replace with actual VPC2 CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to SAO_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_sao" {
  provider               = aws.hongkong
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.243.0.0/16"  # Replace with actual VPC3 CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to HK_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_hongkong" {
  provider               = aws.hongkong
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.245.0.0/16"  # hongkong CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}
*/
###############################################################################################################


# LONDON SUBNETS and ROUTE TABLES


resource "aws_subnet" "LONDON_SUBNET" {
  provider = aws.london
  vpc_id     = aws_vpc.LONDON_VPC.id
  cidr_block = "10.241.0.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name = "LONDON_SUBNET"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "london-public-eu-west-2a" {
  provider                = aws.london
  vpc_id                  = aws_vpc.LONDON_VPC.id
  cidr_block              = "10.241.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "london-public-eu-west-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "london-public-eu-west-2b" {
  provider                = aws.london
  vpc_id                  = aws_vpc.LONDON_VPC.id
  cidr_block              = "10.241.2.0/24"
  availability_zone       = "eu-west-2b"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "london-public-eu-west-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


#these are for private
resource "aws_subnet" "london-private-eu-west-2a" {
  provider          = aws.london
  vpc_id            = aws_vpc.LONDON_VPC.id
  cidr_block        = "10.241.11.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name    = "london-private-eu-west-2a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "london-private-eu-west-2b" {
  provider          = aws.london
  vpc_id            = aws_vpc.LONDON_VPC.id
  cidr_block        = "10.241.12.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name    = "london-private-eu-west-2b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_internet_gateway" "LONDON_IGW" {
  provider = aws.london  
  vpc_id     = aws_vpc.LONDON_VPC.id

  tags = {
    Name = "LONDON_IGW"
  }
}


# TOKYO Route Table
resource "aws_route_table" "LONDON_route_table" {        # Route Table ID: aws_route_table.LONDON_route_table.id
  provider = aws.london
  vpc_id = aws_vpc.LONDON_VPC.id

  route {
    cidr_block = "10.240.1.0/24" # Route to TOKYO_VPC
    transit_gateway_id = aws_ec2_transit_gateway.london-tgw.id
    }

  tags = {
    Name = "LONDON_ROUTE"
  }
}


resource "aws_route" "LONDON_to_tokyo" {
  provider = aws.london
  
  route_table_id         = aws_route_table.LONDON_route_table.id
  destination_cidr_block = "10.240.0.0/16"  # Replace with tokyo VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.london_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.london_attachment]
}

resource "aws_route" "LONDON_to_sao" {
  provider = aws.london
  
  route_table_id         = aws_route_table.LONDON_route_table.id
  destination_cidr_block = "10.242.0.0/16"  # Replace with actual Sao Paulo VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.london_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.london_attachment]
}


/*
Optional Routs here:
# Route to CA_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_california" {
  provider               = aws.california
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.244.0.0/16"  # California CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}
***************************************************************************************************/


# New York Subnets and Route Tables


resource "aws_subnet" "NY_SUBNET" {
  provider = aws.newyork
  vpc_id     = aws_vpc.NY_VPC.id
  cidr_block = "10.246.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "NY_SUBNET"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "newyork-public-us-east-1a" {
  provider                = aws.newyork
  vpc_id                  = aws_vpc.NY_VPC.id
  cidr_block              = "10.246.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "newyork-public-us-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "newyork-public-us-east-1b" {
  provider                = aws.newyork
  vpc_id                  = aws_vpc.NY_VPC.id
  cidr_block              = "10.246.2.0/24"
  availability_zone       = "us-east-1b"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "newyork-public-us-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


#these are for private
resource "aws_subnet" "newyork-private-us-east-1a" {
  provider          = aws.newyork
  vpc_id            = aws_vpc.NY_VPC.id
  cidr_block        = "10.246.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = "newyork-private-us-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "newyork-private-us-east-1b" {
  provider          = aws.newyork
  vpc_id            = aws_vpc.NY_VPC.id
  cidr_block        = "10.246.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "newyork-private-us-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_internet_gateway" "NY_IGW" {
  provider = aws.newyork  
  vpc_id     = aws_vpc.NY_VPC.id

  tags = {
    Name = "NY_IGW"
  }
}


# TOKYO Route Table
resource "aws_route_table" "NY_route_table" {        # Route Table ID: aws_route_table.LONDON_route_table.id
  provider = aws.newyork
  vpc_id = aws_vpc.NY_VPC.id

  route {
    cidr_block = "10.240.1.0/24" # Route to TOKYO_VPC
    transit_gateway_id = aws_ec2_transit_gateway.ny-tgw.id
    }

  tags = {
    Name = "NY_ROUTE"
  }
}

# Route to backend services VPC via Transit Gateway Attachment
resource "aws_route" "NY_to_tokyo" {
  provider = aws.newyork
  
  route_table_id         = aws_route_table.NY_route_table.id
  destination_cidr_block = "10.240.0.0/16"  # Replace with tokyo VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.ny_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.ny_attachment]
}




/*
# Optional connections here:
resource "aws_route" "NY_to_sao" {
  provider = aws.newyork
  
  route_table_id         = aws_route_table.NY_route_table.id
  destination_cidr_block = "10.246.0.0/16"  # NY VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.ny_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.ny_attachment]
}
*/

/*

# Route to CA_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_california" {
  provider               = aws.california
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.244.0.0/16"  # California CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}

***************************************************************************************************/


# SAO PAULO SUBNETS and ROUTE TABLES


resource "aws_subnet" "SAO_SUBNET" {
  provider = aws.saopaulo
  
  vpc_id     = aws_vpc.SAO_VPC.id
  cidr_block = "10.243.0.0/24"
  availability_zone = "sa-east-1a"
  #map_public_ip_on_launch = true
  tags = {
    Name = "SAO_SUBNET"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "sao-public-sa-east-1a" {
  provider                = aws.saopaulo
  vpc_id                  = aws_vpc.SAO_VPC.id
  cidr_block              = "10.243.1.0/24"
  availability_zone       = "sa-east-1a"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "sao-public-sa-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "sao-public-sa-east-1b" {
  provider                = aws.saopaulo
  vpc_id                  = aws_vpc.SAO_VPC.id
  cidr_block              = "10.243.2.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "sao-public-sa-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}

#these are for private
resource "aws_subnet" "sao-private-sa-east-1a" {
  provider          = aws.saopaulo
  vpc_id            = aws_vpc.SAO_VPC.id
  cidr_block        = "10.243.11.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name    = "sao-private-sa-east-1a"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "sao-private-sa-east-1b" {
  provider          = aws.saopaulo
  vpc_id            = aws_vpc.SAO_VPC.id
  cidr_block        = "10.243.12.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name    = "sao-private-sa-east-1b"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


resource "aws_internet_gateway" "SAO_IGW" {
  provider   = aws.saopaulo  
  vpc_id     = aws_vpc.SAO_VPC.id

  tags = {
    Name = "SAO_IGW"
  }
}


# Sao Paulo Route Table
resource "aws_route_table" "SAO_route_table" {        # Route Table ID: aws_route_table.SAO_route_table.id
  provider = aws.saopaulo
  vpc_id = aws_vpc.SAO_VPC.id

  route {
    cidr_block = "10.240.1.0/24" # Route to TOKYO_VPC
    transit_gateway_id = aws_ec2_transit_gateway.sao-tgw.id
    }

  tags = {
    Name = "SAO_ROUTE"
  }
}


# Route to backend services VPC via Transit Gateway Route Table
resource "aws_route" "SAO_to_london" {
  provider = aws.saopaulo
  
  route_table_id         = aws_route_table.SAO_route_table.id
  destination_cidr_block = "10.241.0.0/16"  # Replace with actual london VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.sao_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.sao_attachment]
}

resource "aws_route" "SAO_to_tokyo" {
  provider = aws.saopaulo
  
  route_table_id         = aws_route_table.SAO_route_table.id
  destination_cidr_block = "10.240.0.0/16"  # Replace with actual web_app VPC CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.sao_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.sao_attachment]
}





# Optional Routes here:




#Tokyo Subnets and Route Tables 


resource "aws_subnet" "TOKYO_SUBNET" {
  vpc_id     = aws_vpc.TOKYO_VPC.id 
  cidr_block = "10.240.0.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "TOKYO_SUBNET"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "tokyo-public-ap-northeast-1a" {
  vpc_id                  = aws_vpc.TOKYO_VPC.id
  cidr_block              = "10.240.1.0/24"
  availability_zone       = "ap-northeast-1a"
  #map_public_ip_on_launch = true

  tags = {
    Name    = "tokyo-public-ap-northeast-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_subnet" "tokyo-public-ap-northeast-1c" {
  vpc_id                  = aws_vpc.TOKYO_VPC.id
  cidr_block              = "10.240.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "tokyo-public-ap-northeast-1c"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


#these are for private
resource "aws_subnet" "tokyo-private-ap-northeast-1a" {
  vpc_id            = aws_vpc.TOKYO_VPC.id
  cidr_block        = "10.240.11.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name    = "tokyo-private-ap-northeast-1a"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}

# Syslog Server
resource "aws_subnet" "tokyo-private-ap-northeast-1c" {
  vpc_id            = aws_vpc.TOKYO_VPC.id
  cidr_block        = "10.240.43.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name    = "tokyo-private-ap-northeast-1c"
    Service = "syslog"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}



#Database Server - Aurora MySQL
resource "aws_subnet" "tokyo-private-ap-northeast-1d" {
  vpc_id            = aws_vpc.TOKYO_VPC.id
  cidr_block        = "10.240.54.0/24"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name    = "tokyo-private-ap-northeast-1d"
    Service = "database"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}




# TOKYO IGW
resource "aws_internet_gateway" "TOKYO_IGW" {     # Internet Gateway ID: aws_internet_gateway.TOKYO_IGW.id
  vpc_id     = aws_vpc.TOKYO_VPC.id

  tags = {
    Name = "TOKYO_IGW"
  }
}

# TOKYO Route Table
resource "aws_route_table" "TOKYO_route_table" {        # Route Table ID: aws_route_table.TOKYO_ROUTE.id
  vpc_id = aws_vpc.TOKYO_VPC.id

  route {
    cidr_block = "10.241.1.0/24" # Route to LONDON_VPC
    transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id
    }

  tags = {
    Name = "TOKYO_ROUTE"
  }
}


/*
resource "aws_default_route_table" "TOKYO_route_table" {    # Route Table ID: aws_route_table.TOKYO_route_table.id
  default_route_table_id = aws_vpc.TOKYO_VPC.default_route_table_id

  tags = {
    Name = "TOKYO_ROUTE"
  }
}


resource "aws_route" "TOKYO_route" {
  route_table_id         = aws_route_table.TOKYO_route_table_table.id
  
  
  #destination_cidr_block = "0.0.0.0/0"    # Route all traffic to the Internet Gateway
  #gateway_id             = aws_internet_gateway.TOKYO_IGW.id

  depends_on = [aws_vpc.TOKYO_VPC]  # Ensure VPC is created before route
}
*/
