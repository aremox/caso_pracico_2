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
  default = "/home/vagrant/.ssh/"
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
"Standard_B2s",
"Standard_B1ms",
"Standard_B1ms",
"Standard_B1ls"
]
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
    {
     value = "${azurerm_public_ip.publicip.*.ip_address}"
     usuario = "${ var.usuario }"
     path_rsa = "${var.path_rsa}"
    }
  )
  filename = "/etc/ansible/inventory"
}