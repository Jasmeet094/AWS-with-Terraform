# # DEfine Log Group for CIS Alarms

# resource "aws_cloudwatch_log_group" "cis_log_group" {
#   name = "cis-log-group-${random_pet.test.id}"
# }



# # CIS alarms for aws account

# module "all_cis_alarms" {
#   source  = "terraform-aws-modules/cloudwatch/aws//examples/cis-alarms"
#   version = "2.1.0"

#   disabled_controls = ["DisableOrDeleteCMK", "VPCChanges"]

#   log_group_name = aws_cloudwatch_log_group.cis_log_group.name
#   alarm_actions  = ["aws_sns_topic.myasg_sns_topic.arn"]
#   tags           = local.common_tags
# }