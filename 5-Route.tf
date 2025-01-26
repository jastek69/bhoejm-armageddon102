/* TRANSIT GATEWAY ROUTE ATTACHMENT */
# Route to LONDON_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_london" {
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.241.0.0/16"  # Replace with actual VPC2 CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to SAO_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_sao" {
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.243.0.0/16"  # Replace with actual VPC3 CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to CA_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_california" {  
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.244.0.0/16"  # California CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to Hong Kong VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_hongkong" {
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.245.0.0/16"  # Hong Kong CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id 

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to NY_VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_ny" {
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.246.0.0/16"  # New York CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id 

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}


# Route to Australia VPC via Transit Gateway Attachment
resource "aws_route" "TOKYO_to_australia" {
  route_table_id         = aws_route_table.TOKYO_route_table.id
  destination_cidr_block = "10.247.0.0/16"  # Australia CIDR block
  transit_gateway_id     = aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment.transit_gateway_id 

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tokyo_attachment]
}
