#Target Group for Port 80 app

#Australia Security Group
resource "aws_security_group" "ec2-aus-sg80" {
  provider = aws.australia
  vpc_id = aws_vpc.AUS_VPC.id
  /*
  tags = {
    Name = "ny-sg"
  } 
  */

  # Allow HTTP access from anywhere for testing (consider restricting later)
  ingress {
    description = "MyHomePage"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 


  # Allow all outbound traffic for simplicity (consider restricting later)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "ec2-aus-sg80"
    # Name: "${var.env_prefix}-sg-80"
    Service = "web-application"
    Owner   = "Balactus"
    Planet  = "Taa"
  }

}


#California Security Group
resource "aws_security_group" "ec2-cali-sg80" {
  provider = aws.california
  vpc_id = aws_vpc.CA_VPC.id 
  /*
  tags = {
    Name = "cali-sg"
  } 
  */

  # Allow HTTP access from anywhere for testing (consider restricting later)
  ingress {
    description = "MyHomePage"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 


  # Allow all outbound traffic for simplicity (consider restricting later)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "ec2-cali-sg80"
    # Name: "${var.env_prefix}-sg-80"
    Service = "web-application"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


# HONG KONG Security Group
resource "aws_security_group" "ec2-hk-sg80" {
  provider = aws.hongkong
  vpc_id = aws_vpc.HK_VPC.id
  /*
  tags = {
    Name = "hk-sg"
  } 
  */

  # Allow HTTP access from anywhere for testing (consider restricting later)
  ingress {
    description = "MyHomePage"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 


  # Allow all outbound traffic for simplicity (consider restricting later)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "ec2-hongkong-sg80"
    # Name: "${var.env_prefix}-sg-80"
    Service = "web-application"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


# LONDON Security Group
resource "aws_security_group" "ec2-lon-sg80" {
  provider = aws.london  
  vpc_id = aws_vpc.LONDON_VPC.id
  /*
  tags = {
    Name = "london-sg"
  } 
  */

  # Allow HTTP access from anywhere for testing (consider restricting later)
  ingress {
    description = "MyHomePage"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 


  # Allow all outbound traffic for simplicity (consider restricting later)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "ec2-london-sg80"
    # Name: "${var.env_prefix}-sg-80"
    Service = "web-application"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


# NEW YORK Security Group
resource "aws_security_group" "ec2-ny-sg80" {
  provider = aws.newyork
  vpc_id = aws_vpc.NY_VPC.id
  /*
  tags = {
    Name = "ny-sg"
  } 
  */

  # Allow HTTP access from anywhere for testing (consider restricting later)
  ingress {
    description = "MyHomePage"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 


  # Allow all outbound traffic for simplicity (consider restricting later)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "ec2-ny-sg80"
    # Name: "${var.env_prefix}-sg-80"
    Service = "web-application"
    Owner   = "Balactus"
    Planet  = "Taa"
  }

}



# SAO PAULO Security Group
resource "aws_security_group" "ec2-sao-sg80" {
  provider = aws.saopaulo
  
  vpc_id = aws_vpc.SAO_VPC.id
  /*
  tags = {
    Name = "saopaulo-sg"
  } 
  */

  # Allow HTTP access from anywhere for testing (consider restricting later)
  ingress {
    description = "MyHomePage"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 


  # Allow all outbound traffic for simplicity (consider restricting later)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "ec2-sao-sg80"
    # Name: "${var.env_prefix}-sg-80"
    Service = "web-application"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


#Tokyo Security Group
resource "aws_security_group" "ec2-tokyo-sg80" {
  #provider = aws.tokyo
  vpc_id = aws_vpc.TOKYO_VPC.id 
  /*
  tags = {
    Name = "tokyo-sg"
  } 
  */

  # Allow HTTP access from anywhere for testing (consider restricting later)
  ingress {
    description = "MyHomePage"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 


  # Allow all outbound traffic for simplicity (consider restricting later)
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name    = "ec2-tokyo-sg80"
    # Name: "${var.env_prefix}-sg-80"
    Service = "web-application"
    Owner   = "Balactus"
    Planet  = "Taa"
  }

}




# LOAD BALANCER SEC GROUPS on Port 443

# AUSTRALIA Port 443 Security Group for Load Balancer 443 - add ingress for 443
resource "aws_security_group" "aus-LB01-sg443" {
  provider         = aws.australia
  name        = "aus_LB01-SG01-443"
  description = "ec2-aus-sg443"
  vpc_id      = aws_vpc.AUS_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ec2-aus-sg443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}



# CALIFORNIA Port 443 Security Group for Load Balancer 443 - add ingress for 443
resource "aws_security_group" "cali-LB01-sg443" {
  provider         = aws.california
  name        = "ca_LB01-SG01-443"
  description = "ec2-cali-sg443"
  vpc_id      = aws_vpc.CA_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ec2-cali-sg443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}



# Hong Kong Port 443 Security Group for Load Balancer 443 - add ingress for 443
resource "aws_security_group" "hk-LB01-sg443" {
  provider         = aws.hongkong
  name        = "hk_LB01-SG01-443"
  description = "ec2-hk-sg443"
  vpc_id      = aws_vpc.HK_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ec2-hk-sg443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}



# LONDON Port 443 Security Group for Load Balancer 443 - add ingress for 443
resource "aws_security_group" "lon-LB01-sg443" {
  provider         = aws.london 
  name        = "lon_LB01-SG01-443"
  description = "ec2-lon-sg443"
  vpc_id      = aws_vpc.LONDON_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ec2-lon-sg443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# NEW YORK Port 443 Security Group for Load Balancer 443 - add ingress for 443
resource "aws_security_group" "ny-LB01-sg443" {
  provider         = aws.newyork
  name        = "ny_LB01-SG01-443"
  description = "ec2-ny-sg443"
  vpc_id      = aws_vpc.NY_VPC.id

   ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ec2-ny-sg443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}



# SAO PAULO Port 443 Security Group for Load Balancer 443 - add ingress for 443
resource "aws_security_group" "sao-LB01-sg443" {
  provider         = aws.saopaulo
  name        = "sao_LB01-SG01-443"
  description = "ec2-sao-sg443"
  vpc_id      = aws_vpc.SAO_VPC.id

   ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ec2-sao-sg443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# TOKYO Port 443 Security Group for Load Balancer 443 - add ingress for 443
resource "aws_security_group" "tok-LB01-sg443" {
  #provider         = aws.tokyo
  name        = "tok_LB01-SG01-443"
  description = "tok-lb-sg443"
  vpc_id      = aws_vpc.TOKYO_VPC.id

   ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tok_LB01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}






# Syslog Server Security Group on Port 443

# AUSTRALIA Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "aus_SL01-SG01-443" {
  provider         = aws.australia
  name        = "aus_SL01-SG01-443"
  description = "aus_SL01-SG01-443"
  vpc_id      = aws_vpc.AUS_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "aus_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# CALIFORNIA Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "ca_SL01-SG01-443" {
  provider         = aws.california
  name        = "ca_SL01-SG01-443"
  description = "ca_SL01-SG01-443"
  vpc_id      = aws_vpc.CA_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ca_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }

}


# HONG KONG Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "hk_SL01-SG01-443" {
  provider         = aws.hongkong
  name        = "hk_SL01-SG01-443"
  description = "hk_SL01-SG01-443"
  vpc_id      = aws_vpc.HK_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "hk_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}



# LONDON Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "lon_SL01-SG01-443" {
  provider         = aws.london
  name        = "lon_SL01-SG01-443"
  description = "lon_SL01-SG01-443"
  vpc_id      = aws_vpc.LONDON_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "lon_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}



# NEW YORK Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "ny_SL01-SG01-443" {
  provider         = aws.newyork
  name        = "ny_SL01-SG01-443"
  description = "ny_SL01-SG01-443"
  vpc_id      = aws_vpc.NY_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ny_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# SAO PAULO Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "sao_SL01-SG01-443" {
  provider         = aws.saopaulo
  name        = "sao_SL01-SG01-443"
  description = "sao_SL01-SG01-443"
  vpc_id      = aws_vpc.SAO_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "sao_SL01-SG01-443"
    Service = "application1"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}



# TOKYO Port 443 Security Group for Syslog Server 443 - add ingress for 443
resource "aws_security_group" "tok_SL01-SG01-443" {
  #provider         = aws.tokyo
  name        = "tok_SL01-SG01-443"
  description = "tok_SL01-SG01-443"
  vpc_id      = aws_vpc.TOKYO_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tok_SL01-SG01-443"
    Service = "syslog"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}


# TOKYO Port 443 Security Group for Database Server 443 - add ingress for 443
resource "aws_security_group" "tok_DB01-SG01-443" {
  #provider         = aws.tokyo
  name        = "tok_DB01-SG01-443"
  description = "tok_DB01-SG01-443"
  vpc_id      = aws_vpc.TOKYO_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Secure"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "Secure"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "tok_SL01-SG01-443"
    Service = "database"
    Owner   = "Blackneto"
    Planet  = "Taa"
  }
}
