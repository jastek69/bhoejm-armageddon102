
/*
resource "aws_wafv2_web_acl" "ca_waf_acl" {
  provider    = aws.california
  name        = "ca-web-acl"
  description = "Web ACL for California"
  scope       = "REGIONAL"
  default_action {
    allow {}
  }
  
  
  rule {
    name     = "IPBlockRule"
    priority = 1
    action {
      block {}
    }
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.ca_ip_block_list.arn
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "IPBlockRule"
      sampled_requests_enabled   = false
    }
  }


  rule {
    name     = "AWSManagedRulesKnownBadInputs"
    priority = 2
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "AWSManagedRulesKnownBadInputs"
      sampled_requests_enabled   = false
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "ca_WebACL"
    sampled_requests_enabled   = false
  }
  tags = {
    Name    = "ca-web-acl"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_wafv2_ip_set" "ca_ip_block_list" {
  provider           = aws.california
  name               = "ca-ip-block-list"
  description        = "List of blocked IP addresses"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
addresses = [
    "1.188.0.0/16",
    "1.80.0.0/16",
    "101.144.0.0/16",
    "101.16.0.0/16"
]
 tags = {
    Name    = "ip-block-list"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_wafv2_web_acl_association" "ca_waf_alb_association" {
  provider    = aws.california
  resource_arn = aws_lb.ca_lb01.arn
  web_acl_arn  = aws_wafv2_web_acl.ca_waf_acl.arn
}
#AWS-AWSManagedRulesKnownBadInputsRuleSet
#AWS-AWSManagedRulesAmazonIpReputationList
#AWS-AWSManagedRulesAnonymousIpList
#AWS-AWSManagedRulesCommonRuleSet
#AWS-AWSManagedRulesLinuxRuleSet

*/


########################################################################################################
# TOKYO WAF

resource "aws_wafv2_web_acl" "tok_waf_acl" {
  #provider    = aws.california
  name        = "tok-web-acl"
  description = "Web ACL for Tokyo"
  scope       = "REGIONAL"
  default_action {
    allow {}
  }
  
  
  rule {
    name     = "IPBlockRule"
    priority = 1
    action {
      block {}
    }
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.tok_ip_block_list.arn
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "IPBlockRule"
      sampled_requests_enabled   = false
    }
  }


  rule {
    name     = "AWSManagedRulesKnownBadInputs"
    priority = 2
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "AWSManagedRulesKnownBadInputs"
      sampled_requests_enabled   = false
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "tok_WebACL"
    sampled_requests_enabled   = false
  }
  tags = {
    Name    = "tok-web-acl"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_wafv2_ip_set" "tok_ip_block_list" {
  #provider           = aws.california
  name               = "tok-ip-block-list"
  description        = "List of blocked IP addresses"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
addresses = [
    "1.188.0.0/16",
    "1.80.0.0/16",
    "101.144.0.0/16",
    "101.16.0.0/16"
]
 tags = {
    Name    = "ip-block-list"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}


resource "aws_wafv2_web_acl_association" "tok_waf_alb_association" {
  resource_arn = aws_lb.tok_lb01.arn
  web_acl_arn  = aws_wafv2_web_acl.tok_waf_acl.arn
}
#AWS-AWSManagedRulesKnownBadInputsRuleSet
#AWS-AWSManagedRulesAmazonIpReputationList
#AWS-AWSManagedRulesAnonymousIpList
#AWS-AWSManagedRulesCommonRuleSet
#AWS-AWSManagedRulesLinuxRuleSet
