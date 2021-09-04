variable "ami_id_robo" {
  default = "ami-074df373d6bafa625"
  validation {
    condition = length(var.ami_id_robo) > 1
    error_message = "Enter valid AMI??"
  }
}
variable "components" {}