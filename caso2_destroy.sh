#!/bin/bash
# 
# AUTOR: Iván Arenas Morante
# TITULO: Caso practico 2 
# DESCRIPCIÓN:
# Script para lanzar terraform + ansible de manera conjunta 
# 
cd /etc/terraform/k8s/
terraform destroy -auto-approve

exit $?
