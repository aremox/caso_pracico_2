variable "resource_group_name" {
  default = "rg-createbyTF"
}

variable "location_name" {
  default = "uksouth"
}

variable "network_name" {
  default = "vnet1"
}

variable "subnet_name" {
  default = "subnet1"
}

variable "num_maquinas" {
  default = 3
}

variable "usuario" {
  default = "azureuser"
}

variable "path_rsa" {
  default = "/root/.ssh/"
}

variable "disco" {
  default = 10
}

variable "availability-zones" {
  type = list(string)
  default = [
    "1", "2", "3",
    "1", "2", "3",
  ]
}

variable "availability-size" {
  type = list(string)
  default = [
    "Standard_B1ls",
    "Standard_A2_v2",
    "Standard_A2_v2",
    "Standard_B1ms"
  ]
}
