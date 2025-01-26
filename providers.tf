# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
# Tokyo - HQ region


# Tokyo is Default Region
provider "aws" {
  region = "ap-northeast-1"
}



# Australia - Additional provider configuration for Asia Pacific region
# reference this as `aws.australia`.
provider "aws" {
  alias  = "australia"
  region = "ap-southeast-2"
}


# California - additional provider configuration for Asia Pacific region
# reference this as `aws.california`.
provider "aws" {
  alias  = "california"
  region = "us-west-1"
}


# Hong Kong - additional provider configuration for Asia Pacific region
# reference this as `aws.hongkong`.
provider "aws" {
  alias  = "hongkong"
  region = "ap-east-1"
}


# London - additional provider configuration for Asia Pacific region
# reference this as `aws.london`.
provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}


# New York (Virginia)- additional provider configuration for Asia Pacific region
# reference this as `aws.ny`.
provider "aws" {
  alias  = "newyork"
  region = "us-east-1"
}


# Sao Paulo - additional provider configuration for Asia Pacific region
# reference this as `aws.london`.
provider "aws" {
  alias  = "saopaulo"
  region = "sa-east-1"
}


# Cloudwatch Requirement for us-east-1
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}


/*
provider "aws" {
  region = "local.region"
}

locals {
  name   = "ex-tgw-${replace(basename(path.cwd), "_", "-")}"
  region = "ap-northeast-1a"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-eks"
    GithubOrg  = "terraform-aws-transit-gateway"
  }
}
*/




# Providers - terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46.0" 
    }
  }
  /* cloud  { 
    
    organization = "BHoEjM" 

    workspaces { 
      name = "zion-armageddon-bhoejm" 
    } */ 
  } 
/* } */

