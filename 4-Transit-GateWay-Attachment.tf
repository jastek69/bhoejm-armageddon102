# AWS Transit Gateway Inter-Region peering
# Transit Gateway Attachment
# Creating attachments for each VPC to Tokyo Transit Gateway
# Creating Peering Connection for inter-region peering connections to Tokyo Transit Gateway
################################################################################################

# TRANSIT GATEWAY ATTACHMENTS


# Attach TOKYO_VPC to the Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo_attachment" {
  # ID of the Transit Gateway
  transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id
  subnet_ids = [
    aws_subnet.TOKYO_SUBNET.id  # Reference the created subnet ID
  ]
  # VPC ID to be attached
  vpc_id = aws_vpc.TOKYO_VPC.id

  # Optional tags for identification
  tags = {
    Name = "Tokyo VPC Attachment"
  }
}


# Attach LONDON VPC to the Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "london_attachment" {
  provider = aws.london

  # ID of the Transit Gateway
  transit_gateway_id = aws_ec2_transit_gateway.london-tgw.id
  subnet_ids = [
    aws_subnet.LONDON_SUBNET.id  # Reference the created subnet ID
  ]
  # VPC ID to be attached
  vpc_id = aws_vpc.LONDON_VPC.id

  # Optional tags for identification
  tags = {
    Name = "London VPC Attachment"
  }
}

# Attach Sao Paulo VPC to the Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "sao_attachment" {
  provider = aws.saopaulo

  # ID of the Transit Gateway
  transit_gateway_id = aws_ec2_transit_gateway.sao-tgw.id
  subnet_ids = [
    aws_subnet.SAO_SUBNET.id  # Reference the created subnet ID
  ]
  # VPC ID to be attached
  vpc_id = aws_vpc.SAO_VPC.id

  # Optional tags for identification
  tags = {
    Name = "Sao Paulo VPC Attachment"
  }
}


# Attach California VPC to the Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "ca_attachment" {
  provider = aws.california

  # ID of the Transit Gateway
  transit_gateway_id = aws_ec2_transit_gateway.ca-tgw.id
  subnet_ids = [
    aws_subnet.CA_SUBNET.id  # Reference the created subnet ID
  ]
  # VPC ID to be attached
  vpc_id = aws_vpc.CA_VPC.id

  # Optional tags for identification
  tags = {
    Name = "California VPC Attachment"
  }
}


# Attach Hong Kong VPC to the Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "hk_attachment" {
  provider = aws.hongkong

  # ID of the Transit Gateway
  transit_gateway_id = aws_ec2_transit_gateway.hk-tgw.id
  subnet_ids = [
    aws_subnet.HK_SUBNET.id  # Reference the created subnet ID
  ]
  # VPC ID to be attached
  vpc_id = aws_vpc.HK_VPC.id

  # Optional tags for identification
  tags = {
    Name = "Hong Kong VPC Attachment"
  }
}



# Attach New York VPC to the Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "ny_attachment" {
  provider = aws.newyork

  # ID of the Transit Gateway
  transit_gateway_id = aws_ec2_transit_gateway.ny-tgw.id
  subnet_ids = [
    aws_subnet.NY_SUBNET.id  # Reference the created subnet ID
  ]
  # VPC ID to be attached
  vpc_id = aws_vpc.NY_VPC.id

  # Optional tags for identification
  tags = {
    Name = "New York VPC Attachment"
  }
}


# Attach Australia VPC to the Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "aus_attachment" {
  provider = aws.australia

  # ID of the Transit Gateway
  transit_gateway_id = aws_ec2_transit_gateway.aus-tgw.id
  subnet_ids = [
    aws_subnet.AUS_SUBNET.id  # Reference the created subnet ID
  ]
  # VPC ID to be attached
  vpc_id = aws_vpc.AUS_VPC.id

  # Optional tags for identification
  tags = {
    Name = "Australia VPC Attachment"
  }
}



###############################################################################################
# PEERING ATTACHMENTS
# 1 - Resource - Create the inter-region Peering Attachment from Tokyo to London.
# The peer_transit_gateway_id must reference a Transit Gateway from a different region,
# and the peer_region must align with the region of the peer_transit_gateway_id.
# tgw_tokyo_source_peering: peer_region = "eu-west-2" should match the region of the london-tgw.
# 
# 2 - Data - peering attachment data for the London Transit Gateway.
# This will create two peerings: one for Tokyo (Creator)
#
# 3 - Accepter - and one for London (Acceptor).
###############################################################################################


# Tokyo VPC to London VPC
resource "aws_ec2_transit_gateway_peering_attachment" "tgw_tokyo_source_peering" {
  transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id # TOKYO Transit Gateway ID
  peer_transit_gateway_id = aws_ec2_transit_gateway.london-tgw.id # London Transit Gateway ID to Peer WITH
  peer_region = "eu-west-2"  # London region to Peer WITH  

  tags = {
    Name = "Tokyo London Peering Attachment"
    Side = "Creator"
  }
}

# Transit Gateway 2's peering request needs to be accepted.
# So, we fetch the Peering Attachment that is created for the Gateway 2.
data "aws_ec2_transit_gateway_peering_attachment" "london_accepter_peering_data" {
  provider = aws.london
  depends_on = [aws_ec2_transit_gateway_peering_attachment.tgw_tokyo_source_peering]
  filter {
    name   = "transit-gateway-id"
    values = [aws_ec2_transit_gateway.london-tgw.id]
  }
}

# Accept the Attachment Peering request.
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "london_accepter" {
  provider = aws.london
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_peering_attachment.london_accepter_peering_data.id
  tags = {
    Name = "terraform-london-tgw-peering-accepter"
    Side = "Acceptor"
  }
}


#######################################################################################################
# SAO PAULO TO TOKYO PEERING
resource "aws_ec2_transit_gateway_peering_attachment" "tgw_tokyo_sao_source_peering" {
  # provider = aws.saopaulo
  transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id
  peer_transit_gateway_id = aws_ec2_transit_gateway.sao-tgw.id # Sao Paulo Transit Gateway ID to Peer WITH
  peer_region = "sa-east-1"  # Sao Paulo region to Peer WITH  

  tags = {
    Name = "Tokyo Sao Peering Attachment"
    Side = "Creator"
  }
}


# Transit Gateway 2's peering request needs to be accepted.
# So, we fetch the Peering Attachment that is created for the Gateway 3 - Sao Paulo.
data "aws_ec2_transit_gateway_peering_attachment" "sao_accepter_peering_data" {
  provider = aws.saopaulo
  depends_on = [aws_ec2_transit_gateway_peering_attachment.tgw_tokyo_sao_source_peering]
  filter {
    name   = "transit-gateway-id"
    values = [aws_ec2_transit_gateway.sao-tgw.id]
  }
}

# Accept the Attachment Peering request.
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "sao_accepter" {
  provider = aws.saopaulo
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_peering_attachment.sao_accepter_peering_data.id
  tags = {
    Name = "terraform-sao-tgw-peering-accepter"
    Side = "Acceptor"
  }
}


###############################################################################################################
# HONG KONG TO TOKYO PEERING
resource "aws_ec2_transit_gateway_peering_attachment" "tgw_tokyo_hk_source_peering" {
  
  transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id  # Tokyo TGW ID
  peer_transit_gateway_id = aws_ec2_transit_gateway.hk-tgw.id # Hong Kong Transit Gateway ID to Peer WITH
  peer_region = "ap-east-1"  # Hong Kong region to Peer WITH  

  tags = {
    Name = "Tokyo Hong Kong Peering Attachment"
    Side = "Creator"
  }
}


# Transit Gateway Hong Kong peering request needs to be accepted.
# So, we fetch the Peering Attachment that is created for the Gateway 3 - Sao Paulo.
data "aws_ec2_transit_gateway_peering_attachment" "hk_accepter_peering_data" {
  provider = aws.hongkong
  depends_on = [aws_ec2_transit_gateway_peering_attachment.tgw_tokyo_hk_source_peering]
  filter {
    name   = "transit-gateway-id"
    values = [aws_ec2_transit_gateway.hk-tgw.id]
  }
}

# Accept the Attachment Peering request.
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "hk_accepter" {
  provider = aws.hongkong
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_peering_attachment.hk_accepter_peering_data.id
  tags = {
    Name = "terraform-hk-tgw-peering-accepter"
    Side = "Acceptor"
  }
}


#################################################################################################################
# NEW YORK TO TOKYO PEERING
resource "aws_ec2_transit_gateway_peering_attachment" "tgw_tokyo_ny_source_peering" {
  
  transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id  # Tokyo TGW ID
  peer_transit_gateway_id = aws_ec2_transit_gateway.ny-tgw.id # Peer/New York Transit Gateway ID to Peer WITH
  peer_region = "us-east-1"  # New York region to Peer WITH  

  tags = {
    Name = "Tokyo New York Peering Attachment"
    Side = "Creator"
  }
}


# Transit Gateway New York peering request needs to be accepted.
# Fetch the Peering Attachment that is created for the Gateway 5 New York.
data "aws_ec2_transit_gateway_peering_attachment" "ny_accepter_peering_data" {
  provider = aws.newyork
  depends_on = [aws_ec2_transit_gateway_peering_attachment.tgw_tokyo_ny_source_peering]
  filter {
    name   = "transit-gateway-id"
    values = [aws_ec2_transit_gateway.ny-tgw.id]
  }
}


# Accept the Attachment Peering request.
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "ny_accepter" {
  provider = aws.newyork
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_peering_attachment.ny_accepter_peering_data.id
  tags = {
    Name = "terraform-ny-tgw-peering-accepter"
    Side = "Acceptor"
  }
}


###############################################################################################################
# AUSTRALIA TO TOKYO PEERING
resource "aws_ec2_transit_gateway_peering_attachment" "tgw_tokyo_aus_source_peering" {
  
  transit_gateway_id = aws_ec2_transit_gateway.tokyo-tgw.id  # Tokyo TGW ID
  peer_transit_gateway_id = aws_ec2_transit_gateway.aus-tgw.id # Peer/Australia Transit Gateway ID to Peer WITH
  peer_region = "ap-southeast-2"  # Australia region to Peer WITH  

  tags = {
    Name = "Tokyo Australia Peering Attachment"
    Side = "Creator"
  }
}

# Transit Gateway Australia peering request needs to be accepted.
# Fetch the Peering Attachment that is created for the Gateway 6 Australia.
data "aws_ec2_transit_gateway_peering_attachment" "aus_accepter_peering_data" {
  provider = aws.australia
  depends_on = [aws_ec2_transit_gateway_peering_attachment.tgw_tokyo_aus_source_peering]
  filter {
    name   = "transit-gateway-id"
    values = [aws_ec2_transit_gateway.aus-tgw.id]
  }
}


# Accept the Attachment Peering request.
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "aus_accepter" {
  provider = aws.australia
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_peering_attachment.aus_accepter_peering_data.id
  tags = {
    Name = "terraform-aus-tgw-peering-accepter"
    Side = "Acceptor"
  }
}
