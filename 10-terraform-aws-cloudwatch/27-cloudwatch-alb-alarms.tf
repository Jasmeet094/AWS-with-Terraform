# Define CloudWatch Alarms for ALB
# Alert if HTTP 5xx errors are more than threshold value
resource "aws_cloudwatch_metric_alarm" "alb_5xx_errors" {
  alarm_name          = "5xx-errors-are-high"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = "2"
  evaluation_periods  = "3"
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "120"
  statistic           = "Sum"
  threshold           = "10"
  treat_missing_data  = "missing"
  dimensions = {
    LoadBalancer = module.alb.lb_arn_suffix
  }
  alarm_description = "This metric monitors ALB HTTP 4xx errors "
  ok_actions        = [aws_sns_topic.myasg_sns_topic.arn]
  alarm_actions     = [aws_sns_topic.myasg_sns_topic.arn]
}


## Metric names for more ELB related alarms

# Per AppELB Metrics
## - HTTPCode_ELB_5XX_Count
## - HTTPCode_ELB_502_Count
## - TargetResponseTime

# Per AppELB, per TG Metrics
## - UnHealthyHostCount
## - HealthyHostCount
## - HTTPCode_Target_4XX_Count
## - TargetResponseTime