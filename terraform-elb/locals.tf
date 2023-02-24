# set the names and tags as per local values

locals {
  owners      = var.department
  environment = var.environment
  name        = "${var.department}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}

locals {
  instance-name = { "private-1" = {}, "private-2" = {} }
}