# Cloudwatch alarms for autoscaling group and autoscaling simple policy

# Autoscaling - Scaling Policy for High CPU

resource "aws_autoscaling_policy" "high_cpu" {
  name                   = "high-cpu"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.test-asg.name
}


# Create Alarm based on the autoscaling policy and send notification to SNS Topic
resource "aws_cloudwatch_metric_alarm" "asg-alarm" {
  alarm_name          = "alarm-asg-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.test-asg.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  ok_actions        = [aws_sns_topic.myasg_sns_topic.arn]
  alarm_actions = [
    aws_autoscaling_policy.high_cpu.arn,
    aws_sns_topic.myasg_sns_topic.arn

  ]
}