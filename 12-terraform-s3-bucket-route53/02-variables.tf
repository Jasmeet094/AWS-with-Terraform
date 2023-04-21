# Variables used for buckets

variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}


variable "tags" {
  description = "Tags for the bucket"
  type        = map(string)

}

variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}