# AUSTRALIA LOAD BALANCER
resource "aws_lb" "aus_lb01" {
  provider           = aws.australia
  name               = "aus-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aus-LB01-sg443.id]
  subnets            = [
    aws_subnet.australia-public-ap-southeast-2a.id,
    aws_subnet.australia-public-ap-southeast-2b.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "aus_LoadBalancer"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "aus-http" {
  provider          = aws.australia
  load_balancer_arn = aws_lb.aus_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aus_lb_tg80.arn
  }
}

data "aws_acm_certificate" "cert-aus" {
  provider = aws.australia
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "aus-https" {
  provider          = aws.australia
  load_balancer_arn = aws_lb.aus_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert-aus.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aus_lb_tg443.arn
  }
}

output "aus-lb_dns_name" {
  value       = aws_lb.aus_lb01.dns_name
  description = "The DNS name of the Australia Load Balancer."
}




##########################################################################################################################
# CALIFORNIA LOAD BALANCER
resource "aws_lb" "ca_lb01" {
  provider           = aws.california
  name               = "ca-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.cali-LB01-sg443.id]
  subnets            = [
    aws_subnet.cali-public-us-west-1a.id,
    aws_subnet.cali-public-us-west-1b.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "ca_LoadBalancer"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "ca-http" {
  provider          = aws.california
  load_balancer_arn = aws_lb.ca_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ca_lb_tg80.arn
  }
}

data "aws_acm_certificate" "cert-ca" {
  provider = aws.california
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "ca-https" {
  provider          = aws.california
  load_balancer_arn = aws_lb.ca_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert-ca.arn


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ca_lb_tg443.arn
  }
}

output "ca-lb_dns_name" {
  value       = aws_lb.ca_lb01.dns_name
  description = "The DNS name of the California Load Balancer."
}



##########################################################################################################################
# HONG KONG LOAD BALANCER
resource "aws_lb" "hk_lb01" {
  provider           = aws.hongkong
  name               = "hk-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hk-LB01-sg443.id]
  subnets            = [
    aws_subnet.hk-public-ap-east-1a.id,
    aws_subnet.hk-public-ap-east-1b.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "hk_LoadBalancer"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "hk-http" {
  provider          = aws.hongkong
  load_balancer_arn = aws_lb.hk_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hk_lb_tg80.arn
  }
}

data "aws_acm_certificate" "cert-hk" {
  provider = aws.hongkong
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "hk-https" {
  provider          = aws.hongkong
  load_balancer_arn = aws_lb.hk_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert-hk.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hk_lb_tg443.arn
  }
}

output "hk-lb_dns_name" {
  value       = aws_lb.hk_lb01.dns_name
  description = "The DNS name of the Hong Kong Load Balancer."
}




##########################################################################################################################
# LONDON LOAD BALANCER
resource "aws_lb" "lon_lb01" {
  provider           = aws.london
  name               = "lon-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lon-LB01-sg443.id]
  subnets            = [
    aws_subnet.london-public-eu-west-2a.id,
    aws_subnet.london-public-eu-west-2b.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "lon_LoadBalancer"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "lon-http" {
  provider          = aws.london
  load_balancer_arn = aws_lb.lon_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lon_lb_tg80.arn
  }
}

data "aws_acm_certificate" "cert-lon" {
  provider = aws.london
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "lon-https" {
  provider          = aws.london
  load_balancer_arn = aws_lb.lon_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert-lon.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lon_lb_tg443.arn
  }
}

output "lon-lb_dns_name" {
  value       = aws_lb.lon_lb01.dns_name
  description = "The DNS name of the London Load Balancer."
}




##########################################################################################################################
# NEW YORK LOAD BALANCER
resource "aws_lb" "ny_lb01" {
  provider           = aws.newyork
  name               = "ny-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ny-LB01-sg443.id]
  subnets            = [
    aws_subnet.newyork-public-us-east-1a.id,
    aws_subnet.newyork-public-us-east-1b.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "ny_LoadBalancer"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "ny-http" {
  provider          = aws.newyork
  load_balancer_arn = aws_lb.ny_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ny_lb_tg80.arn
  }
}

data "aws_acm_certificate" "cert-ny" {
  provider = aws.newyork
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "ny-https" {
  provider          = aws.newyork
  load_balancer_arn = aws_lb.ny_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert-ny.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ny_lb_tg443.arn
  }
}

output "ny-lb_dns_name" {
  value       = aws_lb.ny_lb01.dns_name
  description = "The DNS name of the New York Load Balancer."
}




##########################################################################################################################
# SAO PAULO LOAD BALANCER
resource "aws_lb" "sao_lb01" {
  provider           = aws.saopaulo
  name               = "sao-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sao-LB01-sg443.id]
  subnets            = [
    aws_subnet.sao-public-sa-east-1a.id,
    aws_subnet.sao-public-sa-east-1b.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "ny_LoadBalancer"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "sao-http" {
  provider          = aws.saopaulo
  load_balancer_arn = aws_lb.sao_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sao_lb_tg80.arn
  }
}

data "aws_acm_certificate" "cert-sao" {
  provider = aws.saopaulo
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "sao-https" {
  provider          = aws.saopaulo
  load_balancer_arn = aws_lb.sao_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert-sao.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sao_lb_tg443.arn
  }
}

output "sao-lb_dns_name" {
  value       = aws_lb.sao_lb01.dns_name
  description = "The DNS name of the Sao Paulo Load Balancer."
}




##########################################################################################################################
#TOKYO LOAD BALANCER
resource "aws_lb" "tok_lb01" {
  #provider           = aws.tokyo
  name               = "tok-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tok-LB01-sg443.id]
  subnets            = [
    aws_subnet.tokyo-public-ap-northeast-1a.id,
    aws_subnet.tokyo-public-ap-northeast-1c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "tok_LoadBalancer"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "tok-http" {
  
  load_balancer_arn = aws_lb.tok_lb01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tok_lb_tg80.arn
  }
}

data "aws_acm_certificate" "cert-tok" {  
  
  domain   = "jastek.click"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "tok-https" {
  
  load_balancer_arn = aws_lb.tok_lb01.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert-tok.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tok_lb_tg443.arn
  }
}

output "tok-lb_dns_name" {
  value       = aws_lb.tok_lb01.dns_name
  description = "The DNS name of the Tokyo Load Balancer."
}


