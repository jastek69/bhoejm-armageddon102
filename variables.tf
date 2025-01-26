

# variable image_name {} # for AMI

variable "kms_key_id" {
  type = string
  description = "The ID of the AWS KMS key to use for encryption."
  sensitive = true  
}
