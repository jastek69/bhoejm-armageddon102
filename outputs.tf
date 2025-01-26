# LAUNCH TEMPLATE OUTPUTS

output "ca_launch_template_id_80" {

  description = "The ID of the launched template"

  value = aws_launch_template.ec2-cali-80.id

}

output "ca_launch_template_arn_80" {

  description = "The ARN of the launched template"

  value = aws_launch_template.ec2-cali-80.arn

}


output "ca_launch_template_id_443" {

  description = "The ID of the launched template"

  value = aws_launch_template.ec2-cali-443.id

}

output "ca_launch_template_arn_443" {

  description = "The ARN of the launched template"

  value = aws_launch_template.ec2-cali-443.arn

}



# Transit Gateway Outputs
output "tokyo_tgw_id" {
  value = aws_ec2_transit_gateway.tokyo-tgw.id
}

output "london_tgw_id" {
  value = aws_ec2_transit_gateway.london-tgw.id
}

output "sao_tgw_id" {
  value = aws_ec2_transit_gateway.sao-tgw.id
}

output "ca_tgw_id" {
  value = aws_ec2_transit_gateway.ca-tgw.id
}

output "hk_tgw_id" {
  value = aws_ec2_transit_gateway.hk-tgw.id
}


output "ny_tgw_id" {
  value = aws_ec2_transit_gateway.ny-tgw.id
}


output "aus_tgw_id" {
  value = aws_ec2_transit_gateway.aus-tgw.id
}



# Load Balancer Outputs - Listener

#AUSTRALIA
output "aus-acm_certificate_arn" {
  value = data.aws_acm_certificate.cert-aus.arn
}

#CALIFORNIA
output "ca-acm_certificate_arn" {
  value = data.aws_acm_certificate.cert-ca.arn
}

#HONG KONG
output "hk-acm_certificate_arn" {
  value = data.aws_acm_certificate.cert-hk.arn
}

#LONDON
output "lon-acm_certificate_arn" {
  value = data.aws_acm_certificate.cert-lon.arn
}

#NEW YORK
output "ny-acm_certificate_arn" {
  value = data.aws_acm_certificate.cert-ny.arn
}

#SAO PAULO
output "sao-acm_certificate_arn" {
  value = data.aws_acm_certificate.cert-sao.arn
}

#TOKYO
output "tok-acm_certificate_arn" {
  value = data.aws_acm_certificate.cert-tok.arn
}

output "web-address" {
  value = "${aws_instance.web.public_dns}:8080"
}
