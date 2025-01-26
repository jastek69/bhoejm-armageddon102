# Description: This file is used to create a Route53 record for the load balancer. 
# This will allow the load balancer to be accessed via a domain name. The domain name is specified in the data block.
# The record is created using the aws_route53_record resource. 
# The alias block is used to specify the target of the record, which is the load balancer. 
# The zone_id and dns_name of the load balancer are used to create the alias. 
# The name of the record is set to the domain name specified in the data block.
# The type of the record is set to "A" to create an A record. 
# The evaluate_target_health attribute is set to true to enable health checks on the target of the record. 
# The zone_id of the domain is specified in the data block to associate the record with the correct zone.      
# terraform import aws_route53_record.www Z0226086O3FCYG2A1C50.jastek.click    
# hosted Zone ID: 



data "aws_route53_zone" "main-tokyo" {
   
  name         = "jastek.click"  # The domain name you want to look up
  private_zone = false
}


resource "aws_route53_record" "www-tokyo" {
  
  zone_id = data.aws_route53_zone.main-tokyo.zone_id
  name    = "jastek.click"
  type    = "A"

  alias {
    name                   = aws_lb.tok_lb01.dns_name
    zone_id                = aws_lb.tok_lb01.zone_id
    evaluate_target_health = true
  }
}
