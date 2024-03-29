# # AWS IAM Policy which will provide required permissions to this canary
# resource "aws_iam_policy" "cw_canary_iam_policy" {
#   name        = "cw-canary-iam-policy"
#   path        = "/"
#   description = "CloudWatch Canary Synthetic IAM Policy"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "VisualEditor0",
#         "Effect" : "Allow",
#         "Action" : "cloudwatch:PutMetricData",
#         "Resource" : "*",
#         "Condition" : {
#           "StringEquals" : {
#             "cloudwatch:namespace" : "CloudWatchSynthetics"
#           }
#         }
#       },
#       {
#         "Sid" : "VisualEditor1",
#         "Effect" : "Allow",
#         "Action" : [
#           "s3:PutObject",
#           "logs:CreateLogStream",
#           "s3:ListAllMyBuckets",
#           "logs:CreateLogGroup",
#           "logs:PutLogEvents",
#           "s3:GetBucketLocation",
#           "xray:PutTraceSegments"
#         ],
#         "Resource" : "*"
#       }
#     ]
#   })
# }

# # AWS IAM Role attaching the policy and attach this role to canary
# resource "aws_iam_role" "cw_canary_iam_role" {
#   name        = "cw-canary-iam-role"
#   description = "CloudWatch Synthetics lambda execution role for running canaries"
#   path        = "/service-role/"
#   #assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json # (not shown)
#   assume_role_policy  = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
#   managed_policy_arns = [aws_iam_policy.cw_canary_iam_policy.arn]
# }

# # Create S3 Bucket to store artifacts related to canary
# resource "aws_s3_bucket" "cw_canary_bucket" {
#   bucket        = "cw-canary-bucket-${random_pet.test.id}"
#   force_destroy = true

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# # S3 Bucket Access control list (ACL)

# resource "aws_s3_bucket_ownership_controls" "s3-ownership" {
#   bucket = aws_s3_bucket.cw_canary_bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_acl" "s3-acl" {
#   depends_on = [aws_s3_bucket_ownership_controls.s3-ownership]

#   bucket = aws_s3_bucket.cw_canary_bucket.id
#   acl    = "private"
# }

# # AWS Cloudwatch Canary 

# resource "aws_synthetics_canary" "test-canary" {
#   name                 = "my-canary-test"
#   artifact_s3_location = "s3://${aws_s3_bucket.cw_canary_bucket.id}/website2"
#   execution_role_arn   = aws_iam_role.cw_canary_iam_role.arn
#   handler              = "synthetic-file/nodejs/node_modules/synthetic-file.handler"
#   zip_file             = "synthetic-file/synthetic-fileV1.zip"
#   runtime_version      = "syn-nodejs-puppeteer-3.9"
#   start_canary         = true

#   run_config {
#     active_tracing     = true
#     memory_in_mb       = 960
#     timeout_in_seconds = 60
#   }
#   schedule {
#     expression = "rate(1 minute)"
#   }
# }


# # AWS CloudWatch Metric Alarm for Synthetics Heart Beat Monitor when availability is less than 10 percent
# resource "aws_cloudwatch_metric_alarm" "synthetics_alarm_app1" {
#   alarm_name          = "Synthetics-Alarm-App1"
#   comparison_operator = "LessThanThreshold"
#   datapoints_to_alarm = "1"
#   evaluation_periods  = "1"
#   metric_name         = "SuccessPercent"
#   namespace           = "CloudWatchSynthetics"
#   period              = "300"
#   statistic           = "Average"
#   threshold           = "90"
#   treat_missing_data  = "breaching" # You can also add "missing"
#   dimensions = {
#     CanaryName = "aws_synthetics_canary.test-canary"
#   }
#   alarm_description = "Synthetics alarm metric: SuccessPercent  LessThanThreshold 90"
#   ok_actions        = [aws_sns_topic.myasg_sns_topic.arn]
#   alarm_actions     = [aws_sns_topic.myasg_sns_topic.arn]
# }