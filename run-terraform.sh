#!/bin/bash
#while [ $# -gt 0 ]; do
#  case "$1" in
#    --env=*)
#      env="${1#*=}"
#      ;;
#    *)
#      printf "***************************\n"
#      printf "* Error: Invalid argument.*\n"
#      printf "***************************\n"
#      exit 1
#  esac
#  shift
#done
#
#if [ $env = "prod" ]
#then
#    az account set --subscription "f33ccf42-cf78-4a08-a541-9dc6261b6972"
#elif [ $env = "preprod" ] 
#then
#    az account set --subscription "b938f909-9c6a-4a44-ac36-ff75d1678393"
#elif  [ $env = "devtest" ]
#then
#    az account set --subscription "073e5e7a-1db4-425a-8667-c79ab59f82dc"
#fi
az account set --subscription "c9783dbe-c442-46a0-89e8-1803fa9375e7"
terraform init -backend-config="azure-backend.conf" -reconfigure
terraform apply 