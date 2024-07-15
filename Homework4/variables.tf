variable aws_region {
  description = "Provide region"
  type = string
  default = ""
}
variable ami_id {
  description = "Provide AMI id"
  type = string
  default = ""
}
variable instance_type {
  description = "Provide instance type"
  type = string
  default = ""
}
variable instace_count {
  description = "Provide number of instances"
  type = number 
  default = 1
}
variable kp_name {
  description = "Provide instance name"
  type = string 
  default = ""
}
# variable az_name {
#   description = "Provide availability zones"
#   type = string
#   #default = ""
# }

variable open_ports {
  description = "Provide ports to open"
  type        = list(number)
  default     = [22, 80, 443]
}