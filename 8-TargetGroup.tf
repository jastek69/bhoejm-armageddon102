# AUSTRALIA TARGET GROUPS for LOAD BALANCER
resource "aws_lb_target_group" "aus_lb_tg80" {
  provider = aws.australia
  name     = "aus-lb-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.AUS_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "aus-LB-TargetGroup"
    Service = "LoadBalancer"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "aus_lb_tg443" {
  provider = aws.australia
  name     = "aus-lb-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.AUS_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "aus-lb-TargetGroup443"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "TMMC"
  }
}




# CALIFORNIA TARGET GROUPS for LOAD BALANCER
resource "aws_lb_target_group" "ca_lb_tg80" {
  provider = aws.california
  name     = "ca-lb-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.CA_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "ca-LB-TargetGroup"
    Service = "LoadBalancer"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "ca_lb_tg443" {
  provider         = aws.california
  name     = "tmmc-ca-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.CA_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "ca-lb-TargetGroup443"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "TMMC"
  }
}


# HONG KONG TARGET GROUPS for LOAD BALANCER

resource "aws_lb_target_group" "hk_lb_tg80" {
  provider = aws.hongkong
  name     = "hk-lb-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.HK_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "hk-LB-TargetGroup"
    Service = "LoadBalancer"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "hk_lb_tg443" {
  provider         = aws.hongkong
  name     = "hk-lb-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.HK_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "hk-lb-TargetGroup443"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "TMMC"
  }
}


# LONDON TARGET GROUPS for LOAD BALANCER

resource "aws_lb_target_group" "lon_lb_tg80" {
  provider = aws.london
  name     = "lon-lb-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.LONDON_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "lon-LB-TargetGroup"
    Service = "LoadBalancer"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "lon_lb_tg443" {
  provider         = aws.london
  name     = "lon-lb-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.LONDON_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "lon-lb-TargetGroup443"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "TMMC"
  }
}



# NEW YORK TARGET GROUPS for LOAD BALANCER

resource "aws_lb_target_group" "ny_lb_tg80" {
  provider = aws.newyork
  name     = "ny-lb-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.NY_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "ny-LB-TargetGroup"
    Service = "LoadBalancer"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "ny_lb_tg443" {
  provider         = aws.newyork
  name     = "ny-lb-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.NY_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "ny-lb-TargetGroup443"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "TMMC"
  }
}


# SAO PAULO TARGET GROUPS for LOAD BALANCER
resource "aws_lb_target_group" "sao_lb_tg80" {
  provider = aws.saopaulo
  name     = "sao-lb-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.SAO_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "sao-LB-TargetGroup"
    Service = "LoadBalancer"
    Owner   = "Blackneto"
    Project = "Test"
  }
}


resource "aws_lb_target_group" "sao_lb_tg443" {
  provider         = aws.saopaulo
  name     = "sao-lb-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.SAO_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "sao-lb-TargetGroup443"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "TMMC"
  }
}


# TOKYO TARGET GROUPS for LOAD BALANCER
resource "aws_lb_target_group" "tok_lb_tg80" {
  #provider = aws.tokyo
  name     = "tok-lb-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.TOKYO_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tok-LB-TargetGroup"
    Service = "LoadBalancer"
    Owner   = "Blackneto"
    Project = "Test"
  }
}

# TOKYO TARGET GROUPS for LOAD BALANCER
resource "aws_lb_target_group" "tok_lb_tg443" {
  #provider = aws.tokyo
  name     = "tok-lb-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.TOKYO_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tok-lb-TargetGroup443"
    Service = "LoadBalancer"
    Owner   = "User"
    Project = "TMMC"
  }
}


# TOKYO TARGET GROUP for DATABASE
resource "aws_lb_target_group" "tok_db_tg443" {
  #provider = aws.tokyo
  name     = "tok-db-tg443"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.TOKYO_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tok-db-TargetGroup443"
    Service = "Database"
    Owner   = "User"
    Project = "TMMC"
  }
}
