# host names to forward traffic based on host header

variable "dns_name_app1" {
  description = "This is app1 host name"
  type        = string
  default     = "app1.jasmeetdevops.com"
}


variable "dns_name_app2" {
  description = "This is app2 host name"
  type        = string
  default     = "app2.jasmeetdevops.com"
}