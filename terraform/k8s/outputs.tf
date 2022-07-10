output "network_interface_public_ip" {
  description = "Lista de ips publicas asignadas"
  value = "${azurerm_public_ip.publicip.*.ip_address}"
}
output "network_interface_private_ip" {
  description = "Lista de ips privadas asignadas"
  value       = azurerm_network_interface.nic.*.private_ip_address
}

output "nombre_maquinas" {
  description = "Lista de nombres de maquinas"
  value       = azurerm_linux_virtual_machine.vm.*.name
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl",
    {
     pubip = "${azurerm_public_ip.publicip.*.ip_address}"
     priip = "${azurerm_network_interface.nic.*.private_ip_address}"
     usuario = "${ var.usuario }"
     path_rsa = "${var.path_rsa}"
    }
  )
  filename = "/etc/ansible/inventory"
}

resource "local_file" "ansible_variables" {
  content = templatefile("var_main.yml.tmpl",
    {
     pubip = "${azurerm_public_ip.publicip.*.ip_address}"
     priip = "${azurerm_network_interface.nic.*.private_ip_address}"
     nombre = "${azurerm_linux_virtual_machine.vm.*.name}"
     usuario = "${ var.usuario }"
     path_rsa = "${var.path_rsa}"
    }
  )
  filename = "/etc/ansible/playbook/roles/vars/main.yml"
}