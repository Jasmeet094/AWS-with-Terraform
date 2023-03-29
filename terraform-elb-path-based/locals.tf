# local values for tags 

locals {
  name       = "${var.name}-${var.env}"
  department = var.department
  common_tags = {
    name       = local.name
    department = local.department
  }
}

