# Description: This Terraform file is used to create Auto Scaling Groups in the New York region.
# The file contains the following resources:
# - Auto Scaling Group for port 80
# - Auto Scaling Group for port 443

resource "aws_autoscaling_group" "sao_asg80" {
  provider              = aws.saopaulo
  name_prefix           = "sao-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.sao-public-sa-east-1a.id,    
    aws_subnet.sao-public-sa-east-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.sao_lb_tg80.arn]

  launch_template {
    id      = aws_launch_template.ec2-sao-80.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "ca-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "sao_scaling_policy" {
  provider         = aws.saopaulo
  name                   = "sao-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.sao_asg80.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "sao_asg80_attachment" {
  provider               = aws.saopaulo
  autoscaling_group_name = aws_autoscaling_group.sao_asg80.name
  lb_target_group_arn    = aws_lb_target_group.sao_lb_tg80.arn
}


# ASG 443 - Secure
resource "aws_autoscaling_group" "sao_asg443" {
  provider              = aws.saopaulo
  name_prefix           = "sao443-auto-scaling-group-"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.sao-private-sa-east-1a.id,
    aws_subnet.sao-private-sa-east-1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.sao_lb_tg443.arn]

  launch_template {
    id      = aws_launch_template.ec2-sao-443.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "sao-instance-443"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "sao443_scaling_policy" {
  provider               = aws.saopaulo
  name                   = "sao-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.sao_asg443.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "sao443_asg_attachment" {
  provider               = aws.saopaulo
  autoscaling_group_name = aws_autoscaling_group.sao_asg443.name
  lb_target_group_arn    = aws_lb_target_group.sao_lb_tg443.arn
}
