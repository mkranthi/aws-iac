variable "role_name" {
    description = "this is the role creating for s3 bucket access for ec2"
    type = string
}

variable "iam_policy" {
    description = "policy give access to s3 bucket"
    type = string
}
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

 