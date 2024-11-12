variable "ami" {
  description = "ami id for instance_type"
  type = string
}
variable "instance_type" {
  description = "instance type"
  type = string
}
variable "key_name" {
  description = "key for login"
  type =   string
}
variable "instance_name" {
    description = "name of instance"
   type = string  
}
variable "iam_instance_profile" {
  description = "The IAM instance profile to attach to the EC2 instance"
  type        = string
}
variable "avzone" {
    description = "ebs volume where we created"
    type = string
}
variable "v_size" {
    description = "size of ebs_volume"
    type = number 
}
variable "volumename" {
    description = "ebs_volume name"
    type = string  
}
variable "d_name" {
    description = "ebs_volume_devicename"
    type = string  
}
variable "vpc_id" {
    description = "vpc id "
    type = string  
} 
variable "security_group_name" {
    description = "security group name"
    type = string 
}
variable "to_port" {
    description = "allow port number"
    type = number
  
}
variable "from_port" {
    description = "from_port number"
    type = number
  
}
variable "ip_protocol" {
    description = "name of protocol"
    type = string
}

