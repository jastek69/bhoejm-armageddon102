# AWS Transit Gateway Inter-Region peering
/*
The following are best practices for your transit gateway design:

Use a separate subnet for each transit gateway VPC attachment. For each subnet, use a small CIDR, for example /28, so that you have more addresses for EC2 resources. When you use a separate subnet, you can configure the following:
Keep the inbound and outbound network ACLs associated with the transit gateway subnets open.
Depending on your traffic flow, you can apply network ACLs to your workload subnets.
Create one network ACL and associate it with all of the subnets that are associated with the transit gateway. Keep the network ACL open in both the inbound and outbound directions.
Associate the same VPC route table with all of the subnets that are associated with the transit gateway, unless your network design requires multiple VPC route tables (for example, a middle-box VPC that routes traffic through multiple NAT gateways).
Use Border Gateway Protocol (BGP) Site-to-Site VPN connections. If your customer gateway device or firewall for the connection supports multipath, enable the feature.
Enable route propagation for AWS Direct Connect gateway attachments and BGP Site-to-Site VPN attachments.
When migrating from VPC peering to use a transit gateway. An MTU size mismatch between VPC peering and the transit gateway might result in some packets dropping for asymmetric traffic. Update both VPCs at the same time to avoid jumbo packets dropping due to size mismatches.
You do not need additional transit gateways for high availability, because transit gateways are highly available by design.
Limit the number of transit gateway route tables unless your design requires multiple transit gateway route tables.
For redundancy, use a single transit gateway in each Region for disaster recovery.
For deployments with multiple transit gateways, we recommend that you use a unique Autonomous System Number (ASN) for each of your transit gateways. You can also use inter-Region peering. For more information, see Building a global network using AWS Transit Gateway Inter-Region peering.
*/


# TOKYO Transit Gateway - MAIN
resource "aws_ec2_transit_gateway" "tokyo-tgw" {
  description = "tg-tokyo-database"
  auto_accept_shared_attachments = "enable"
  tags = {
    Name = "Tokyo Transit Gateway"
  }
}

# LONDON Transit Gateway
resource "aws_ec2_transit_gateway" "london-tgw" {
  provider = aws.london
  description = "tg-london-database"
  auto_accept_shared_attachments = "enable"
  tags = {
    Name = "London Transit Gateway"
  }
}

# Sao Paulo Transit Gateway
resource "aws_ec2_transit_gateway" "sao-tgw" {
  provider = aws.saopaulo
  description = "tg-sao-database"
  auto_accept_shared_attachments = "enable"
  tags = {
    Name = "Sao Paulo Transit Gateway"
  }
}

# California Transit Gateway
resource "aws_ec2_transit_gateway" "ca-tgw" {
  provider = aws.california
  description = "tg-ca-database"
  auto_accept_shared_attachments = "enable"
  tags = {
    Name = "California Transit Gateway"
  }
}

# HONG KONG Transit Gateway
resource "aws_ec2_transit_gateway" "hk-tgw" {
  provider = aws.hongkong
  description = "tg-hk-database"
  auto_accept_shared_attachments = "enable"
  tags = {
    Name = "Hong Kong Transit Gateway"
  }
}


# NEW YORK Transit Gateway
resource "aws_ec2_transit_gateway" "ny-tgw" {
  provider = aws.newyork
  description = "tg-ny-database"
  auto_accept_shared_attachments = "enable"
  tags = {
    Name = "New York Transit Gateway"
  }
}


# AUSTRALIA Transit Gateway
resource "aws_ec2_transit_gateway" "aus-tgw" {
  provider = aws.australia
  description = "tg-aus-database"
  auto_accept_shared_attachments = "enable"
  tags = {
    Name = "Australia Transit Gateway"
  }
}
