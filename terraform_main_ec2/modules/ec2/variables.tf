variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "sg_id" {}
variable "key_name" {}
variable "availability_zone" {}
variable "volume_size" {
  type = number
}
variable "instance_profile" {

  description = "IAM Instance Profile"

  type = string

}