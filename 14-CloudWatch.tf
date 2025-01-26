# CloudWatch log group in Tokyo - 

/*
import {
    to = aws_sns_topic.user_updates
    id = "arn:aws:sns:ap-northeast-1:015195098145:my-topic"
    }
  */



resource "aws_cloudwatch_log_group" "tokyo_lambda_group" {
  #provider = aws.us-east-1
  name              = "/route53/querylog/"
  retention_in_days = 60
  #kms_key_id        = var.kms_key_id # For encrypting data
}


data "aws_iam_policy_document" "route53-query-logging-policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:log-group:/aws/route53/*"]

    principals {
      identifiers = ["route53.amazonaws.com"]
      type        = "Service"
    }
  }
}


# IAM role for a Lambda function
resource "aws_iam_role" "tokyo_lambda_group_role" {
  name               = "tokyo_lambda_group_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Action : "sts:AssumeRole",
        Effect : "Allow",
        Principal : {
          "Service" : "lambda.amazonaws.com"
        }
      }
    ]
  })
}


# File
data "archive_file" "tokyo_lambda" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "tokyo_lambda_function_payload.zip"
}


# Attach the role to Lambda function
resource "aws_lambda_function" "tokyo_lambda_function" {
  filename      = "tokyo_lambda_function_payload.zip"
  function_name = "tokyo_lambda_function_name"
  role          = aws_iam_role.tokyo_lambda_group_role.arn
  handler       = "index.test"

  source_code_hash = data.archive_file.tokyo_lambda.output_base64sha256

  runtime = "nodejs18.x"
  
  depends_on    = [aws_cloudwatch_log_group.tokyo_lambda_group]
}



# Logging Policy Function
resource "aws_iam_policy" "tokyo_lambda_logging_policy" {
  name   = "tokyo-lambda-logging-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Action : [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect : "Allow",
        Resource : "arn:aws:logs:*:*:*"
      }
    ]
  })
}


# Attach the logging policy to the role
resource "aws_iam_role_policy_attachment" "tokyo_lambda_logging_policy_attachment" {
  role = aws_iam_role.tokyo_lambda_group_role.id
  policy_arn = aws_iam_policy.tokyo_lambda_logging_policy.arn
}



resource "aws_cloudwatch_log_resource_policy" "route53-query-logging-policy" {
  #provider = aws.us-east-1

  policy_document = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "route53.amazonaws.com"
        },
        "Action": [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource": "${aws_cloudwatch_log_group.tokyo_lambda_group.arn}:*"
        #"Resource": "arn:aws:logs:*:*:log-group:/route53/querylog/*"
      }
    ]
  })
  policy_name     = "route53-query-logging-policy"
}



resource "aws_route53_query_log" "tokyo_com_log" {
  #provider = aws.us-east-1
  cloudwatch_log_group_arn = aws_cloudwatch_log_group.tokyo_lambda_group.arn
  zone_id                  = data.aws_route53_zone.main-tokyo.zone_id
  depends_on               = [aws_cloudwatch_log_resource_policy.route53-query-logging-policy]
}



resource "aws_sns_topic" "user_updates" {  
  
  name            = "user-updates-topic"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}




# S3 Bucket
/*
resource "aws_s3_bucket" "jasopstokyo" {
  bucket = "jasopstokyo"

  tags = {
    Name        = "jasopstokyoS3"
    Environment = "Dev"
  }
}
*/



resource "aws_route53_resolver_query_log_config" "jasopstokyos3" {
  name            = "jasopstokyoS3"
  destination_arn = aws_s3_bucket.jasopstokyo.arn # arn:aws:s3:::jasopstokyo

  tags = {
    Environment = "Dev"
  }
}




resource "aws_cloudwatch_metric_alarm" "tmmc_metric_alarm" {
  alarm_name                = "tmmc_metric_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}



resource "aws_cloudwatch_metric_alarm" "tok_scaling_policy" {
  alarm_name          = "terraform-test-foobar5"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  #scaling_adjustment  = 4
  #adjustment_type     = "ChangeInCapacity"
  #cooldown            = 300

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.tok_asg80.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.tok_scaling_policy.arn]
}


resource "aws_cloudwatch_metric_alarm" "request_error_rate" {
  alarm_name                = "terraform-test-foobar"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  threshold                 = 10
  alarm_description         = "Request error rate has exceeded 10%"
  insufficient_data_actions = []

  metric_query {
    id          = "e1"
    expression  = "m2/m1*100"
    label       = "Error Rate"
    return_data = "true"
  }

  metric_query {
    id = "m1"

    metric {
      metric_name = "RequestCount"
      namespace   = "AWS/ApplicationELB"
      period      = 120
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = "app/web"
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "HTTPCode_ELB_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = 120
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = "app/web"
      }
    }
  }
}


resource "aws_cloudwatch_metric_alarm" "cpu_anomaly_detection" {
  alarm_name                = "terraform-test-anomaly"
  comparison_operator       = "GreaterThanUpperThreshold"
  evaluation_periods        = 2
  threshold_metric_id       = "e1"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []

  metric_query {
    id          = "e1"
    expression  = "ANOMALY_DETECTION_BAND(m1)"
    label       = "CPUUtilization (Expected)"
    return_data = "true"
  }

  metric_query {
    id          = "m1"
    return_data = "true"
    metric {
      metric_name = "CPUUtilization"
      namespace   = "AWS/EC2"
      period      = 120
      stat        = "Average"
      unit        = "Count"

      dimensions = {
        InstanceId = "i-abc123"
      }
    }
  }
}

/*
resource "aws_cloudwatch_metric_alarm" "nlb_healthyhosts" {
  alarm_name          = "alarmname"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/NetworkELB"
  period              = 60
  statistic           = "Average"
  threshold           = var.logstash_servers_count
  alarm_description   = "Number of healthy nodes in Target Group"
  actions_enabled     = "true"
  alarm_actions       = [aws_sns_topic.user_updates.arn]
  ok_actions          = [aws_sns_topic.user_updates.arn]
  dimensions = {
    TargetGroup  = aws_lb_target_group.tok_lb_tg443.arn_suffix
    LoadBalancer = aws_lb.tok_lb01.arn_suffix
  }
}
*/
